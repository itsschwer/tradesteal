# for (var currentIndex = 1; currentIndex < targetIndex && currentIndex < arrayLength; i++)
# Refer to `operate`
execute if score currentIndex sts_score < targetIndex sts_score if score currentIndex sts_score < arrayLength sts_score run function tradesteal:cycle_array
