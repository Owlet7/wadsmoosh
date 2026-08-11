//-----------------------------------------------------------------------------
//
// Copyright 2024-2026 Owlet VII
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

class WadFusionStaticHandler : StaticEventHandler
{
	String nextMap;
	String intermission;
	bool teeth;
	
	override void OnRegister()
	{
		Console.Printf(StringTable.Localize("$WF_TITLE").." version "..WF_VERSION);
	}
	
	override void PostUiTick()
	{
		if ( CVar.FindCVar("wf_compat_changemusic").GetBool() )
		{
			DoSigilMusicReplacements(); // wf_mus_sigil.zs
			DoIdkfaMusicReplacements(); // wf_mus_idkfa.zs
			DoMusicReplacements();      // wf_mus_swap.zs
		}
	}
	
	override void ConsoleProcess(ConsoleEvent e)
	{
		if ( e.Name ~== "wf_reset2defaults" )
			WadFusionReset2Defaults(); // wf_defaults.zs
	}
	
	override void NetworkProcess(ConsoleEvent e)
	{
		if (e.Name ~== "IntermissionStoryEvent")
			Level.StartIntermission(intermission, FSTATE_INLEVELNOWIPE);
	}
	
	override void WorldLoaded(WorldEvent e)
	{
		// reset global variables when starting maps where they're not used
		String mapName = Level.MapName.MakeLower();
		if ( mapName.Left(10) != "wf_newgame" && mapName.Left(10) != "wf_endgame" && mapName.Left(8) != "wf_story" )
		{
			nextMap = "";
			intermission = "";
			teeth = true;
		}
	}
	
	override void WorldUnloaded(WorldEvent e)
	{
		// force pistol start on half of the master levels.
		// this is needed to support switching between the xaser order,
		// in which they should have pistol starts,
		// and the rejects order, in which they shouldn't
		if ( CVar.FindCVar("wf_compat_pistolstart").GetBool() )
		{
			String nextMapName = Level.NextMap.MakeLower();
			
			if ( nextMapName.Left(6) == "ml_map" )
			{
				array<int> mlPistolStarts;
				mlPistolStarts.PushV(1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33);
				
				if ( !CVar.FindCVar("wf_map_mlr").GetBool() )
					mlPistolStarts.PushV(10, 11, 12, 13, 14, 15, 18, 20);
				if ( CVar.FindCVar("wf_map_mlr").GetBool() || !teeth )
					mlPistolStarts.PushV(19);
				
				for ( int i = 0; i < mlPistolStarts.Size(); i++ )
				{
					if ( nextMapName.Mid(6) == String.Format("%02i", mlPistolStarts[i]) )
					{
						ForcePistolStart();
						break;
					}
				}
			}
		}
	}
	
	override void WorldLinePreActivated(WorldEvent e)
	{
		// return false if ml_map18 was exited using the normal exit.
		// this is needed to support forcing a pistol start on ml_map19,
		// without also forcing it for ml_map21
		String mapName = Level.MapName.MakeLower();
		if ( mapName == "ml_map18" && e.ActivatedLine.Special == 243 )
			teeth = false;
	}
	
	override void WorldTick()
	{
		FullRun(); // wf_fullrun.zs
		
		// wf_story.zs
		NewGameIntro();
		MasterLevelsStory();
	}
	
	override void RenderOverlay(RenderEvent e)
	{
		// wf_story.zs
		HackMapsOverlay();
	}
	
	void ForcePistolStart()
	{
		for ( int i; i < MAXPLAYERS; i++ )
		{
			if ( !playerInGame[i] || !players[i].mo )
				continue;
			
			PlayerPawn pPawn = PlayerPawn(players[i].mo);
			
			if ( pPawn.Health > 0 )
			{
				players[i].Health = pPawn.Default.Health;
				pPawn.Health = pPawn.Default.Health;
				pPawn.ClearInventory();
				pPawn.GiveDefaultInventory();
			}
		}
	}
	
	ui void DoChangeMusic(String music)
	{
		// define array of supported title themes
		String titleMusic[] =
		{
			"d_intro",
			"d_introa",
			"s_intro",
			"s_introa",
			"s2_intro",
			"s2_intra",
			"d_dm2ttl",
			"t_dm2ttl",
			"p_dm2ttl",
			"x_dm2ttl",
			"h_dm2ttl",
			"h_intro"
		};
		
		// don't loop title themes
		for ( int i = 0; i < titleMusic.Size(); i++ )
		{
			DoSigilTitleMusicReplacements(); // wf_mus_sigil.zs
			DoIdkfaTitleMusicReplacements(); // wf_mus_idkfa.zs
			DoTitleMusicReplacements();      // wf_mus_swap.zs
			
			if ( music == titleMusic[i] )
				return;
			else if ( i == titleMusic.Size() - 1 )
			{
				if ( CVar.FindCVar("snd_musicvolume").GetFloat() > 0 )
					S_ChangeMusic(music);
			}
		}
	}
}
