# Move last item to front
data modify storage schwer:svm_store WorkingArray prepend from storage schwer:svm_store WorkingArray[-1]
data remove storage schwer:svm_store WorkingArray[-1]
scoreboard players remove currentIndex svm_score 1
function schwer_villager_merge:counter_cycle_array_loop
