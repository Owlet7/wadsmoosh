//-----------------------------------------------------------------------------
//
// Copyright 2025-2026 Owlet VII
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/
//
//-----------------------------------------------------------------------------
//

extend class WadFusionStaticHandler
{
	void FullRun()
	{
		String mapName = Level.MapName.MakeLower();
		
		if ( mapName.Left(10) == "wf_endgame" )
		{
			String endMap = mapName.Mid(11);
			int fullRun = CVar.FindCVar("wf_fullrun").GetInt();
			let fullRunMasterLevels = CVar.FindCVar("wf_fullrun_ml").GetBool();
			let fullRunCast = CVar.FindCVar("wf_fullrun_cast").GetBool();
			let fullRunLoop = CVar.FindCVar("wf_fullrun_loop").GetBool();
			
			if ( Level.MapTime == 0 )
			{
				String endGameFullRun1[] =
				{
					"e1m8",
					"e2m8",
					"e3m8",
					"e4m8",
					"e5m8",
					"e6m8",
					"map30",
					"masterlevels",
					"nv_map08",
					"lr_map07",
					"lr_map14",
					"tn_map30",
					"pl_map30"
				};
				
				String newGameFullRun1[] =
				{
					"e1m1",
					"e2m1",
					"e3m1",
					"e4m1",
					"e5m1",
					"e6m1",
					"map01",
					"ml_map01",
					"nv_map01",
					"lr_map01",
					"lr_map08",
					"tn_map01",
					"pl_map01"
				};
				
				if ( fullRun == 1 )
				{
					for ( int i = 0; i < endGameFullRun1.Size(); i++ )
					{
						bool fullRunEndLoop = fullRunLoop && i == endGameFullRun1.Size() - 1;
						
						if ( endMap == endGameFullRun1[i] )
						{
							for ( int j = fullRunEndLoop ? 0 : i + 1; j < newGameFullRun1.Size(); j++ )
							{
								if ( Wads.CheckNumForFullName("maps/"..newGameFullRun1[j]..".wad") != -1 )
								{
									if ( !fullRunMasterLevels && newGameFullRun1[j] == "ml_map01" )
										continue;
									else
									{
										nextMap = "wf_newgame_"..newGameFullRun1[j];
										break;
									}
								}
							}
						}
					}
				}
				
				String endGameFullRun2[] =
				{
					"e1m8",
					"e2m8",
					"e3m8",
					"map30",
					"e4m8",
					"masterlevels",
					"tn_map30",
					"pl_map30",
					"nv_map08",
					"e5m8",
					"e6m8",
					"lr_map07",
					"lr_map14"
				};
				
				String newGameFullRun2[] =
				{
					"e1m1",
					"e2m1",
					"e3m1",
					"map01",
					"e4m1",
					"ml_map01",
					"tn_map01",
					"pl_map01",
					"nv_map01",
					"e5m1",
					"e6m1",
					"lr_map01",
					"lr_map08"
				};
				
				if ( fullRun == 2 )
				{
					for ( int i = 0; i < endGameFullRun2.Size(); i++ )
					{
						bool fullRunEndLoop = fullRunLoop && i == endGameFullRun2.Size() - 1;
						
						if ( endMap == endGameFullRun2[i] )
						{
							for ( int j = fullRunEndLoop ? 0 : i + 1; j < newGameFullRun2.Size(); j++ )
							{
								if ( Wads.CheckNumForFullName("maps/"..newGameFullRun2[j]..".wad") != -1 )
								{
									if ( !fullRunMasterLevels && newGameFullRun2[j] == "ml_map01" )
										continue;
									else
									{
										nextMap = "wf_newgame_"..newGameFullRun2[j];
										break;
									}
								}
							}
						}
					}
				}
				
				String endGameFullRun3[] =
				{
					"e1m8",
					"e2m8",
					"e3m8",
					"e4m8",
					"e5m8",
					"e6m8",
					"map30",
					"nv_map08",
					"masterlevels",
					"tn_map30",
					"pl_map30",
					"lr_map07",
					"lr_map14"
				};
				
				String newGameFullRun3[] =
				{
					"e1m1",
					"e2m1",
					"e3m1",
					"e4m1",
					"e5m1",
					"e6m1",
					"map01",
					"nv_map01",
					"ml_map01",
					"tn_map01",
					"pl_map01",
					"lr_map01",
					"lr_map08"
				};
				
				if ( fullRun == 3 )
				{
					for ( int i = 0; i < endGameFullRun3.Size(); i++ )
					{
						bool fullRunEndLoop = fullRunLoop && i == endGameFullRun3.Size() - 1;
						
						if ( endMap == endGameFullRun3[i] )
						{
							for ( int j = fullRunEndLoop ? 0 : i + 1; j < newGameFullRun3.Size(); j++ )
							{
								if ( Wads.CheckNumForFullName("maps/"..newGameFullRun3[j]..".wad") != -1 )
								{
									if ( !fullRunMasterLevels && newGameFullRun3[j] == "ml_map01" )
										continue;
									else
									{
										nextMap = "wf_newgame_"..newGameFullRun3[j];
										break;
									}
								}
							}
						}
					}
				}
			}
			
			String endGameEpisodes[] =
			{
				"e1m8",
				"e2m8",
				"e3m8",
				"e4m8",
				"e5m8",
				"e6m8",
				"map30",
				"masterlevels",
				"nv_map08",
				"lr_map07",
				"lr_map14",
				"tn_map30",
				"pl_map30"
			};
			
			String endGameIntermission[] =
			{
				"Doom1_Ep1_Fusion_FullRun_Off",
				"Doom1_Ep2_Fusion_FullRun_Off",
				"Inter_Bunny_Fusion_FullRun_Off",
				"Doom1_Ep4_Fusion_FullRun_Off",
				"Doom1_Ep5_Fusion_FullRun_Off",
				"Doom1_Ep6_Fusion_FullRun_Off",
				"Inter_Cast",
				"MasterLevels_End",
				"Inter_Cast",
				"Id1_Ep1_Fusion_FullRun_Off",
				"Id1Cast",
				"Inter_Cast_Tnt",
				"Inter_Cast_Plutonia"
			};
			
			String endGameIntermissionFullRun[] =
			{
				"Doom1_Ep1_Fusion_FullRun",
				"Doom1_Ep2_Fusion_FullRun",
				"Inter_Bunny_Fusion_FullRun",
				"Doom1_Ep4_Fusion_FullRun",
				"Doom1_Ep5_Fusion_FullRun",
				"Doom1_Ep6_Fusion_FullRun",
				"Inter_Cast_Fusion_FullRun",
				"MasterLevels_End_Fusion_FullRun",
				"Inter_Cast_Fusion_FullRun_NoCredits",
				"Id1_Ep1_Fusion_FullRun",
				"Id1Cast_Fusion_FullRun",
				"Inter_Cast_Tnt_Fusion_FullRun",
				"Inter_Cast_Plutonia_Fusion_FullRun"
			};
			
			String endGameIntermissionFullRunNoCast[] =
			{
				"Doom1_Ep1_Fusion_FullRun",
				"Doom1_Ep2_Fusion_FullRun",
				"Inter_Bunny_Fusion_FullRun",
				"Doom1_Ep4_Fusion_FullRun",
				"Doom1_Ep5_Fusion_FullRun",
				"Doom1_Ep6_Fusion_FullRun",
				"Doom2_End_Fusion_FullRun_NoCast",
				"MasterLevels_End_Fusion_FullRun_NoCast",
				"Doom2_End_Fusion_FullRun_NoCast_NoCredits",
				"Id1_Ep1_Fusion_FullRun",
				"Id1_End_Fusion_FullRun_NoCast",
				"Tnt_End_Fusion_FullRun_NoCast",
				"Plutonia_End_Fusion_FullRun_NoCast"
			};
			
			if ( Level.MapTime == 0 )
			{
				for ( int i = 0; i < endGameEpisodes.Size(); i++ )
				{
					if ( endMap == endGameEpisodes[i] )
					{
						if ( fullRun >= 1 && fullRun <= 3 )
						{
							if ( fullRunCast )
								intermission = endGameIntermissionFullRun[i];
							else
								intermission = endGameIntermissionFullRunNoCast[i];
						}
						else
							intermission = endGameIntermission[i];
						
						break;
					}
				}
			}
			
			StoryStartIntermission(); // wf_story.zs
			
			if ( Level.MapTime >= 1 )
			{
				let isPistolStart = CVar.FindCVar("wf_compat_pistolstart").GetBool();
				let pistolStart = CHANGELEVEL_RESETINVENTORY|CHANGELEVEL_RESETHEALTH|CHANGELEVEL_NOINTERMISSION;
				
				Level.ChangeLevel(nextMap, 0, isPistolStart ? pistolStart : CHANGELEVEL_NOINTERMISSION);
			}
		}
		
		if ( CVar.FindCVar("wf_compat_nextmap").GetBool() )
		{
			if ( mapName == GetMasterLevelsEndGame() )
				Level.NextMap = "wf_endgame_masterlevels";
			else if ( mapName == "e1m8b" )
				Level.NextMap = "wf_endgame_e1m8";
			else if ( mapName == "e1m8" ||
				mapName == "e2m8" ||
				mapName == "e3m8" ||
				mapName == "e4m8" ||
				mapName == "e5m8" ||
				mapName == "e6m8" ||
				mapName == "map30" ||
				mapName == "ml_map43" ||
				mapName == "nv_map08" ||
				mapName == "lr_map07" ||
				mapName == "lr_map14" ||
				mapName == "tn_map30" ||
				mapName == "pl_map30" )
			{
				Level.NextMap = "wf_endgame_"..mapName;
			}
		}
	}
	
	String GetMasterLevelsEndGame()
	{
		if ( CVar.FindCVar("wf_map_mlr").GetBool() )
			return "ml_map43";
		else
			return "ml_map20";
	}
}
