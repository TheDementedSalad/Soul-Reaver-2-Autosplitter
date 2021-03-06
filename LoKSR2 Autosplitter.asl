// Legacy of Kain: Soul Reaver Any% Glitchless Autosplitter Version 2.0 01/06/2022
// Timed via IGT for Load Remover.
// Splits can be obtained from: https://www.speedrun.com/legacy_of_kain_soul_reaver_2/resources
// Script by Mysterion06 & TheDementedSalad
// Addresses, co-ordinates and testing by TheDementedSalad

// Special thanks to:
// Mysterion06 - Provided the idea and script for the splitting function, without which this splitter would be MANY if statements.
// TheDementedSalad - Found the addresses for the script, went through the game and found co-ordinates for each split and tested them.




state("sr2")
{
	string10 Level: 0x2DAA5C;
	byte Paused: 0x2DAA6C;
	byte Cutscene: 0x335634;
	byte gameState: 0x302C64;
	float X: 0x303040;
	float Z: 0x303044;
	float Y: 0x303048;
	byte Reavers: 0x1808E1;
}

init
{
	vars.completedSplits = new List<float>();
	vars.split = 0;
	vars.split2 = 0;
	
    vars.GXCoords = new List<float>()
    {-240, -190, 150, 250, 1060, 1100, 12500, 12520, 3030, 3060, -3925, -3880, 150, 1000, 3360, 3400, 1925, 1945, 1600, 1800, 1245, 1255, 5205, 5215, 845, 855, -3245, -3243, 1245, 1255, 3995, 4005, 4250, 4260, 1050, 1090, -1458, -1448, 2994, 3000, -10610, -10604, -1939, -1933, 2175, 2181, 1521, 1527, -1969, -1963, -10194, -10188, 300, 500, 5500, 5800, 3785, 3791, 885, 891, 1400, 1600, -1260, -1254, -871, 865, -284, -278};
    vars.GYCoords = new List<float>()
    {-3605, -3595, -5155, -5145, -7605, -7595, -8502, -8492, -11905, -11199, -13060, -13040, -220, -210, -1120, -1114, -1759, -1753, 10390, 10405, -4995, -4985, -3185, -3175, -2900, -2890, -5173, -5171, -5035, -5025, -2805, -2795, -11290, -11285, -11366, -11356, 8790, 8796, -6402, -6396, -7650, -7640, -2910, -2904, -2877, -2871, -2910, -2904, -676, -670, -3252, -3245, -10530, -10500, -3009, -3003, -1095, -1089, 1495, 1501, -7900, -7860, 8512, 8518, -3564, -3558, -4105, -4099};
    vars.GZCoords = new List<float>()
    {920, 980, 7350, 7450, 13340, 13360, 7120, 7150, -10880, -10830, 16040, 16090, 500, 1300, -1200, -1170, 160, 180, 100, 300, -12440, -12425, -5856, -5845, -6660, -6650, 1467, 1469, -13112, -13102, -10230, -10220, -7120, -7059, 13280, 13400, -7280, -7272, -16115, -16109, -1465, -1455, 689, 695, -1501, -1495, 1220, 1226, 388, 394, -1113, -1107, -19600, -19400, -3300, -3000, 2067, 2073, -9630, -9624, 14550, 14800, -4845, -4839, 879, 885, 951, 957};
	
	 vars.AXCoords = new List<float>()
	 {-1670, -1664, -19800, -19700, -4900, -4700, -17519, -17513, -284, -278};
	 
	 vars.AYCoords = new List<float>()
	 {-6687, -6681, -11611, -11605, -11980, -11900, -5182, -5176, -4105, -4099};
	 
	 vars.AZCoords = new List<float>()
	 {-3517, -3511, -4, 3, 1400, 1600, -5127, -5121, 951, 957};
}

update
{
    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.completedSplits.Clear();
		vars.split = 0;
		vars.split2 = 0;
    }
}

startup
{	
	settings.Add("Gless", false, "Glitchless Splits");
	settings.CurrentDefaultParent = "Gless";
		settings.Add("0", false, "Ambush In Courtyard");
		settings.Add("2", false, "Ambush At Statue");
		settings.Add("4", false, "Meet Kain At Pillars");
		settings.Add("6", false, "Reach Elder God");
		settings.Add("8", false, "Reach Swamp");
		settings.Add("10", false, "Enter Dark Shrine");
		settings.Add("12", false, "Activate Light");
		settings.Add("14", false, "Grab Plate");
		settings.Add("16", false, "Get Dark Blade");
		settings.Add("18", false, "Go Back to Elder God");
		settings.Add("20", false, "Enter Light Shrine");
		settings.Add("22", false, "Place Plate I");
		settings.Add("24", false, "Place Plate II");
		settings.Add("26", false, "Get Light Blade");
		settings.Add("28", false, "Meet Kain At Tomb");
		settings.Add("30", false, "Arrive In the Future");
		settings.Add("32", false, "Find Mobius's Statue");
		settings.Add("34", false, "Meet Ariel");
		settings.Add("36", false, "Elder God III");
		settings.Add("38", false, "Enter Uschtenheim");
		settings.Add("40", false, "Enter Air Shrine");
		settings.Add("42", false, "Place Heart I");
		settings.Add("44", false, "Place Heart II");
		settings.Add("46", false, "Place Heart III");
		settings.Add("48", false, "Get Air Blade");
		settings.Add("50", false, "Go to Past");
		settings.Add("52", false, "Outside Refuge");
		settings.Add("54", false, "Begin Blood Bowl Puzzle");
		settings.Add("56", false, "Meet Janos");
		settings.Add("58", false, "Get Fire Blade");
		settings.Add("60", false, "Uschtenheim Ambush");
		settings.Add("62", false, "Elder God IV");
		settings.Add("64", false, "Start Brother Gauntlet");
		settings.Add("66", false, "Kill Raziel");
		settings.CurrentDefaultParent = null;
		
	settings.Add("Any%", false, "Any% Splits");
	settings.CurrentDefaultParent = "Any%";
		settings.Add("0a", false, "First Door After Future Skip");
		settings.Add("2a", false, "Ghost Mobius");
		settings.Add("4a", false, "Return to the Past");
		settings.Add("6a", false, "Save At Lake");
		settings.Add("8a", false, "Raziel");
		settings.CurrentDefaultParent = null;
		
			
}

isLoading 
{
	if(current.Paused == 1 || current.gameState == 6 || current.gameState == 2){
		return true;
	}
	else{
		return false;
	}
}

start
{
	if (current.Cutscene == 4 && old.Cutscene == 0 && current.Level == "strong1A")
	{
		return true;
	}
}

split
{
	if(settings["Gless"]){
		for(int i = 0; i <= 66; i += 2){
			if(current.Cutscene == 4 && current.X > vars.GXCoords[i] && current.X < vars.GXCoords[i + 1] && current.Y > vars.GYCoords[i] && current.Y < vars.GYCoords[i + 1] && current.Z > vars.GZCoords[i] && current.Z < vars.GZCoords[i + 1]){
				if(settings["" + i] && !vars.completedSplits.Contains(vars.GXCoords[i])){
					vars.completedSplits.Add(vars.GXCoords[i]);
					return true;
				}
			}
		}
	
		if(current.Cutscene == 4 && current.Reavers > 12 && current.X >= 2440f && current.X <= 2450f && current.Y >= -10803f && current.Y <= -10795f && current.Z >= -2780f && current.Z <= -2770f && vars.split == 0){
			if(settings["28"]){
				vars.split++;
				return true;
			}
		}
		
		if(current.Cutscene == 4 && current.Reavers > 12 && current.X >= -480f && current.X <= -460f && current.Y >= 10396f && current.Y <= 10402f && current.Z >= -2075f && current.Z <= -2060f && vars.split2 == 0){
			if(settings["18"]){
				vars.split2++;
				return true;
			}
		}
	}
	
	if(settings["Any%"]){
    	for(int i = 0; i <= 8; i += 2){
        	if(current.Cutscene == 4 && current.X > vars.AXCoords[i] && current.X < vars.AXCoords[i + 1] && current.Y > vars.AYCoords[i] && current.Y < vars.AYCoords[i + 1] && current.Z > vars.AZCoords[i] && current.Z < vars.AZCoords[i + 1]){
            	if(settings[i.ToString() + "a"] && !vars.completedSplits.Contains(vars.AXCoords[i])){
                	vars.completedSplits.Add(vars.AXCoords[i]);
                	return true;
            	}
        	}
    	}
	}
}

reset
{
	if(current.gameState == 1 && old.gameState == 2 && current.Level == "strong1A"){
		return true;
	}
}
