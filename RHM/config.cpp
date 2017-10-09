class CfgPatches 
{
	class RHM 
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		requiredVersion = 0.1;
		//CBA Credits start
		author[]= {"Rindula"}; 	
		authorUrl = "http://wiki.benargee.com/Simple_Single_Player_Cheat_Menu";
		version = "1.3.4.8";
		versionAr[] = {1,3,4,8};
		versionStr = "1.3.4.8";
		mail = "rindola@t-online.de";
		fileName = "RHM.pbo";
		//CBA Credits end
	};
};


class CfgFunctions
{
	class RHM
	{
		class RHM 
		{
			class init
			{
				file = "\RHM\init.sqf";
				postinit = 1
			};			
		};
	};
};


enableDebugConsole = 2;//test!!