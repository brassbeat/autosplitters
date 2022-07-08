// Peggle Nights Autosplitter
// Made by brassbeat.
// Works with Steam v1.01 and Portable v1.00 (Tested on Windows 10).
// Allows for both splitting by level and splitting by stage.
// Splits when you click "Continue" after beating a level
// (or, should you choose, only on the fifth level of every stage).
// ==================Credits===========================
//        brassbeat: developer
//            zment: display framework
//     smiling-marx: pointing me in the right direction
//          hygkolk: cheat table with some use cases
// Peggle community: suggestions, bug reports

state("popcapgame1", "nightsSteam")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "popcapgame1.exe", 0x002cbe04, 0x864, 0x718, 0xa8;

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "popcapgame1.exe", 0xFFD9FC08;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "popcapgame1.exe", 0x002cbe04, 0x914, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "popcapgame1.exe", 0x002cbe04, 0x864, 0x720, 0x414;
}

state("PeggleNights", "nightsPortable")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "PeggleNights.exe", 0x002cae04, 0x864, 0x718, 0xa8;

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "PeggleNights.exe", 0xFFD9FC08;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "PeggleNights.exe", 0x002cae04, 0x914, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "PeggleNights.exe", 0x002cae04, 0x864, 0x720, 0x414;
}

state("PeggleWoW", "wowPortable")
{
    // Level subindex, e.g. in 3-1 this evaluates to 1.
    // Bad pointer in menus, incl. between stages.
    // ASL treats this as 0, which is extremely convenient :)
    int levelSub : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x718, 0xa8;

    // Increments by 1 on every level start, incl. retries.
    // Session-based
    int levelsStarted : "PeggleWoW.exe", 0xFFD9FC08;

    // Board State:
    // AIMING                       0x1
    // BALL_FALLING                 0x2
    // CLEARING_AFTER_SHOT          0x3
    // LEVEL_COMPLETE_DIALOG        0x5
    // STARTING_LEVEL               0x8
    // CHOOSING_CHARACTER_DIALOG    0x9
    // ZEN_SHOT                     0xA
    int levelState : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x4;

    // Amount of levels ended this session
    // Counts both completions and deaths
    int levelsEnded : "PeggleWoW.exe", 0x002b9cfc, 0x910, 0x198;

    // Amount of orange pegs left (duh)
    int orangePegsLeft : "PeggleWoW.exe", 0x002b9cfc, 0x864, 0x720, 0x414;
}

startup
{
    // Allow splits per level or splits per stage.
    settings.Add("splitPerStage", false, "Master splits");
    settings.SetToolTip("splitPerStage", "Split once per set of five levels (instead of once per level)");

    // settings.Add("trackAimTime", false, "Track total aiming time");
    // settings.SetToolTip("trackAimTime", "Keep track of how long you spent aiming in Game Time");

    settings.Add("trackILTimes", false, "Track IL times");
    settings.SetToolTip("trackILTimes", "List IL time after completing a level");

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

    vars.targetNames = new Dictionary<string, string>();
    vars.targetNames.Add("steam", "popcapgame1.exe");
    vars.targetNames.Add("nights", "PeggleNights.exe");
    vars.targetNames.Add("wow", "PeggleWoW.exe");

    vars.targetSizes = new Dictionary<string, int>();
    vars.targetSizes.Add("nightsSteam", 0x36e000);
    vars.targetSizes.Add("nightsPortable", 0x36d000);
    vars.targetSizes.Add("wow", 0x35c000);

    // print("Peggle ASL: Active");
}

init
{
    var popcapgameModules = modules.Where(m => m.ModuleName == "popcapgame1.exe");

    if (popcapgameModules.Count() > 0)
    {
        int mms = popcapgameModules.First().ModuleMemorySize;
        // print("Peggle ASL: Memory Size = " + mms.ToString());
        if (mms == vars.targetSizes["nightsSteam"])
        {
            version = "nightsSteam";
        }
    }

    var nightsModules = modules.Where(m => m.ModuleName == vars.targetNames["nights"]);

    if (nightsModules.Count() > 0 && nightsModules.First().ModuleMemorySize == vars.targetSizes["nightsPortable"])
    {
        version = "nightsPortable";
    }

    var wowModules = modules.Where(m => m.ModuleName == vars.targetNames["wow"]);

    if (wowModules.Count() > 0 && wowModules.First().ModuleMemorySize == vars.targetSizes["wow"])
    {
        version = "wowPortable";
    }

    // print("Peggle ASL: Found version \"" + version + "\"");

    vars.wasNotRunning = true;

    vars.levelCompletionTarget = null;
    vars.ILStartTime = null;
    vars.ILString = "[none]";

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
            vars.ILString = "[none]";
            vars.skipRetryIncrement = true;

            if (settings["trackRetries"])
            {
                vars.SetTextComponent("Retries", vars.retryCounter.ToString());
            }
            if (settings["trackRetries"])
            {
                vars.SetTextComponent("Last IL Time", vars.ILString);
            }

            vars.wasNotRunning = false;
        }

        // start of level updates
        if (current.levelsStarted != old.levelsStarted)
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
                    if (!settings["ignoreQuickRetries"] || retryTime > vars.quickRetryTreshold)
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
            if (settings["trackILTimes"])
            {
                vars.ILString = (timer.CurrentTime.RealTime - vars.ILStartTime).ToString().Substring(4,7);
                // print("Peggle ASL: Recorded IL time = " + vars.ILString);
                vars.ILStartTime = null;
                vars.SetTextComponent("Last IL Time", vars.ILString);
            }
        }
    }
    else {
        vars.wasNotRunning = true;
    }
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
            else {
                return false;
            }
    default:
        return false;
  }
}
