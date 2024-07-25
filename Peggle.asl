// Tested versions:
// Deluxe Steam v1.0.0.1
// Deluxe Portable v1.0.0.1
// Nights Portable v1.0.3.5802
// Allows for both splitting by level and splitting by stage.
// Starts when you click "Adventure" in the main menu.
// Splits when you click "Continue" after beating a level
// (or, should you choose, only on the fifth level of every stage).
// ==================Credits===========================
//         janiczek: creator, developer
//        brassbeat: developer
//            zment: display framework
//     smiling-marx: pointing me in the right direction
//          hygkolk: cheat table with some use cases
// Peggle community: suggestions, bug reports

state("popcapgame1", "deluxeSteam")
{
    // Exists when on the main menu
    int mainMenuBase : "popcapgame1.exe", 0x00286768, 0x7cc;

    // Adventure  1
    // Quick Play 2
    // Duel       3
    // Challenge  4
    int gameMode : "popcapgame1.exe", 0x00286768, 0x760;

    // Intermission at the start of every stage always plays song 49
    int song : "popcapgame1.exe", 0x00286768, 0x77c;

    // Equal to the level number (0-4) in Adventure/Quick Play
    int levelIndex : "popcapgame1.exe", 0x00286768, 0x768;

    // Exists when inside a level
    int levelBase : "popcapgame1.exe", 0x00286768, 0x7b8;

    // Starts at zero
    int levelTimer : "popcapgame1.exe", 0x00286768, 0x7b8, 0xbc, 0x14c;

    // AIMING                       1
    // BALL_FALLING                 2
    // CLEARING_AFTER_SHOT          3
    // LEVEL_COMPLETE_DIALOG        5
    // STARTING_LEVEL               8
    // CHOOSING_CHARACTER_DIALOG    9
    // ZEN_SHOT                    10
    int boardState : "popcapgame1.exe", 0x00286768, 0x7b8, 0x154, 0x4;

    // Must be equal for the end-of-level dialog to fall
    int internalScore : "popcapgame1.exe", 0x00286768, 0x7b8, 0x154, 0x174;
    int displayedScore : "popcapgame1.exe", 0x00286768, 0x7b8, 0x14c, 0x94;

    // Ticks in every part of the level except in the ribbon/challenge medal animation
    int phaseTimer : "popcapgame1.exe", 0x00286768, 0x7b8, 0x154, 0x8;

    // Used to determine whether a level has been won.
    string16 endDialogHeader : "popcapgame1.exe", 0x00286768, 0x7b8, 0x160, 0xa4;

    // How far you're in a multilevel challenge
    int multilevelIndex : "Peggle.exe", 0x00286768, 0x7b8, 0xf0;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x00286768, 0x7B8, 0x14c, 0x90;

    // Used to determine end state of level in IL mode.
    int opponentScore : "popcapgame1.exe", 0x00286768, 0x7b8, 0x154, 0x178;
    int orangePegsLeft : "popcapgame1.exe", 0x00286768, 0x7b8, 0x154, 0x360;
    int clearage : "popcapgame1.exe", 0x00286768, 0x7b8, 0x160, 0x23c;
}

state("popcapgame1", "nightsSteam")
{
    int mainMenuBase : "popcapgame1.exe", 0x002cbe04, 0x878;
    int gameMode : "popcapgame1.exe", 0x002cbe04, 0x7f4;
    int song : "popcapgame1.exe", 0x002cbe04, 0x810;
    int levelIndex : "popcapgame1.exe", 0x002cbe04, 0x7fc;
    int levelBase : "popcapgame1.exe", 0x002cbe04, 0x864;
    int levelTimer : "popcapgame1.exe", 0x002cbe04, 0x864, 0xd4, 0x14c;
    int boardState : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x4;
    int internalScore : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x200;
    int displayedScore : "popcapgame1.exe", 0x002cbe04, 0x864, 0x718, 0xac;
    int phaseTimer : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x8;
    string16 endDialogHeader : "popcapgame1.exe", 0x002cbe04, 0x864, 0x72c, 0xa4;
    int multilevelIndex : "popcapgame1.exe", 0x002cbe04, 0x864, 0x10c;
    int levelSub : "popcapgame1.exe", 0x002cbe04, 0x864, 0x718, 0xa8;
    int opponentScore : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x204;
    int orangePegsLeft : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x414;
    int clearage : "popcapgame1.exe", 0x002cbe04, 0x864, 0x72c, 0x224;
}

state("popcapgame1", "extremeSteam")
{
    int mainMenuBase : "popcapgame1.exe", 0x0028a808, 0x7cc;
    int gameMode : "popcapgame1.exe", 0x0028a808, 0x760;
    int song : "popcapgame1.exe", 0x0028a808, 0x77c;
    int levelIndex : "popcapgame1.exe", 0x0028a808, 0x768;
    int levelBase : "popcapgame1.exe", 0x0028a808, 0x7b8;
    int levelTimer : "popcapgame1.exe", 0x0028a808, 0x7b8, 0xbc, 0x14c;
    int boardState : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x154, 0x4;
    int internalScore : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x154, 0x174;
    int displayedScore : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x14c, 0x94;
    int phaseTimer : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x154, 0x8;
    string16 endDialogHeader : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x160, 0xa4;
    int multilevelIndex : "Peggle.exe", 0x0028a808, 0x7b8, 0xf0;
    int levelSub : "popcapgame1.exe", 0x0028A808, 0x7B8, 0x14c, 0x90;
    int opponentScore : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x154, 0x178;
    int orangePegsLeft : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x154, 0x360;
    int clearage : "popcapgame1.exe", 0x0028a808, 0x7b8, 0x160, 0x23c;
}

state("Peggle", "deluxePortable")
{
    int mainMenuBase : "Peggle.exe", 0x00286768, 0x7cc;
    int gameMode : "Peggle.exe", 0x00286768, 0x760;
    int song : "Peggle.exe", 0x00286768, 0x77c;
    int levelIndex : "Peggle.exe", 0x00286768, 0x768;
    int levelBase : "Peggle.exe", 0x00286768, 0x7b8;
    int levelTimer : "Peggle.exe", 0x00286768, 0x7b8, 0xbc, 0x14c;
    int boardState : "Peggle.exe", 0x00286768, 0x7b8, 0x154, 0x4;
    int internalScore : "Peggle.exe", 0x00286768, 0x7b8, 0x154, 0x174;
    int displayedScore : "Peggle.exe", 0x00286768, 0x7b8, 0x14c, 0x94;
    int phaseTimer : "Peggle.exe", 0x00286768, 0x7b8, 0x154, 0x8;
    string16 endDialogHeader : "Peggle.exe", 0x00286768, 0x7b8, 0x160, 0xa4;
    int multilevelIndex : "Peggle.exe", 0x00286768, 0x7b8, 0xf0;
    int levelSub : "Peggle.exe", 0x00286768, 0x7B8, 0x14c, 0x90;
    int opponentScore : "Peggle.exe", 0x00286768, 0x7b8, 0x154, 0x178;
    int orangePegsLeft : "Peggle.exe", 0x00286768, 0x7b8, 0x154, 0x360;
    int clearage : "Peggle.exe", 0x00286768, 0x7b8, 0x160, 0x23c;
}

state("PeggleNights", "nightsPortable")
{
    int mainMenuBase : "PeggleNights.exe", 0x002cae04, 0x878;
    int gameMode : "PeggleNights.exe", 0x002cae04, 0x7f4;
    int song : "PeggleNights.exe", 0x002cae04, 0x810;
    int levelIndex : "PeggleNights.exe", 0x002cae04, 0x7fc;
    int levelBase : "PeggleNights.exe", 0x002cae04, 0x864;
    int levelTimer : "PeggleNights.exe", 0x002cae04, 0x864, 0xd4, 0x14c;
    int boardState : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x4;
    int internalScore : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x200;
    int displayedScore : "PeggleNights.exe", 0x002cae04, 0x864, 0x718, 0xac;
    int phaseTimer : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x8;
    string16 endDialogHeader : "PeggleNights.exe", 0x002cae04, 0x864, 0x72c, 0xa4;
    int multilevelIndex : "PeggleNights.exe", 0x002cae04, 0x864, 0x10c;
    int levelSub : "PeggleNights.exe", 0x002cae04, 0x864, 0x718, 0xa8;
    int opponentScore : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x204;
    int orangePegsLeft : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x414;
    int clearage : "PeggleNights.exe", 0x002cae04, 0x864, 0x72c, 0x224;
}

state("PeggleWoW", "wowPortable")
{
    int mainMenuBase : "PeggleWoW.exe", 0x002b9cfc, 0x878;
    int gameMode : "PeggleWoW.exe", 0x002b9cfc, 0x7f4;
    int song : "PeggleWoW.exe", 0x002b9cfc, 0x810;
    int levelIndex : "PeggleWoW.exe", 0x002b9cfc, 0x7fc;
    int levelBase : "PeggleWoW.exe", 0x002b9cfc, 0x864;
    int levelTimer : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0xd4, 0x14c;
    int boardState : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x4;
    int internalScore : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x200;
    int displayedScore : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x718, 0xac;
    int phaseTimer : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x8;
    string16 endDialogHeader : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x72c, 0xa4;
    int multilevelIndex : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x10c;
    int levelSub : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x718, 0xa8;
    int opponentScore : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x204;
    int orangePegsLeft : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x414;
    int clearage : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x72c, 0x224;
}

startup
{
    settings.Add("RTAMode", true,  "Full game mode");

    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits", "RTAMode");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    settings.Add("trackILTimes", false, "Track IL times", "RTAMode");
    settings.SetToolTip("trackILTimes", "This lists the IL time in a text element");

    settings.Add("trackRetries", false, "Track retries", "RTAMode");

    settings.Add("ignoreQuickRetries", true, "Ignore retries within 20 seconds", "trackRetries");


    settings.Add("ilMode", false, "IL mode (pick one below)");
    settings.SetToolTip(
        "ilMode",
        "Makes the game split on completing an IL. Auto-reset also only works in this mode"
    );

    settings.Add("ilModeClear", true, "Level completed", "ilMode");
    settings.Add("ilModeFullClear", false, "Level full cleared", "ilMode");
    settings.Add("ilModeDeath", false, "Level failed", "ilMode");
    settings.Add("ilModeChallenge", false, "Challenge completed", "ilMode");
    settings.Add("MultilevelSubsplits", false, "Multilevel splits", "ilModeChallenge");
    settings.SetToolTip("MultilevelSubsplits", "Split for every level in a multilevel challenge");

    settings.Add("trackFevorTimes", false, "Track FEVOR");
    settings.SetToolTip("trackFevorTimes", "This is bonus, make sure you pick a mode above.");

    // constants
    vars.versions = new string[] {
        "deluxeSteam", "nightsSteam", "extremeSteam", "deluxePortable", "nightsPortable", "wowPortable"
    };

    vars.deluxeBaseVersions = new string[] {
        "deluxeSteam", "extremeSteam", "deluxePortable"
    };

    vars.levelClearHeaders = new string[] {
        "Level Complete!", "Stage Complete!", "Level Cleared!"
    };

    vars.targetNames = new Dictionary<string, string>();
    vars.targetNames.Add("deluxeSteam", "popcapgame1.exe");
    vars.targetNames.Add("extremeSteam", "popcapgame1.exe");
    vars.targetNames.Add("deluxePortable", "Peggle.exe");
    vars.targetNames.Add("nightsSteam", "popcapgame1.exe");
    vars.targetNames.Add("nightsPortable", "PeggleNights.exe");
    vars.targetNames.Add("wowPortable", "PeggleWoW.exe");

    vars.targetSizes = new Dictionary<string, int>();
    vars.targetSizes.Add("deluxePortable", 0x2f1000);
    vars.targetSizes.Add("deluxeSteam", 0x2f1000);
    vars.targetSizes.Add("extremeSteam", 0x2f5000);
    vars.targetSizes.Add("nightsSteam", 0x36e000);
    vars.targetSizes.Add("nightsPortable", 0x36d000);
    vars.targetSizes.Add("wowPortable", 0x35c000);

    vars.quickRetryTreshold = new TimeSpan(0, 0, 20);

    // actual variables
    vars.retryCounter = 0;
    vars.startOfIL = (TimeSpan?)null;
    vars.startOfFevor = (TimeSpan?)null;
}

init
{
    // LiveSplit display by @zment (from Defy Gravity auto-splitter)
    vars.SetTextComponent = (Action<string, string>)((id, text) =>
    {
        var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
        var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
        if (textSetting == null)
        {
            var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
            var textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
            timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));

            textSetting = textComponent.GetType().GetProperty("Settings", BindingFlags.Instance | BindingFlags.Public).GetValue(textComponent, null);
            textSetting.GetType().GetProperty("Text1").SetValue(textSetting, id);
        }

        if (textSetting != null)
            textSetting.GetType().GetProperty("Text2").SetValue(textSetting, text);
    });

    // vars.DebugPrint = (Action<string>)((msg) => print("[Peggle ASL] " + msg));

    vars.SetAuxiliaryTimer = (Action<string, TimeSpan?>)((textComponentName, start) =>
    {
        const string NullILString = "-";
        if (start.HasValue)
        {
            var ILTime = timer.CurrentTime.RealTime - start.Value; // + vars.ILOffset;
            string ILString = ILTime.ToString().Substring(4,7);
            // vars.DebugPrint("Recorded IL time = " + ILString);
            vars.SetTextComponent(textComponentName, ILString);
        }
        else
        {
            // vars.DebugPrint("Did not record IL time");
            vars.SetTextComponent(textComponentName, NullILString);
        }
    });

    vars.IsEndOfIL = (Func<bool>)(() =>
    {
        if (settings["ilModeFullClear"])
        {
            return current.clearage == 100;
        }

        if (settings["ilModeDeath"])
        {
            return true;
        }

        if (settings["ilModeClear"])
        {
            return current.orangePegsLeft == 0;
        }

        // We're in ilModeChallenge here
        switch ((string)current.endDialogHeader)
        {
            case "Results":
                return (current.internalScore > current.opponentScore);
            case "Level Passed!":
            case "Level Done":
                return false; //
            case "Way to Go!":
                return true;
            default:
                return current.orangePegsLeft == 0;
        }
    });

    vars.IsVictory = (Func<string, bool>)(s => Array.IndexOf(vars.levelClearHeaders, s) >= 0);

    vars.ResetDisplay = (Action)(() =>
    {
        vars.retryCounter = 0;
        vars.startOfIL = (TimeSpan?)null;

        if (settings["trackILTimes"])
        {
            vars.startOfIL = null;
            vars.SetAuxiliaryTimer("Last IL Time", null);
        }

        if (settings["trackFevorTimes"])
        {
            vars.startOfFevor = null;
            vars.SetAuxiliaryTimer("Last FEVOR", null);
        }
        if (settings["trackRetries"])
        {
            vars.retryCounter = 0;
            vars.SetTextComponent("Retries", "0");
        }
    });

    vars.ResetDisplay();

    foreach (string versionName in vars.versions)
    {
        var gameModules = modules.Where(m => m.ModuleName == vars.targetNames[versionName]);
        if (gameModules.Count() > 0)
        {
            int moduleSize = gameModules.First().ModuleMemorySize;
            if (moduleSize == vars.targetSizes[versionName])
            {
                version = versionName;
                vars.ResetDisplay();
            }
        }
    }
}

update
{
    if (!(settings["trackILTimes"] || settings["trackRetries"] || settings["trackFevorTimes"]))
    {
        return true;
    }

    // start of level updates
    if ((current.boardState == 8)
        && ((old.boardState != 8) || (current.levelTimer < old.levelTimer))
        && (timer.CurrentPhase == TimerPhase.Running))
    {
        TimeSpan? startTime = timer.CurrentTime.RealTime;
        // vars.DebugPrint("Found start of level @ " + startTime.ToString());

        if (vars.startOfIL != null) //restarted level
        {
            TimeSpan retryTime = startTime - vars.startOfIL;
            // vars.DebugPrint("found retry time " + retryTime.ToString());

            if (settings["trackRetries"]
                && (!settings["ignoreQuickRetries"] || (retryTime > vars.quickRetryTreshold)))
            {
                vars.retryCounter++;
                vars.SetTextComponent("Retries", vars.retryCounter.ToString());
            }
        }
        vars.startOfIL = startTime;
    }

    // start FEVOR
    if ((current.orangePegsLeft == 0) && (old.orangePegsLeft > 0))
    {
        vars.startOfFevor = timer.CurrentTime.RealTime;
    }

    // end IL
    if (((vars.startOfIL != null) || (vars.startOfFevor != null))
        && (current.boardState == 5)
        && (old.internalScore == old.displayedScore)
        && (current.phaseTimer > old.phaseTimer))
    {
        bool isVictory = vars.IsVictory(old.endDialogHeader);
        // vars.DebugPrint("isVictory: " + isVictory.ToString());

        if (!isVictory)
        {
            return true;
        }
        if (settings["trackILTimes"])
        {
            vars.SetAuxiliaryTimer("Last IL Time", vars.startOfIL);
            vars.startOfIL = null;
        }
        if (settings["trackFevorTimes"])
        {
            vars.SetAuxiliaryTimer("Last FEVOR", vars.startOfFevor);
            vars.startOfIL = null;
        }
    }
}

onStart
{
    vars.ResetDisplay();
}


start
{
    if (settings["ilMode"])
    {
        return (current.boardState == 8)
               && ((old.boardState != 8) || (current.levelTimer == 0));
    }
    if (Array.IndexOf(vars.deluxeBaseVersions, version) >= 0)
    {
        return (current.song == 49) && (old.song != 49) && (current.gameMode == 1);
    }
    else
    {
        return (current.mainMenuBase == 0) && (old.mainMenuBase != 0) && (current.gameMode == 1);
    }
}

reset
{
    if (!settings["ilMode"])
    {
        return false;
    }
    return (current.levelBase == 0) || ((current.levelTimer < old.levelTimer) && (current.multilevelIndex == 0));
}

split
{
    if (settings["ilMode"])
    {
        if (settings["MultilevelSubsplits"] && (current.multilevelIndex > old.multilevelIndex))
        {
            return true;
        }
        return (current.boardState == 5)
               && (old.internalScore == old.displayedScore)
               && (current.phaseTimer > old.phaseTimer)
               && vars.IsEndOfIL();
    }

    if(current.gameMode != 1)
    {
        return false;
    }
    int levelDifference = current.levelSub - old.levelSub;
    switch (levelDifference)
    {
        case -5:
            // level x-5 -> introduction screen.
            // Split on every setting if current.levelSub is 0
            if((current.levelSub == 0) && (current.mainMenuBase == 0))
            {
                // vars.DebugPrint("Split (end of stage)");
                return true;
            }
            return false;
        case 1:
            // intro -> x-1 or next level.
            // Split if not using Master splits and old.levelSub is not 0
            if (settings["splitPerStage"])
            {
                return false;
            }

            if (old.levelSub != 0)
            {
                // vars.DebugPrint("Split (end of level)");
                return true;
            }
            return false;
        default:
            return false;
    }
}
