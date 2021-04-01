Game   : Merge Nymphs  
Version: 104210 (March 2021)  
Author : Ted  
GitHub : https://github.com/Tedward747/Cheat-Engine-Tables/tree/main/Merge-Nymphs

Important:  
If something doesn't seem to be working, check my GitHub for updates.  
If you're on the most recent version, open an issue.  

Options:
  * Quality Of Life:
    * Disable Idle Check: Normally the game will pause if you're idle for too long, this disables that so you can leave the game running
    * Nymph Book: Require 5 Shells To Show Exclamation Mark: Annoying having the exclamation mark when you can merge 3 when you only want to merge 5. Enable then do something to refresh the book, i.e. enter camp or open &amp; close the book.
    * Idle Nymphs Stay Off Map: In camp, any Nymphs that aren't actively harvesting/attacking go to the bottom left corner so they aren't in the way.
  * Cheats:
    * Alchemist:
      * 100% Bonus Item Chance: When you complete a trade, you have a 100% chance to get the bonus item. Doesn't reflect in the UI but it works.
	  * Set Alchemist items given to 9: Makes the alchemist think you've already given her 9 of whatever item she's looking for. Enable cheat, then leave &amp; re-enter camp.
      * Trigger Alchemist Reset: Any time the Alchemist is updated (enter camp, or select her on the map, or if you activate this and you're in camp and she's currently on cooldown, maybe other cases), reset what item she wants and will give, even if she's on cooldown. When you get an item you want make sure you disable this so you don't lose it.
	  * Trigger Shop Daily Deal Reset: Resets the daily deals the alchemist has in the shop, whether the timer is at zero or not. Remember to turn this off if you get a deal you want to keep around.
	  * Buy Unlimited Shop Daily Deal Items: Lets you keep buying items from the shop daily deal, even when there's 0 left. Also makes the top item available to buy even if you haven't bought the bottom four.
    * Spawning Stuff:
	  * Spawn Unlimited Wind Lamps: Do not leave this running for long! Even 2-3 seconds will spawn enough for you to fill your entire camp. It takes a while for them to make their way onto the screen, so turn it on for a second or two, turn it off, and then be patient. If you spawn too many and your game starts to lag, you need to wait for them to go all the way across your camp and despawn. You can probably corrupt your save file if you let this run too long!
      * Building "Click" Spawners Constantly Spawn (Trees, Treasuries, etc): For spawners that you need to click on to get the item, as soon as you click and it drops the item, it generates another one.
	  * Building "Drop" Spawners Constantly Spawn (Water, Oil, Panties): For spawners that automatically drop items, they will start dropping an item every second. It can take a while to kick in after activating, each building must drop once on it's own before the new timer takes over for that building.
	  * Growables Insta-Grow: Any growables like wind lamps, leaves, & old event items that "grow" into Nymph shells will grow instantly.
	* Resource Stuff:
	  * Disable Cheat Detection: Technically, this disables cheating being reported.  None of the checks actually stop you from cheating, just report it back to the server, presumably so they can ban you if you get too many instances. Cheats they detect as of when I made this:
	    * Current amount of each resource you have is tested to see if it's higher than a defined limit
	    * If you get more than 15,000 of a resource from a single source and you don't have at least 80 quest stars yet
		* If you're buying something for less than 100 "Nutaku Gold" - No clue what this even is, maybe something for mobile?
		* Any time you gain or spent a resource they double check that your total was changed by the right amount
		* Some other check that wasn't immediately obvious what they're doing and I couldn't be bothered to dig
		* So yeah, since none of their checks actually stop whatever was going on, and they may add more checks in the future, I just disabled the reporting part of things.
	  * Shop Prices Set To Zero: Pretty straight forward, works for the main shop and buying Nymph shells through the book at the very least. The shop daily deals seem to be hit or miss for some reason.
	  * Instantly Unlock All Chests In "The Vault": Aka, the chests you get from completing levels that normally take hours to unlock.
	* Challenge Levels:
	  * Double Bonus Rewards Cost 0 Gems: Pretty straight forward, enable before starting (or resuming) a challenge level.
	  * Disable Timer: Pretty straight forward, enable before starting (or resuming) a challenge level.
	* Misc:
	  * All Buffs Activate At Max Level: Any time you activate a buff, it turns it into a level 8 buff before activating it
	  * Buffs Don't Get Removed When Used: Any time you activate a buff, it stays on your map
	  * No Cost To Open Locked Chests/Golems/Event Chest: Should work for any camp item you click and it asks for coins, bricks or rubies to open
	  * Merge N Gives N: Instead of merging 3 to get 1 or 5 to get 2, 3 gives 3, 5 gives 5, 32 gives 32 etc. Works for manually merging on map, and through Nymph book.
