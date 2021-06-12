execute as @a at @s in schwer:void_wastes run tp @s[y=-128,dy=-128] ~ 128 ~

# including any of the dx/dy/dz arguments will automatically include the others as 0. So @e[y=#,dy=0] is the same as @e[y=#,dx=0,dy=0,dz=0]. We can get around this by moving the execution to the entity in question with at @s; that way it doesn't matter that dx and dz are zero, since we're right on top of the entity's X and Z coords anyway.
