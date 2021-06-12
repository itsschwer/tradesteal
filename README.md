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

#### `anchor_broken`
Called from `anchor_tick` when the corresponding Crying Obsidian is broken.

Handles removing the presence of the relevant anchor.

#### `anchor_tick`
The update loop for each anchor. Handles finding the primary and secondary villagers for trade merging, checking if the anchor should be destroyed, and initiating trade merges.

#### `counter_cycle_array_loop`
Used by `operate` to handle trade merging logic.

#### `counter_cycle_array`
Used by `operate` to handle trade merging logic.

#### `cycle_array_loop`
Used by `operate` to handle trade merging logic.

#### `cycle_array`
Used by `operate` to handle trade merging logic.

#### `load`
Sets up this datapack by adding the `svm_score` scoreboard objective and starting the `tick` loop.

Called through Minecraft's *`load.json`*.

#### `operate`

#### `setup_structure`
Handles the creation of an anchor and consuming an *Offering*.

Run when `validate_structure` succeeds.

#### `tick`
The main update loop. Handles the creation of anchors, as well as the anchor update loop.

Initialises from `load`.

#### `validate_structure`
Checks the area around a dropped Nether Star named *Offering* to determine if a valid anchor can be summoned.

Run from `tick` when a single (i.e. non-stacked) *Offering* lands on the ground.
