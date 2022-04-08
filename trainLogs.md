# UDA
## Baseline
1. duke2market

``` yaml
# 2022-03-21

# config diff
samples_per_gpu: 16 -> 8

# train performance
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

# train performance
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
