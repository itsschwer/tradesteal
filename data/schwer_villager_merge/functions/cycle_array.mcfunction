# Move first item to end (by copying to end then removing first)
# Reference: https://www.youtube.com/watch?v=Bt6xD8vE7Pw
data modify storage schwer:svm_store WorkingArray append from storage schwer:svm_store WorkingArray[0]
data remove storage schwer:svm_store WorkingArray[0]
scoreboard players add currentIndex svm_score 1
function schwer_villager_merge:cycle_array_loop