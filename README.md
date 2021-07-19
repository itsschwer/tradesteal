# tradesteal
[![Datapacks](https://img.shields.io/badge/See_more-datapacks-C7A978.svg)](https://github.com/itsschwer?tab=repositories&q=&type=&language=mcfunction&sort=)

A small datapack implementing the ability to merge trades between villagers.

## Intention

This datapack aims to provide a balanced, survival-friendly way of creating partially-custom villagers by merging existing trades between villagers.

The main feature of this is the ability to reduce duplicate trades across villagers by compacting actually desired trades into less villagers *(e.g. merging an Enchanted Book trade onto a librarian to replace a Book and Quill trade)*.

### Balancing
The feature is balanced by the materials required to enable trade stealing *(see [Mechanics § Anchor](#anchor))* and the requirement that the donor villager is killed in the process *(see [Mechanics § Trade Stealing](#trade-stealing))*.

Minor balancing elements include: preventing a recipient villager from unlocking new trades (*∴ players need to max out the level of the villager before trading to maximise the number of available slots*); and requiring a splash potion or tipped arrow for each trade steal *(again, see [Mechanics § Trade Stealing](#trade-stealing) for full details)*.

## Guide
*This datapack was developed in 1.16.5 (`"pack_format": 6`) but should be compatible with versions using an equivalent or greater `pack_format`, barring major changes to commands/datapacks.*

1. Download:
    - [Repository as a `.zip`](https://github.com/itsschwer/tradesteal/archive/refs/heads/master.zip) *(Code > Download ZIP)*
    - [Release](https://github.com/itsschwer/tradesteal/releases) *(will need to unzip before installing into a save)*
2. Install into a save like any other datapack.
3. Open the advancement menu to the *Schwer* tab to view the intended hints.

## Mechanics

### Anchor

Requires a structure consisting of (from east to west):
- A Blast Furnace named *Replace*
- A block of Crying Obisidian
- A Blast Furnace named *Steal*

Anchors are activated by dropping a Nether Star named *Offering* on top of the block of Crying Obsidian. This action will also provide feedback on the validity of the structure.

Breaking an Anchor's Crying Obsidian will deactivate the Anchor.

### Trade Stealing

A villager on top of the Crying Obsidian is tagged as being the recipient of stolen trades *(indicated by end rod particles)*.

The next closest villager within 5 blocks of the anchor is the trade donor *(indicated by soul particles)*. This villager is killed upon a successful trade steal.

To operate, place a number of items in the input slots of each Blast Furnace corresponding to the desired trade offer slots. Then apply a potion effect to the recipient villager *(e.g. via splash potion)*.

For example, 6 items in the *Steal* Blast Furnace and 2 items in the *Replace* Blast Furnace will replace the second trade of the recipient villager with the sixth trade from the donor villager. If the number of items placed in a Blast Furnace is greater than the number of trades offered by the corresponding villager, then trade stealing will operate using the last trade slot offered by that villager.

Once a villager receives a trade, they can no longer unlock new trades.

## Functions
*Split between 'Available' (i.e. fine to call using `/function`) and 'Internal' (not intended to be called by `/function`).*

*Ordered alphabetically.*

### Available

#### `clean` 
- Resets scoreboard variables (`arrayLength`, `targetIndex`, `currentIndex`) for objective `sts_score`
- Removes contents `WorkingArray` and `OfferCopy` from storage `sts_store`

Also run internally when a trade steal is successful.

#### `clear`
Removes the presence of this datapack by:
- Clearing the scheduled `tick` function
- Running `clean`
- Removing the `sts_score` scoreboard objective
- Killing all anchors
- Removing `sts_recipient` and `sts_donor` tags from villagers

*Note that since it is possible that unloaded chunks contain anchors and tagged villagers, this can't guarantee to completely remove the presence of this datapack (i.e. some villagers may remain tagged and some marker area effect clouds may still exist).*

### Internal

#### `anchor_broken`
Called from `anchor_tick` when the corresponding Crying Obsidian is broken.

Handles removing the presence of the relevant anchor.

#### `anchor_tick`
The update loop for each anchor. Handles finding the recipient and donor villagers for trade merging, checking if the anchor should be destroyed, and initiating trade merges.

#### `counter_cycle_array_loop`
Used by `operate` to handle trade merging logic.

#### `counter_cycle_array`
Used by `operate` to handle trade merging logic.

#### `cycle_array_loop`
Used by `operate` to handle trade merging logic.

#### `cycle_array`
Used by `operate` to handle trade merging logic.

#### `grant_advancement`
Handles the logic for granting an advancement to the player who dropped the *Offering* in creating an anchor.

Run from `setup_structure`.

#### `load`
Sets up this datapack by adding the `sts_score` scoreboard objective and starting the `tick` loop.

Called through Minecraft's *`load.json`*.

#### `operate`
Refer to [**Trade Stealing**](#trade-stealing) or `operate.mcfunction`.

#### `setup_structure`
Handles the creation of an anchor and consuming an *Offering*, as well as granting an advancement to the player responsible (if applicable).

Run when `validate_structure` succeeds.

#### `tick`
The main update loop. Handles the creation of anchors, as well as the anchor update loop.

Initialises from `load`.

#### `validate_structure`
Checks the area around a dropped Nether Star named *Offering* to determine if a valid anchor can be summoned.

Run from `tick` when a single (i.e. non-stacked) *Offering* lands on the ground.

## References
*(Roughly in personal use order)*
- [Vanilla Tweaks — Thunder Shrine (v1.1.0)](https://vanillatweaks.net/picker/datapacks/)
    - *Used roughly to set up the structure mechanic.*
- [Minecraft Wiki — Commands](https://minecraft.fandom.com/wiki/Commands)
    - *Used heavily throughout datapack.*
- [SirBenet — Teleport entities relatively to the center of a block](https://gaming.stackexchange.com/questions/207273/teleport-entities-relatively-to-the-center-of-a-block)
    - *Used to center anchors.*
- [Cloud Wolf — NBT Arrays in Minecraft [1.14+]](https://www.youtube.com/watch?v=Bt6xD8vE7Pw)
    - *Introduced the array cycling method to dynamically extract values.*
- [Fabian Röling — /data modify and NBT paths](https://gaming.stackexchange.com/questions/351488/would-someone-give-a-thorough-explanation-of-1-14-minecrafts-data-modify)
    - *Didn't read it all but it helped point me in the right direction.*
