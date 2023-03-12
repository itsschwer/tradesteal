# Move first item to end
data modify storage schwer:tradesteal WorkingArray append from storage schwer:tradesteal WorkingArray[0]
data remove storage schwer:tradesteal WorkingArray[0]
scoreboard players add currentIndex tradesteal 1
function tradesteal:cycle_array/forward_check
