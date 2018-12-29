#include <a_samp>
#include <zcmd>
#include <sscanf>

#define COLOR_RED 0xAA3333AA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_MAGENTA 0xFF00FFFF

main(){
}

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    if (!success)
    {
       SendClientMessage(playerid,COLOR_RED,"[INFO] Cette commande n'existe pas !");
    }
    return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}


CMD:nitro(playerid, params[])
{
    new veh_id = GetPlayerVehicleID(playerid);
	AddVehicleComponent(veh_id, 1010);
}

CMD:carfix(playerid, params[])
{
    new veh_id = GetPlayerVehicleID(playerid);
    RepairVehicle(veh_id);
    SendClientMessage(playerid,COLOR_MAGENTA, "[INFO] Réparation éfféctuée !");
}

CMD:tptoveh(playerid, params[])
{
	new Float:veh_x, Float:veh_y, Float:veh_z;
	new veh_id;
	if(sscanf(params,"i",veh_id)) return SendClientMessage(playerid,COLOR_RED, "USAGE: /tptoveh <id>");
	GetVehiclePos(veh_id, veh_x, veh_y, veh_z);
	SetPlayerPos(playerid, veh_x, veh_y, veh_z);
}

CMD:carhealth
