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

    // Used to prevent double-splitting in quick play
    int levelsEnded : "popcapgame1.exe", 0x00286768, 0x85c, 0x198;

    // It's the selected character.
    // Order is Bjorn=0, Jimmy=1, Kat=2, ..., Marina=10, regardless of game
    int selectedMaster : "popcapgame1.exe", 0x00286768, 0x878, 0x40;
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
    int clearage : "popcapgame1.exe", 0x002cbe04, 0x864, 0x72c, 0x244;
    int levelsEnded : "popcapgame1.exe", 0x002cbe04, 0x914, 0x198;
    int selectedMaster : "popcapgame1.exe", 0x002cbe04, 0x934, 0x3c;
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
    int levelsEnded : "popcapgame1.exe", 0x0028a808, 0x85c, 0x198;
    int selectedMaster : "popcapgame1.exe", 0x0028a808, 0x878, 0x40;
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
    int levelsEnded : "Peggle.exe", 0x00286768, 0x85c, 0x198;
    int selectedMaster : "Peggle.exe", 0x00286768, 0x878, 0x40;
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
    int clearage : "PeggleNights.exe", 0x002cae04, 0x864, 0x72c, 0x244;
    int levelsEnded : "PeggleNights.exe", 0x002cae04, 0x914, 0x198;
    int selectedMaster : "PeggleNights.exe", 0x002cae04, 0x934, 0x3c;
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
    int clearage : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x72c, 0x244;
    int levelsEnded : "PeggleWoW.exe", 0x002b9cfc, 0x914, 0x198;
    int selectedMaster : "PeggleWoW.exe", 0x002b9cfc, 0x930, 0x3c;
}

startup
{
    settings.Add("RTAMode", true,  "Full game mode");

    settings.Add("trackILTimes", false, "Track IL times", "RTAMode");
    settings.SetToolTip("trackILTimes", "This lists the IL time in a text element");

    settings.Add("trackRetries", false, "Track retries", "RTAMode");

    settings.Add("ignoreQuickRetries", true, "Ignore retries within 20 seconds", "trackRetries");

    settings.Add("LPMode", false, "Level Pack Mode");


    settings.Add("ILMode", false, "IL mode (pick one below)");
    settings.SetToolTip(
        "ILMode",
        "Makes the game split on completing an IL. Auto-reset also only works in this mode"
    );

    settings.Add("ILModeClear", true, "Level completed", "ILMode");
    settings.Add("ILModeFullClear", false, "Level full cleared", "ILMode");
    settings.Add("ILModeDeath", false, "Level failed", "ILMode");
    settings.Add("ILModeChallenge", false, "Challenge completed", "ILMode");
    settings.Add("MultilevelSubsplits", false, "Multilevel splits", "ILModeChallenge");
    settings.SetToolTip("MultilevelSubsplits", "Split for every level in a multilevel challenge.");

    settings.Add("BonusSettings", true, "Auxiliary settings");
    settings.SetToolTip("BonusSettings", "These are extra, make sure you pick a mode above.");

    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits", "BonusSettings");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    settings.Add("trackFevorTimes", false, "Track FEVOR", "BonusSettings");
    settings.SetToolTip("trackFevorTimes", "Track time between start of fever and level end.");

    settings.Add("specifyMaster", false, "Require this master to start", "BonusSettings");
    settings.SetToolTip("specifyMaster", "Only start the run with this master selected.");
    settings.Add("specifyBjorn",    false, "Bjorn",    "specifyMaster");
    settings.Add("specifyJimmy",    false, "Jimmy",    "specifyMaster");
    settings.Add("specifyKat",      false, "Kat",      "specifyMaster");
    settings.Add("specifySplork",   false, "Splork",   "specifyMaster");
    settings.Add("specifyClaude",   false, "Claude",   "specifyMaster");
    settings.Add("specifyRenfield", false, "Renfield", "specifyMaster");
    settings.Add("specifyTula",     false, "Tula",     "specifyMaster");
    settings.Add("specifyWarren",   false, "Warren",   "specifyMaster");
    settings.Add("specifyCinder",   false, "Cinder",   "specifyMaster");
    settings.Add("specifyHu",       false, "Hu",       "specifyMaster");
    settings.Add("specifyMarina",   false, "Marina",   "specifyMaster");

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
    vars.targetLevelsEnded = (int?)null;
    vars.isEndOfNightsChallenge = false;
    vars.stageProgress = 0;
}

init
{
    // LiveSplit display by @zment (from Defy Gravity auto-splitter)
    // find a text component with left text `id` (or make a new one) and set its right text to `text`
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

    // Set a duration from given `start` to now in a named text component `textComponentName`
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

    // For IL timing purposes, determine if the end-of-level dialog text
    // corresponds to beating the level
    vars.IsVictory = (Func<string, bool>)(s => Array.IndexOf(vars.levelClearHeaders, s) >= 0);

    // If splitting per stage, splits for levels 1 to 4 are suppressed
    vars.CheckStageSplit = (Func<bool>)(() =>
    {
        if (!settings["splitPerStage"])
        {
            return true;
        }

        vars.stageProgress++;
        if (vars.stageProgress == 5)
        {
            vars.stageProgress = 0;
            return true;
        }
        return false;
    });

    // reset auxiliary displays at the start of the run...
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

    // ... and upon initialisation
    vars.ResetDisplay();

    // find the correct game version
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

    // The logic for deluxe/nights base diverges at some points
    vars.isDeluxeBaseVersion = Array.IndexOf(vars.deluxeBaseVersions, version) >= 0;
}

update
{
    bool updatesAreNeeded = (
        settings["trackILTimes"]
        || settings["trackRetries"]
        || settings["trackFevorTimes"]
        || settings["LPMode"]
    );
    if (!updatesAreNeeded)
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

        // update retry counter upon a restart
        if (vars.startOfIL != null)
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

        // start auxiliary IL timer
        if (settings["trackILTimes"])
        {
            vars.startOfIL = startTime;
        }

        // need to update this after a death
        if (settings["LPMode"])
        {
            vars.targetLevelsEnded = current.levelsEnded + 1;
        }
    }

    // start FEVOR
    if ((current.orangePegsLeft == 0) && (old.orangePegsLeft > 0))
    {
        vars.startOfFevor = timer.CurrentTime.RealTime;
    }

    // end IL and FEVOR
    if (((vars.startOfIL != null) || (vars.startOfFevor != null))
        && (current.boardState == 5)
        && (old.internalScore == old.displayedScore)
        && (current.phaseTimer > old.phaseTimer))
    {
        bool isVictory = vars.IsVictory(old.endDialogHeader);
        // vars.DebugPrint("isVictory: " + isVictory.ToString());

        if (settings["trackILTimes"] && isVictory)
        {
            vars.SetAuxiliaryTimer("Last IL Time", vars.startOfIL);
            vars.startOfIL = null;
        }
        if (settings["trackFevorTimes"])
        {
            vars.SetAuxiliaryTimer("Last FEVOR", vars.startOfFevor);
            vars.startOfFevor = null;
        }
    }
}

onStart
{
    vars.ResetDisplay();

    // not sure if this is needed but I'm not gonna test this again.
    if (settings["LPMode"])
    {
        vars.targetLevelsEnded = current.levelsEnded + 1;
    }

    if (settings["splitPerStage"])
    {
        vars.stageProgress = 0;
    }
}


start
{
    // check if the correct master is selected if specified,
    // else suppress start
    if (settings["specifyMaster"])
    {
        bool[] allowedMasters = {
            settings["specifyBjorn"],
            settings["specifyJimmy"],
            settings["specifyKat"],
            settings["specifySplork"],
            settings["specifyClaude"],
            settings["specifyRenfield"],
            settings["specifyTula"],
            settings["specifyWarren"],
            settings["specifyCinder"],
            settings["specifyHu"],
            settings["specifyMarina"],
        };
        if (!allowedMasters[current.selectedMaster])
        {
            return false;
        }
    }

    // start for ILs and level packs
    if (settings["ILMode"] || settings["LPMode"])
    {
        return (current.boardState == 8)
               && ((old.boardState != 8) || (current.levelTimer == 0));
    }

    // start for deluxe Adventure
    if (vars.isDeluxeBaseVersion)
    {
        return (current.song == 49) && (old.song != 49) && (current.gameMode == 1);
    }
    else // start for nights Adventure
    {
        return (current.mainMenuBase == 0) && (old.mainMenuBase != 0) && (current.gameMode == 1);
    }
}

reset
{
    // In IL mode, reset for restarting the level.
    if (!settings["ILMode"])
    {
        return false;
    }
    return (current.levelBase == 0) || ((current.levelTimer < old.levelTimer) && (current.multilevelIndex == 0));
}

onSplit
{
    // this is needed to prevent double-splitting in level pack mode
    if (settings["LPMode"])
    {
        vars.targetLevelsEnded = current.levelsEnded + 1;
    }
}

split
{
    // Handle nights challenges
    if (!vars.isDeluxeBaseVersion && (settings["ILModeChallenge"] || (settings["LPMode"] && (current.gameMode == 4))))
    {

        if (vars.isEndOfNightsChallenge && (current.levelBase < old.levelBase))
        {
            vars.isEndOfNightsChallenge = false;
            return true;
        }

        if ((current.boardState == 5)
            && (old.internalScore == old.displayedScore)
            && (current.endDialogHeader == "Way to Go!"))
        {
            vars.isEndOfNightsChallenge = true;
            return false;
        }

    }

    if (settings["ILMode"] || settings["LPMode"])
    {
        // part of checking against double-splitting.
        if (settings["LPMode"] && (current.levelsEnded != vars.targetLevelsEnded))
        {
            return false;
        }
        // level transitions in multilevel challenges
        if (settings["MultilevelSubsplits"] && (current.multilevelIndex > old.multilevelIndex))
        {
            return true;
        }

        // check for end-of-level before handling other cases
        if ((current.boardState == 5)
        && (old.internalScore == old.displayedScore)
        && (current.phaseTimer > old.phaseTimer))
        {
            // full clear ILs
            if (settings["ILModeFullClear"])
            {
                return (current.clearage == 100) && vars.CheckStageSplit();
            }

            // death%
            // I'm kinda not checking if it is actually a death but it shouldn't matter
            if (settings["ILModeDeath"])
            {
                return vars.CheckStageSplit();
            }

            // any% ILs and level pack quick play
            if (settings["ILModeClear"] || (settings["LPMode"] && (current.gameMode == 2)))
            {
                return (current.orangePegsLeft == 0) && vars.CheckStageSplit();
            }

            // Challenge ILs in Deluxe
            switch ((string)current.endDialogHeader)
            {
                case "Results":
                    return (current.internalScore > current.opponentScore) && vars.CheckStageSplit();
                case "Level Passed!":
                case "Level Done":
                case "Try Again!":
                    return false; //
                case "Way to Go!":
                    return vars.CheckStageSplit();
                default:
                    return (current.orangePegsLeft == 0) && vars.CheckStageSplit();
            }
        }
    }

    // at this point we're assumed to be in RTA mode.
    if (current.gameMode != 1)
    {
        return false;
    }

    int levelDifference = current.levelSub - old.levelSub;
    switch (levelDifference)
    {
        case -5:
            // level x-5 -> introduction screen.
             if ((current.levelSub == 0) && (current.mainMenuBase == 0))
             {
                 return vars.CheckStageSplit();
             }

             return false;
        case 1:
            // intro -> x-1 or next level.
            if (old.levelSub != 0)
            {
                return vars.CheckStageSplit();
            }

            return false;
        default:
            return false;
    }
}
