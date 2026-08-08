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

// everything here is a gross hack
extend class WadFusionStaticHandler
{
	
	string GetSigilIntroMusic()
	{
		if ( CVar.FindCVar("wf_mus_sigilmp3").GetBool() )
			return "s_introa";
		else
			return "s_intro";
	}
	
	string GetSigil2IntroMusic()
	{
		if ( CVar.FindCVar("wf_mus_sigil2mp3").GetBool() )
			return "s2_intra";
		else
			return "s2_intro";
	}
	
	ui void HackMapsOverlay()
	{
		string mapName = Level.MapName.MakeLower();
		if ( mapName.Left(10) == "wf_newgame" || mapName.Left(10) == "wf_endgame" || mapName.Left(8) == "wf_story" )
		{
			Level.SetFrozen(true);
			Screen.DrawTexture(TexMan.CheckForTexture("TITLEPIC"), false, 0, 0, DTA_FullScreen, 1);
		}
	}
	
	void NewGameIntro()
	{
		string mapName = Level.MapName.MakeLower();
		let compatTitlePics = CVar.FindCVar("wf_compat_titlepics").GetBool();
		
		if ( mapName.Left(10) == "wf_newgame" )
		{
			nextMap = mapName.Mid(11);
			
			string newGameEpisodes[] =
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
			
			string newGameTitleMus[] =
			{
				"d_intro",
				"d_intro",
				"d_intro",
				"d_intro",
				GetSigilIntroMusic(),
				GetSigil2IntroMusic(),
				"d_dm2ttl",
				"d_dm2ttl",
				"d_dm2ttl",
				"x_dm2ttl",
				"x_dm2ttl",
				"t_dm2ttl",
				"p_dm2ttl"
			};
			
			string newGameTitle[] =
			{
				"Doom1_Title",
				"Doom1_Title",
				"Doom1_Title",
				"UltimateDoom_Title",
				"Sigil_Title",
				"Sigil2_Title",
				"Doom2_Title",
				"MasterLevels_Title",
				"Nerve_Title",
				"Id1_Title",
				"Id1_Title",
				"Tnt_Title",
				"Plutonia_Title"
			};
			
			string newGameTitleIntro[] =
			{
				"Doom1_Title_Intro",
				"Doom1_Title",
				"Doom1_Title",
				"UltimateDoom_Title",
				"Sigil_Title_Intro",
				"Sigil2_Title_Intro",
				"Doom2_Title_Intro",
				"MasterLevels_Title",
				"Nerve_Title_Intro",
				"Id1_Title_Intro",
				"Id1_Title",
				"Tnt_Title_Intro",
				"Plutonia_Title_Intro"
			};
			
			let isPistolStart = CVar.FindCVar("wf_compat_pistolstart").GetBool();
			let pistolStart = CHANGELEVEL_RESETINVENTORY|CHANGELEVEL_RESETHEALTH|CHANGELEVEL_NOINTERMISSION;
			
			// this whole thing is very delicate and will break if anything at all is changed
			if ( Level.MapTime == 0 )
			{
				for ( int i = 0; i < newGameEpisodes.Size(); i++ )
				{
					if ( nextMap == newGameEpisodes[i] )
					{
						if ( compatTitlePics )
							S_ChangeMusic(newGameTitleMus[i], 0, false);
						
						if ( CVar.FindCVar("wf_intros").GetBool() )
							intermission = newGameTitleIntro[i];
						else
							intermission = newGameTitle[i];
						
						continue;
					}
				}
			}
			
			StoryStartIntermission();
			
			if ( compatTitlePics && Level.MapTime >= 1 || !compatTitlePics )
				Level.ChangeLevel(nextMap, 0, isPistolStart ? pistolStart : CHANGELEVEL_NOINTERMISSION);
		}
	}
	
	void MasterLevelsStory()
	{
		string mapName = Level.MapName.MakeLower();
		
		if ( mapName.Left(15) == "wf_story_ml_map" )
		{
			string mapSuffix = mapName.Mid(15, 2);
			nextMap = "ml_map"..mapSuffix;
			intermission = "MasterLevels_Map"..mapSuffix;
			
			StoryStartIntermission();
			
			if ( Level.MapTime >= 1 )
			{
				int mlStoryPistolStarts[] = { 29, 30, 31, 32, 16, 17, 33, 19 };
				let isPistolStart = CVar.FindCVar("wf_compat_pistolstart").GetBool();
				let pistolStart = CHANGELEVEL_RESETINVENTORY|CHANGELEVEL_RESETHEALTH|CHANGELEVEL_NOINTERMISSION;
				
				for ( int i = 0; i < mlStoryPistolStarts.Size(); i++ )
				{
					if ( mapSuffix == String.Format("%i", mlStoryPistolStarts[i]) )
					{
						Level.ChangeLevel(nextMap, 0, isPistolStart ? pistolStart : CHANGELEVEL_NOINTERMISSION);
						continue;
					}
				}
				
				Level.ChangeLevel(nextMap, 0, CHANGELEVEL_NOINTERMISSION);
			}
		}
	}
	
	void FullRunIntermission()
	{
		string mapName = Level.MapName.MakeLower();
		
		if ( mapName.Left(10) == "wf_endgame" )
		{
			StoryStartIntermission();
			
			if ( Level.MapTime >= 1 )
			{
				int mlStoryPistolStarts[] = { 29, 30, 31, 32, 16, 17, 33, 19 };
				let isPistolStart = CVar.FindCVar("wf_compat_pistolstart").GetBool();
				let pistolStart = CHANGELEVEL_RESETINVENTORY|CHANGELEVEL_RESETHEALTH|CHANGELEVEL_NOINTERMISSION;
				
				Level.ChangeLevel(nextMap, 0, isPistolStart ? pistolStart : CHANGELEVEL_NOINTERMISSION);
			}
		}
	}
	
	void StoryStartIntermission()
	{
		if ( !multiplayer )
			Level.StartIntermission(intermission, FSTATE_INLEVELNOWIPE);
		else if ( Level.MapTime == 0 )
			EventHandler.SendNetworkEvent("IntermissionStoryEvent");
	}
}
