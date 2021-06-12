# for (; currentIndex > targetIndex; i--)
# Refer to `operate`
execute if score currentIndex svm_score > targetIndex svm_score run function schwer_villager_merge:counter_cycle_array
