# Move last item to front
data modify storage schwer:svm_store WorkingPrimary prepend from storage schwer:svm_store WorkingPrimary[-1]
data remove storage schwer:svm_store WorkingPrimary[-1]
scoreboard players remove currentIndex svm_score 1
function schwer_villager_merge:cycle_primary_counter_loop
