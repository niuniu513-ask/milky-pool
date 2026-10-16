param([string]$Url = 'http://127.0.0.1:8765/', [string]$BrowserSession = 'milky-pool-regression', [switch]$KeepOpen)
$ErrorActionPreference = 'Stop'
$sessionName = $BrowserSession
$browserExe = Join-Path (Split-Path (Get-Command agent-browser).Source) 'node_modules/agent-browser/bin/agent-browser-win32-x64.exe'
$testRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$gameRoot = Split-Path -Parent $testRoot
$sourceText = Get-Content -LiteralPath (Join-Path $testRoot 'regression.js') -Raw -Encoding utf8
$wrapped = 'window.poolTestReport=null; window.poolTestError=null; window.poolTestPending=true; ' + $sourceText.Trim() + '.then(r=>{window.poolTestReport=r;window.poolTestPending=false}).catch(e=>{window.poolTestError=e.stack;window.poolTestPending=false}); "started"'
$sourceEncoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($wrapped))
& $browserExe --session $sessionName open $Url > $null
$reports = @()
try {
    foreach ($size in @(@(1280,800),@(844,390),@(390,844),@(568,320),@(320,568))) {
        & $browserExe --session $sessionName set viewport $size[0] $size[1] > $null
        $raw = & $browserExe --session $sessionName eval -b $sourceEncoded --json
        if ($LASTEXITCODE -ne 0) { throw "Browser check failed: $raw" }
        $deadline = [DateTime]::UtcNow.AddSeconds(30)
        do {
            Start-Sleep -Milliseconds 300
            $poll = & $browserExe --session $sessionName eval '({pending:window.poolTestPending,error:window.poolTestError,result:window.poolTestReport})' --json | ConvertFrom-Json
            if ($poll.data.result.error) { throw $poll.data.result.error }
        } while ($poll.data.result.pending -and [DateTime]::UtcNow -lt $deadline)
        $result = @{ success = $poll.success; data = @{ result = $poll.data.result.result } }
        if (!$result.success -or !$result.data.result.passed) { throw "Regression failed: $raw" }
        $reports += @{ viewport = $size; result = $result.data.result }
        Write-Output ("{0}x{1}: {2} passed" -f $size[0],$size[1],$result.data.result.passed)
    }
    $reports | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $testRoot 'results.json') -Encoding utf8
} finally {
    if (!$KeepOpen) { & $browserExe --session $sessionName close > $null }
}


