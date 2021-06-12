# for (; currentIndex > targetIndex; i--)
# Refer to `operate`
execute if score currentIndex sts_score > targetIndex sts_score run function tradesteal:counter_cycle_array
