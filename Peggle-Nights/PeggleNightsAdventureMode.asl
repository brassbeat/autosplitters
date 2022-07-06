// Peggle Nights/WoW Autosplitter
// Made by brassbeat.
// Works with Steam v1.01 and Portable v1.00 (Tested on Windows 10).
// Allows for both splitting by level and splitting by stage.
// Splits when you click "Continue" after beating a level
// (or, should you choose, only on the fifth level of every stage).


state("popcapgame1", "nightsSteam")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x002cae04, 0x864, 0x718, 0xa8;
}


state("PeggleNights", "nightsPortable")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "PeggleNights.exe", 0x002cae04, 0x864, 0x718, 0xa8;
}

state("PeggleWoW", "wowPortable")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x718, 0xa8;
}

startup
{
    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    vars.targetNames = new Dictionary<string, string>();
    vars.targetNames.Add("steam", "popcapgame1.exe");
    vars.targetNames.Add("nights", "PeggleNights.exe");
    vars.targetNames.Add("wow", "PeggleWoW.exe");

    vars.targetSizes = new Dictionary<string, int>();
    vars.targetSizes.Add("nightsSteam", 0x36e000);
    vars.targetSizes.Add("nightsPortable", 0x36d000);
    vars.targetSizes.Add("wow", 0x35c000);

    print("Peggle ASL: Active");

}

init
{
    var popcapgameModules = modules.Where(m => m.ModuleName == "popcapgame1.exe");

    if (popcapgameModules.Count() > 0) {
        int mms = popcapgameModules.First().ModuleMemorySize;
        // print("Peggle ASL: Memory Size = " + mms.ToString());
        if (mms == vars.targetSizes["nightsSteam"]) {
            version = "nightsSteam";
        }
    }

    var nightsModules = modules.Where(m => m.ModuleName == vars.targetNames["nights"]);

    if (nightsModules.Count() > 0 && nightsModules.First().ModuleMemorySize == vars.targetSizes["nightsPortable"]) {
        version = "nightsPortable";
    }

    var wowModules = modules.Where(m => m.ModuleName == vars.targetNames["wow"]);

    if (wowModules.Count() > 0 && wowModules.First().ModuleMemorySize == vars.targetSizes["wow"]) {
        version = "wowPortable";
    }

    // print("Peggle ASL: Found version \"" + version + "\"");
}

/*
update
{
  if (old.levelSub != current.levelSub) {
    print("Peggle ASL: levelSub " + old.levelSub + " -> " + current.levelSub);
  }
}
*/

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
