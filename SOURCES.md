# 台球游戏参考

查阅日期：2026-10-15。以下为实际读取的官方页面，参考其设计方向；没有复制这些游戏的代码、图像或音频。

| 游戏 | 核实的设计信息 | 本项目采用 |
| --- | --- | --- |
| [8 Ball Pool](https://www.miniclip.com/games/8-ball-pool) | 官方强调对战与精进球技 | 保留并修复三档本地 AI，强化当前回合、分组与自由球提示 |
| [Cue Club 2](https://store.steampowered.com/app/366690/Cue_Club_2_Pool__Snooker/) | 练习模式、不同水平对手、多种球桌与球杆、荣誉陈列、触屏兼容 | 四种奶娃陪练球型、球桌解锁、图鉴及七项荣誉 |
| [Pool Nation](https://store.steampowered.com/app/254440/Pool_Nation/) | 可关闭瞄准辅助、球桌和球杆装扮、花式击球及慢动作查看 | 可关闭的几何辅助线、一次碰库路线、球桌主题；未实现其花式编辑器或回放功能 |

## 奶娃素材与配色

- 九张原有 WebP 形态图继续用于球体与收集进度；另加入下文记录的六组网络奶蛙动作素材。
- 母球采用现有「奶娃崽」立绘，搭配奶油白包边、暖金高光；去掉原来的凸眼表情。
- 界面配色以奶油黄、蛋黄、蜂蜜金为主，浅奶绿作为 AI 对战辅色；奶茶、荷塘、草莓球桌沿用这一柔和明度体系。
- 新增玩法、界面和存档均在本地单个 HTML 内运行，不依赖外部 CDN。

## 规则边界

AI 模式为十五球休闲八球规则：不要求报袋，开球打进黑 8 直接判负，不宣称完整复现 WPA 比赛规则。瞄准线为几何参考，不预测速度衰减、旋转与后续连撞。

## 奶娃元素补充检索

2026-10-15 实际浏览以下公开页面：

- [哔哩哔哩：奶蛙搜索](https://search.bilibili.com/all?keyword=%E5%A5%B6%E8%9B%99)：可见奶家人、奶狗、大笑奶蛙及绘制教程等用户创作。
- [哔哩哔哩：奶蛙 奶娃搜索](https://search.bilibili.com/all?keyword=%E5%A5%B6%E8%9B%99%20%E5%A5%B6%E5%A8%83)：参考奶娃家族的圆润轮廓、奶黄主色及夸张庆祝表情。
- [奶蛙｜请你们吃我奶奶做的奶黄包，你们可以和我一起玩吗](https://www.bilibili.com/video/BV15Qe76cEPt/)：实际读取标题及页面信息，从“奶黄包”主题提取应援贴纸设计方向。该页面注明未经授权禁止转载，因此未下载、嵌入或转载视频、封面与音频。

新增奶黄包贴纸由本地样式绘制，奶家人头像继续使用原有内嵌素材。上述页面是创作参考，不作为角色官方设定或素材授权依据。百度搜索遇到验证页后未继续，最终使用可访问的哔哩哔哩页面完成检索。

## 实际加入的网络动作素材（2026-10-15）

- 来源：[timerring/codex-pet-naiwa](https://github.com/timerring/codex-pet-naiwa)，实际读取 README、LICENSE、pet.json，并下载 [精灵表](https://raw.githubusercontent.com/timerring/codex-pet-naiwa/main/naifrog/spritesheet.webp)。原文件保存在 `assets/naiwa/source-spritesheet.webp`，SHA256：`E86E8B61584DF7897EF7A60C3BA6A8DD92A798B3A5BDBA5080351A896927F588`。
- 将 192×208 单帧缩小为 96×104，裁出待机、招手、捧腹大笑、低头、害羞、思考六组透明 WebP 动画，每组另附静态替代。球体图片内嵌到 HTML；动作图以项目内 `assets/naiwa/` 相对路径加载，保留该目录即可离线运行。系统设置减少动态效果时自动使用静态图。
- 使用位置：大厅迎宾与大笑应援、陪练头像随回合／自由球／进球状态切换、暂停与收藏页、清台与对战结算。保留原球体形态和收藏编号。
- 致谢：timerring；其仓库列出的上游 [Nitrogen216/awesome_pets](https://github.com/Nitrogen216/awesome_pets)、[LynnShaw/naiwa-pet](https://github.com/LynnShaw/naiwa-pet)。仓库 README 与许可证原文保存在 `docs/pet-source-readme.md`、`docs/pet-source-license.txt`。
- 授权边界：来源明确写明「本仓库原创内容使用 MIT License。Credits 中的第三方素材不在 MIT 授权范围内」。因此不能将这组角色图片宣称为已获 MIT 授权或官方授权；本项目保留来源及原许可说明，不将第三方角色素材重新授权。
- 同时核实了[会大笑的奶蛙免费模型视频](https://www.bilibili.com/video/BV1iQpB6hECJ/)；描述称模型稍后发布到工坊，页面注明未经授权禁止转载，未提取该视频素材。

