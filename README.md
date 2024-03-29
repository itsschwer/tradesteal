# tradesteal
[![Datapacks](https://img.shields.io/badge/See_more-datapacks-C7A978.svg)](https://github.com/itsschwer?tab=repositories&q=&type=&language=mcfunction&sort=)

A small datapack implementing the ability to merge trades between villagers.

## Intention
This datapack aims to provide a survival-friendly way of creating partially-custom villagers by merging existing trades between villagers.

The main objective of this is the ability to reduce the number of villagers that need to be kept by replacing unwanted trades with desired ones *(e.g. merging an Enchanted Book trade onto a librarian to replace a Book and Quill trade)*.

### Balancing
This datapack primarily aims to provide a quality-of-life feature, however, some minor balancing considerations were made:
- the donor villager is killed in the process *(see [Mechanics](#mechanics))*.
- the recipient villager becomes unable to unlock new trades
    - *∴ players need to max out the level of the villager before trade stealing in order to maximise the number of available slots*

## Guide
*This datapack was developed in 1.16.5 (`"pack_format": 6`) but should be compatible with versions using an equivalent or greater `pack_format`, barring major changes to commands/datapacks.*

1. Download:
    - [Repository as a `.zip`](https://github.com/itsschwer/tradesteal/archive/refs/heads/master.zip) *(Code > Download ZIP)*
    - [Release](https://github.com/itsschwer/tradesteal/releases) *(will need to unzip before installing into a save)*
2. Install into a save like any other datapack.
3. Open the advancement menu to the *Schwer* tab to view the intended hints.

## Mechanics

### Initiation
To initiate a trade steal, a player must hold:
- Paper named *Replace* in their main hand
- Paper named *Steal* in their off-hand

The amount of Paper each hand determines which trade slot is stolen from the donor and replaced in the recipient.

If the amount of Paper held for either villager exceeds the number of trades offered by that villager, then trade stealing will operate using the last trade slot offered by that villager.

### Selection
The closest villager within 5 blocks of the player is marked as the recipient *(indicated by end rod particles)*. The next closest is marked as the donor *(indicated by soul particles)*.

Measures should be taken to prevent villagers from wandering, in order to ensure the correct villagers are used in the process

### Execution
To execute a trade steal, ensure the amount of Paper held in each hand is correct, then complete a trade with the recipient villager. If successful, the donor villager will die and the recipient villager will have the *Replace* slot replaced with the trade from the donor's *Steal* slot.

Once a villager receives a trade, they can no longer unlock new trades.

### *Example*
A Player holding 6 *Steal* Paper in their off-hand and 2 *Replace* Paper in their main hand will replace the second trade of the recipient villager with the sixth trade from the donor villager.

## Data

### Command Storage
This datapack uses the namespace `schwer:tradesteal` (paths `WorkingArray` and `OfferCopy`) temporarily during `execute`. The contents of this storage is removed at the end of `execute`.

### Scoreboard
This datapack uses a dummy scoreboard objective, `tradesteal`, as well as three dummy players within this objective as variables (`arrayLength`, `targetIndex`, `currentIndex`).

The objective is generated when the datapack is loaded, whereas the variables are set and reset during a single `execute` function call.

### Tags
This datapack uses `tradesteal_recipient` and `tradesteal_donor` tags on villagers. These tags are set and removed each `tick` call.

### Removal
`/function tradesteal:clean` can be run manually should there be any lingering data in the scoreboard or command storage.

`/function tradesteal:stop` can be used to remove the `tradesteal` scoreboard objective, as well as clearing the scheduled `tick` function. This disables the datapack until it is reloaded.
<br/> Additionally, this function will call `tradesteal:clean`, as well as remove any lingering tags from loaded villagers.

## References
*(Roughly in personal use order)*
- [Minecraft Wiki — Commands](https://minecraft.fandom.com/wiki/Commands)
    - *Used heavily throughout datapack.*
- [Cloud Wolf — NBT Arrays in Minecraft [1.14+]](https://www.youtube.com/watch?v=Bt6xD8vE7Pw)
    - *Introduced the array cycling method to dynamically extract values.*
- [Fabian Röling — /data modify and NBT paths](https://gaming.stackexchange.com/questions/351488/would-someone-give-a-thorough-explanation-of-1-14-minecrafts-data-modify)
    - *Didn't read it all but it helped point me in the right direction.*
- [Misode's Data Pack Generators](https://misode.github.io/)
    - *Generating predicates*
