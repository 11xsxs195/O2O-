# O2O 优惠券核销预测

这是一个基于 XGBoost 的 O2O 优惠券核销预测项目。项目会先对赛题数据做划分和特征工程，再训练模型，最后输出提交文件 `submission.csv`。

## 项目结构

- `ccf_offline_stage1_train.csv`：离线训练集
- `ccf_online_stage1_train.csv`：线上训练集
- `ccf_offline_stage1_test_revised.csv`：测试集，也就是预测集
- `sample_submission.csv`：提交样例
- `code/charles/season 1/`：主要代码目录

## 运行流程

代码默认按下面顺序执行：

1. `data_split.py`：按时间窗口拆分训练集、验证集和预测集，并生成线上/线下记录
2. `feature_extract.py`：提取用户、商家、优惠券、用户-商家交互等特征
3. `gen_data.py`：把原始数据和特征合并，生成模型训练所需数据
4. `xgb.py`：训练 XGBoost 模型，并输出预测结果和模型文件

可以直接运行 `run_all.sh` 完成整套流程。

## 主要输出

训练完成后，会在 `code/charles/season 1/data/` 下生成以下内容：

- `data_split/`：拆分后的训练、验证和预测数据
- `model/model_时间戳/`：模型文件、参数文件、特征重要性、验证结果等
- `submission/submission_时间戳/submission.csv`：最终提交文件

## submission 文件说明

`submission.csv` 保存的是预测集里每条领券记录对应的核销概率。文件内容通常是：

- `User_id`
- `Coupon_id`
- `Date_received`
- `Probability_consumed`

其中 `Probability_consumed` 是模型预测的核销概率，数值越大，表示该优惠券更可能被核销。

## 特征说明

本项目的特征主要分为五类：

- 用户线下特征
- 用户线上特征
- 商家特征
- 用户-商家交互特征
- 优惠券特征

另外，项目还使用了预测区间内的部分统计特征，这些特征利用了赛题数据中的时间信息，在原始比赛场景里属于较强的时序特征。

## 使用方式

在 `code/charles/season 1/` 目录下执行：

```bash
bash run_all.sh
```

## 数据与下载

数据文件较大且受赛题协议约束，本仓库仅保留代码与说明。数据下载与使用请参见 [DATA.md](DATA.md)。原始赛题页面：https://tianchi.aliyun.com/competition/entrance/231593

如果只想单独训练模型，也可以先完成数据划分和特征生成，再运行 `xgb.py`。
