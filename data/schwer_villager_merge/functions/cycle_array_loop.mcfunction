# for (var currentIndex = 1; currentIndex < targetIndex && currentIndex < arrayLength; i++)
# Refer to `operate`
execute if score currentIndex svm_score < targetIndex svm_score if score currentIndex svm_score < arrayLength svm_score run function schwer_villager_merge:cycle_array
