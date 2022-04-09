# UDA
## Baseline
1. duke2market

``` yaml
# 2022-03-21

# config diff
samples_per_gpu: 16 -> 8

# training performance
Mean AP: 68.6%
CMC Scores:
  top-1          83.2%
  top-5          94.7%
  top-10         97.2%
Validating time:  0:00:09.894261
* Finished epoch  49  mAP: 68.6%  best: 68.6% *

# test performance
Mean AP: 45.2%
CMC Scores:
  top-1          69.5%
  top-5          85.5%
  top-10         89.7%
Testing time:  0:01:24.449394
```

2. market2duke

```yaml
# 2022-04-07

# config diff
samples_per_gpu: 16 -> 8
lr: 0.00035 -> 0.00014

# training performance
Mean AP: 63.5%
CMC Scores:
  top-1          82.9%
  top-5          92.2%
  top-10         94.6%
Validating time:  0:00:12.625861
* Finished epoch  49  mAP: 63.5%  best: 63.5% *

# test performance
Mean AP: 53.4%
CMC Scores:
  top-1          71.5%
  top-5          83.9%
  top-10         87.4%
Testing time:  0:01:24.386154
```

> 出现了严重过拟合，计划尝试将学习率与batch size做正相关调整。

```yaml
# 2022-04-08

# config diff
samples_per_gpu: 16 -> 8
lr: 0.00035 -> 0.00017
weight_decay: 0.0005 - > 0.001

# training performance
Mean AP: 60.3%
CMC Scores:
  top-1          80.6%
  top-5          90.2%
  top-10         93.1%
Validating time:  0:00:12.612290
* Finished epoch  49  mAP: 60.3%  best: 60.3% *

# test performance
Mean AP: 49.8%
CMC Scores:
  top-1          68.5%
  top-5          80.4%
  top-10         85.1%
Testing time:  0:01:24.502350
```
> 调整了学习率及weight decay之后不仅过拟合没有解决，
> 反而训练准确率和测试准确率都下降了。
> 
> 查看训练log发现，在epoch=34时，mAP就已达到60%。猜测是因为weight decay调整得过大导致。 