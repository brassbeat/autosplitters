// Peggle Deluxe Autosplitter
// Works with Steam v1.01 and Portable v1.00 (Tested on Windows 10).
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
    // Used for starting the game.
    // It always plays song 49 when you start a new adventure.
    int song : "popcapgame1.exe", 0xFFD9FCD8;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x00286768, 0x7B8, 0x14c, 0x90;

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "popcapgame1.exe", 0x00250A38;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "popcapgame1.exe", 0x00286768, 0x7B8, 0x154, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "popcapgame1.exe", 0x00286768, 0x85c, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "popcapgame1.exe", 0x00286768, 0x7B8, 0x154, 0x360;
}

state("popcapgame1", "extremeSteam")
{
    // Used for starting the game.
    // It always plays song 49 when you start a new adventure.
    int song : "popcapgame1.exe", 0xFFD9FCD8;

    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x0028A808, 0x7B8, 0x14c, 0x90;

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "popcapgame1.exe", 0x00254AD8;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "popcapgame1.exe", 0x0028A808, 0x7B8, 0x154, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "popcapgame1.exe", 0x0028A808, 0x85c, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "popcapgame1.exe", 0x0028A808, 0x7B8, 0x154, 0x360;
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

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "Peggle.exe", 0x00250A38;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "Peggle.exe", 0x00286768, 0x7B8, 0x154, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "Peggle.exe", 0x00286768, 0x85c, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "Peggle.exe", 0x00286768, 0x7B8, 0x154, 0x360;
}

startup
{
    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    // settings.Add("trackAimTime", false, "Track total aiming time");
    // settings.SetToolTip("trackAimTime", "Keep track of how long you spent aiming in Game Time");

    settings.Add("trackILTimes", false, "Track IL times");
    settings.SetToolTip("trackILTimes", "List IL time after completing a level. \n NOTE: this timing is not 100% accurate yet.");

    settings.Add("trackRetries", false, "Track retries");

    settings.Add("ignoreQuickRetries", true, "Ignore retries within 20 seconds", "trackRetries");

    // settings.Add("debugUpdates", true, "Print memory updates");

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

    vars.FrontError = (Action<string>)((gameName) =>
    {
        string body = String.Format("Autosplitter attached to frontend for {},\n and will not run in this condition.\n Please ensure that the game window is loaded,\n then reopen your splits.", gameName);
        string caption = "LiveSplit | Peggle Autosplitter";
        MessageBoxButtons buttons = MessageBoxButtons.OK;
        MessageBoxIcon icon = MessageBoxIcon.Error;
        var message = MessageBox.Show(body, caption, buttons, icon);
    });

    vars.targetNames = new Dictionary<string, string>();
    vars.targetNames.Add("steam", "popcapgame1.exe");
    vars.targetNames.Add("deluxe", "Peggle.exe");

    vars.targetSizes = new Dictionary<string, int>();
    vars.targetSizes.Add("deluxe", 0x2f1000);
    vars.targetSizes.Add("extreme", 0x2f5000);
    vars.targetSizes.Add("deluxeFront", 0x222000);

    vars.debugPrefix = "Peggle ASL:";

    // print("Peggle ASL: Active");
}

init
{
    var deluxeModules = modules.Where(m => m.ModuleName == vars.targetNames["deluxe"]);

    if (deluxeModules.Count() > 0)
    {
        int mms = deluxeModules.First().ModuleMemorySize;
        print("deluxe: mms = " + mms.ToString());
        if (mms == vars.targetSizes["deluxe"])
        {
            version = "deluxePortable";
        }
    }

    var popcapgameModules = modules.Where(m => m.ModuleName == "popcapgame1.exe");
    if (popcapgameModules.Count() > 0)
    {
        int mms = popcapgameModules.First().ModuleMemorySize;
        print("steam: mms = " + mms.ToString());
        if (mms == vars.targetSizes["deluxe"])
        {
            version = "deluxeSteam";
        }
        if (mms == vars.targetSizes["extreme"])
        {
            version = "extremeSteam";
        }
    }

    print("Peggle ASL: Found version \"" + version + "\"");

    vars.wasNotRunning = true;

    vars.levelCompletionTarget = null;
    vars.ILStartTime = null;
    vars.ILOffset = new TimeSpan(0, 0, 0, 0, 500);
    vars.ILString = "-";

    vars.retryCounter = null;
    vars.skipRetryIncrement = true;
    vars.quickRetryTreshold = new TimeSpan(0, 0, 20);

    vars.aimTimeSegmentStart = null;
    vars.TotalAimTime = null;

    if (settings["trackRetries"])
    {
		vars.SetTextComponent("Retries", "0");
	}

    if (settings["trackILTimes"])
    {
		vars.SetTextComponent("Last IL Time", vars.ILString);
	}
}

update
{
    /*
    if (settings["debugUpdates"])
    {
        if (old.levelSub != current.levelSub)
        {
            // print("Peggle ASL: levelSub " + old.levelSub + " -> " + current.levelSub);
        }
        if (old.levelsStarted != current.levelsStarted)
        {
            // print("Peggle ASL: levelsStarted " + old.levelsStarted + " -> " + current.levelsStarted);
        }
        if (old.levelsEnded != current.levelsEnded)
        {
            // print("Peggle ASL: levelsEnded " + old.levelsEnded + " -> " + current.levelsEnded);
        }
        if (old.levelState != current.levelState)
        {
            // print("Peggle ASL: levelState " + old.levelState + " -> " + current.levelState);
        }
        if (old.orangePegsLeft != current.orangePegsLeft)
        {
            // print("Peggle ASL: orangePegsLeft " + old.orangePegsLeft + " -> " + current.orangePegsLeft);
        }
    }
    */

    if (timer.CurrentPhase == TimerPhase.Running)
    {
        if (vars.wasNotRunning)
        { // detect timer start event
            // print("Peggle ASL: Detected timer start");
            vars.retryCounter = 0;
            vars.totalAimTime = new TimeSpan(0);
            vars.ILString = "-";
            vars.skipRetryIncrement = true;
            vars.levelCompletionTarget = current.levelsEnded + 1;

            if (settings["trackRetries"])
            {
                vars.SetTextComponent("Retries", vars.retryCounter.ToString());
            }
            if (settings["trackILTimes"])
            {
                vars.SetTextComponent("Last IL Time", vars.ILString);
            }

            vars.wasNotRunning = false;
        }

        // start of level updates
        if ((current.levelState == 8) && (old.levelState != 8))
        {
            if (settings["trackRetries"])
            {
                if (vars.skipRetryIncrement)
                {
                    vars.skipRetryIncrement = false;
                    // print("Peggle ASL: skipped detection of retry");
                }
                else
                {
                    var retryTime = timer.CurrentTime.RealTime - vars.ILStartTime;
                    bool isQuickRetry = retryTime > vars.quickRetryTreshold;
                    bool isDeath = (current.levelsEnded == vars.levelCompletionTarget);
                    bool countRetry = (!settings["ignoreQuickRetries"] || !isQuickRetry) && !isDeath;
                    if (countRetry)
                    {
                        // print("Peggle ASL: detected retry");
                        vars.retryCounter++;

                        // print("Peggle ASL: set retry counter to " + vars.retryCounter.ToString());
                        vars.SetTextComponent("Retries", vars.retryCounter.ToString());
                    }
                }
            }

            vars.levelCompletionTarget = current.levelsEnded + 1;
            vars.ILStartTime = timer.CurrentTime.RealTime;
            // print("Peggle ASL: start IL timing @ " + vars.ILStartTime.ToString());

        }

        bool isEndOfLevelDialog = current.levelState == 0x5;
        bool levelCompleted = current.orangePegsLeft == 0;
        bool levelEndedThisFrame = current.levelsEnded != old.levelsEnded;

        // end of level updates
        if (isEndOfLevelDialog && levelCompleted && levelEndedThisFrame)
        {
            if (settings["trackILTimes"] && (vars.ILStartTime != null))
            {
                vars.ILString = (timer.CurrentTime.RealTime - vars.ILStartTime + vars.ILOffset).ToString().Substring(4,7);
                // print("Peggle ASL: Recorded IL time = " + vars.ILString);
                vars.ILStartTime = null;
                vars.SetTextComponent("Last IL Time", vars.ILString);
                vars.skipRetryIncrement = true;
            }
        }
    }
    else {
        vars.wasNotRunning = true;
    }
}

start
{
    // Check for levelSub is needed to prevent false positives in Quick Play.
    if (current.song == 49 && old.song != 49 && current.levelSub == 0)
    {
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
            if(current.levelSub == 0)
            {
                // print("Peggle ASL: split (end of stage)");
                return true;
            }
            else
            {
                return false;
            }
        case 1:
            // intro -> x-1 or next level.
            // Split if not using Master splits and old.levelSub is not 0
            if (!settings["splitPerStage"])
            {
                if (old.levelSub != 0)
                {
                    // print("Peggle ASL: split (end of level)");
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
    default:
        return false;
  }
}
