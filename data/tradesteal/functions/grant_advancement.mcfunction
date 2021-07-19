# Adapted from gateways:grant_advancement and kitsune:grant_advancement

scoreboard players set 0 sts_score 0

# Prep `Candidate`
data modify storage schwer:sts_store Candidate set from storage schwer:sts_store Thrower

# `match` becomes `1` if was able to set `Candidate` (i.e. player UUID ≠ Thrower UUID, ∴ player is *not* the thrower)
execute store result score match sts_score run data modify storage schwer:sts_store Candidate set from entity @s UUID

# `match` is `0`, ∴ *is* thrower and should get advancement
execute if score match sts_score = 0 sts_score run advancement grant @s only tradesteal:anchor

# Clean up
scoreboard players reset 0 sts_score
scoreboard players reset match sts_score
data remove storage schwer:sts_store Candidate
# (`Thrower` to be cleaned up by caller function)
