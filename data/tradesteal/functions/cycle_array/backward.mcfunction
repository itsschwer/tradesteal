# Move last item to front
data modify storage schwer:tradesteal WorkingArray prepend from storage schwer:tradesteal WorkingArray[-1]
data remove storage schwer:tradesteal WorkingArray[-1]
scoreboard players remove currentIndex tradesteal 1
function tradesteal:cycle_array/backward_check
