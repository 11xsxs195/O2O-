# DATA 下载说明

来源：阿里云天池竞赛 — https://tianchi.aliyun.com/competition/entrance/231593

说明：原始赛题数据不应直接包含在开源仓库中（体积大且可能受竞赛条款限制）。本仓库保留代码与示例，真实数据请在天池竞赛页面下载。

下载与使用步骤：

1. 登录天池（需要阿里云账号），打开赛题页面： https://tianchi.aliyun.com/competition/entrance/231593
2. 在「数据」页签下载数据包（通常包含 `ccf_offline_stage1_train.csv`、`ccf_online_stage1_train.csv`、`ccf_offline_stage1_test_revised.csv`、`sample_submission.csv` 等文件）。
3. 将下载得到的原始 CSV 文件放到本项目根目录或 `code/charles/season 1/data/` 对应位置。
4. 为方便发布仓库，我们建议将原始数据放到仓库外的目录。例如：

```bash
# 在仓库上层创建数据归档目录（只需运行一次）
mkdir ../O2O_data_archive
```

5. 项目中包含 `tools/move_data.py` 脚本，可把仓内的 CSV 移动到 `../O2O_data_archive` 并生成占位文件。运行方式（Python 3）：

```bash
python tools/move_data.py
```

合规提示：请遵守天池竞赛的数据使用协议，未经允许不要重新分发原始数据。若竞赛说明允许公开引用数据集，请在引用处保留赛题链接与署名。
