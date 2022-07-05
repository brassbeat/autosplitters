// Peggle Deluxe Autosplitter
// Made by brassbeat, featuring some earlier work by janiczek.
// Works with Steam v1.01 and Portable v1.00 (Tested on Windows 10).
// Allows for both splitting by level and splitting by stage.
// Starts when you click "Adventure" in the main menu.
// Splits when you click "Continue" after beating a level
// (or, should you choose, only on the fifth level of every stage).

state("popcapgame1", "deluxeSteam")
{
    // Used for starting the game.
    // It always plays song 49 when you start a new adventure.
    int song : "popcapgame1.exe", 0xFFD9FCD8;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x00286768, 0x7B8, 0x14c, 0x90;
}

state("popcapgame1", "extremeSteam")
{
    
    // Used for starting the game.
    // It always plays song 49 when you start a new adventure.
    int song : "popcapgame1.exe", 0xFFD9FCD8;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x0028A808, 0x7b8, 0x14c, 0x90;
}

state("Peggle", "deluxePortable")
{
    // Used for starting the game.
    // It always plays song 49 when you start a new adventure.
    int song : "Peggle.exe", 0xFFD9FCD8;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "Peggle.exe", 0x00286768, 0x7B8, 0x14c, 0x90;
}

startup
{
    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    vars.targetNames = new Dictionary<string, string>();
    vars.targetNames.Add("steam", "popcapgame1.exe");
    vars.targetNames.Add("deluxe", "Peggle.exe");

    vars.targetSizes = new Dictionary<string, int>();
    vars.targetSizes.Add("deluxe", 0x2f1000);
    vars.targetSizes.Add("extreme", 0x2f5000);

    // print("Peggle ASL: Active");
  
}

init
{
    var deluxeModules = modules.Where(m => m.ModuleName == vars.targetNames["deluxe"]);

    if (deluxeModules.Count() > 0 && deluxeModules.First().ModuleMemorySize == vars.targetSizes["deluxe"]) {
        version = "deluxePortable";
    }

    var popcapgameModules = modules.Where(m => m.ModuleName == "popcapgame1.exe");
    if (popcapgameModules.Count() > 0) {
        int mms = popcapgameModules.First().ModuleMemorySize;
        if (mms == vars.targetSizes["deluxe"]) {
            version = "deluxeSteam";
        }
        if (mms == vars.targetSizes["extreme"]) {
            version = "extremeSteam";
        }
    }

    // print("Peggle ASL: Found version \"" + version + "\"");
}

/*
update
{
    if (old.levelSub != current.levelSub) {
        // print("Peggle ASL: levelSub " + old.levelSub + " -> " + current.levelSub);
    }

    if (old.song != current.song) {
        // print("Peggle ASL: song " + old.song + " -> " + current.song);
    }
}
*/

start
{
    // Check for levelSub is needed to prevent false positives in Quick Play.
    if (current.song == 49 && old.song != 49 && current.levelSub == 0) {
        // print("Peggle ASL: start");
        return true;
    }
    return false;
}

split
{
    int levelDifference = current.levelSub - old.levelSub;
    switch (levelDifference)
    {
        case -5: 
            // level x-5 -> introduction screen. 
            // Split on every setting if current.levelSub is 0
            if(current.levelSub == 0) {
                // print("Peggle ASL: split (end of stage)");
                return true;
            }
            else {
                return false;
            }
        case 1:
            // intro -> x-1 or next level. 
            // Split if not using Master splits and old.levelSub is not 0
            if (!settings["splitPerStage"]) {
                if (old.levelSub != 0) {
                    // print("Peggle ASL: split (end of level)");
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }
    default:
        return false;
  }
}
