# tradesteal

A small datapack implementing the ability to merge trades between villagers.

## Intention

## Usage

## Functions

### Available

#### `clean` 
Resets scoreboard variables (`arrayLength`, `targetIndex`, `currentIndex`) for objective `svm_score`; removes contents `WorkingPrimary` and `WorkingSecondary` from storage `svm_store`.

Also run internally when successfully merging trades.

#### `clear`
Removes the presence of this datapack by clearing the scheduled `tick` function, running `clean`, and removing the `svm_score` scoreboard objective.

### Internal

#### `load`
Sets up this datapack by adding the `svm_score` scoreboard objective and starting the `tick` loop.

Called through Minecraft's *`load.json`*.
