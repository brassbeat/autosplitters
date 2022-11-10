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
}

startup
{
    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    settings.Add("trackILTimes", false, "Track IL times");
    settings.SetToolTip("trackILTimes", "List IL time after completing a level");

    settings.Add("trackRetries", false, "Track retries");

    settings.Add("ignoreQuickRetries", true, "Ignore retries within 20 seconds", "trackRetries");

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

    vars.SetILTime = (Action<TimeSpan?>)((start) =>
    {
        const string TextComponentName = "Last IL Time";
        const string NullILString = "-";
        if (start.HasValue)
        {
            var ILTime = timer.CurrentTime.RealTime - start.Value; // + vars.ILOffset;
            string ILString = ILTime.ToString().Substring(4,7);
            // vars.DebugPrint("Recorded IL time = " + ILString);
            vars.SetTextComponent(TextComponentName, ILString);
        }
        else
        {
            // vars.DebugPrint("Did not record IL time");
            vars.SetTextComponent(TextComponentName, NullILString);
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
            vars.SetILTime(null);
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

    // end IL
    if ((vars.startOfIL != null)
        && (current.boardState == 5)
        && (old.internalScore == old.displayedScore)
        && (current.phaseTimer > old.phaseTimer))
    {
        bool isVictory = vars.IsVictory(old.endDialogHeader);
        // vars.DebugPrint("isVictory: " + isVictory.ToString());

        if (isVictory)
        {
            vars.SetILTime(vars.startOfIL);
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
    if (Array.IndexOf(vars.deluxeBaseVersions, version) >= 0)
    {
        return (current.song == 49) && (old.song != 49) && (current.gameMode == 1);
    }
    else
    {
        return (current.mainMenuBase == 0) && (old.mainMenuBase != 0) && (current.gameMode == 1);
    }
}

split
{
    // We're only interested in level exits
    if ((current.gameMode != 1)
        || (old.boardState != 5)
        || (current.boardState == 5))
    {
        return false;
    }

    return (!settings["splitPerStage"] || (current.levelIndex == 0))
           && vars.IsVictory(old.endDialogHeader);
}