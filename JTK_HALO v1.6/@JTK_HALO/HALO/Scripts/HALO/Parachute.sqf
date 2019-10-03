/*
Taken from the bis_fnc_halo script by Karel Moricky
Modified By Kempco
	*Removed freefall functions
	*Reproduce Action wheel to allow access ths GPS and Chute controls once chute deploys.
	*Added Option to cut chute/Deploy Reserve(Currently Not Active).
	*Cleaned up the issues when landing
*/

if (!local _this) exitwith {};


if (JTK_ACE_Detected) exitWith {
	_dly = (abs(velocity _this select 2) * 0.03);
	[_dly] spawn {[(_this select 0),["Deploying chute..."],false,false] spawn ace_progressbar};
	sleep _dly;
	//sleep 1.5;
	playsound "JTK_ChuteOpen";
	_chute = "BIS_Steerable_Parachute" createVehicle position _this;
	WaitUntil {!isNull _chute};
	_chute setPos (getPos _this);
	_chute setVectorDirAndUp [vectorDir _this, vectorUp _this];	
	_this moveInCargo _chute;//Move in cargo For ACE	
	_chute setDir (getDir _this);
};

_this spawn {
	_unit = _this;
	
	_strt = position _unit select 2;
	_strt_v = velocity _unit select 2;
	
	_dly = (abs(velocity _unit select 2) * 0.03);
	[_dly,"Deploying Chute..."] call JTK_ProgressBar;
	sleep _dly;
	[_unit] call JTK_Open_ActionWheel;
	
	_para = "ParachuteC" createVehicle position _unit;
	_para setpos position _unit;
	_para setdir direction _unit;
	_vel = velocity _unit;
	_unit moveindriver _para;
	_para lock false;
	
	//remove backpack simulating chute
	if ((typeof(unitBackpack _unit)) != "") then {
		removeBackpack _unit;//Put this here for now, if you add the cutchute optioin be sure to remove!!!
	};
	
	//Chute Sounds
	_unit spawn {
		sleep 1.5;
		playsound "JTK_ChuteOpen";
		sleep 3;
		call JTK_HALO_SoundLoop_2;
	};
	
	bis_fnc_halo_para_dirAbs = direction _para;

	//--- Key controls
	if (_unit == player) then {
		_v = if (_unit getVariable "JTK_HALO_Water_Insertion") then {[(_vel select 0)*0.1,(_vel select 1)*0.1,(_vel select 2)*1]}else{[(_vel select 0),(_vel select 1),(_vel select 2)*1]};
		_para setvelocity _v;
		
		bis_fnc_halo_DynamicBlur = ppeffectcreate ["DynamicBlur",464];
		bis_fnc_halo_DynamicBlur ppEffectEnable true;
		bis_fnc_halo_DynamicBlur ppEffectAdjust [8.0];
		bis_fnc_halo_DynamicBlur ppEffectCommit 0;
		bis_fnc_halo_DynamicBlur ppEffectAdjust [0.0];
		bis_fnc_halo_DynamicBlur ppEffectCommit 1;

            bis_fnc_halo_para_vel = 0;
            bis_fnc_halo_para_velLimit = 0.5;
            bis_fnc_halo_para_velAdd = 0.01;
            bis_fnc_halo_para_dir = 0;
            bis_fnc_halo_para_dirLimit = 1.5;
            bis_fnc_halo_para_dirAdd = 0.03;
		
		bis_fnc_halo_para_keydown = {
			_key = _this select 1;

			//--- Forward
			if (_key in (actionkeys 'MoveForward')) then {
				if (bis_fnc_halo_para_vel < +bis_fnc_halo_para_velLimit) then {bis_fnc_halo_para_vel = bis_fnc_halo_para_vel + bis_fnc_halo_para_velAdd};
			};
			//--- Backward
			if (_key in (actionkeys 'MoveBack')) then {
				if (bis_fnc_halo_para_vel > -bis_fnc_halo_para_velLimit*0) then {bis_fnc_halo_para_vel = bis_fnc_halo_para_vel - bis_fnc_halo_para_velAdd};
			};
			//--- Left
			if (_key in (actionkeys 'TurnLeft')) then {
				if (bis_fnc_halo_para_dir > -bis_fnc_halo_para_dirLimit) then {bis_fnc_halo_para_dir = bis_fnc_halo_para_dir - bis_fnc_halo_para_dirAdd};
			};
			//--- Right
			if (_key in (actionkeys 'TurnRight')) then {
				if (bis_fnc_halo_para_dir < +bis_fnc_halo_para_dirLimit) then {bis_fnc_halo_para_dir = bis_fnc_halo_para_dir + bis_fnc_halo_para_dirAdd};
			};
		};
		
		bis_fnc_halo_para_loop_time = time - 0.1;
		bis_fnc_halo_para_velZ = velocity _para select 2;
		bis_fnc_halo_para_loop = {
			if (!isnil {player getvariable "bis_fnc_halo_terminate"}) exitwith {};
			if (time == bis_fnc_halo_para_loop_time) exitwith {}; //--- FPS too high

			_para = vehicle player;

			//--- FPS counter
			_fpsCoef = ((time - bis_fnc_halo_para_loop_time) * 20) / acctime; //Script is optimized for 20 FPS
			bis_fnc_halo_para_loop_time = time;

			//_fpsCoef = _fpsCoef / 3;
			bis_fnc_halo_para_velLimit = 0.3 * _fpsCoef;
			bis_fnc_halo_para_velAdd = 0.002 * _fpsCoef;
			bis_fnc_halo_para_dirLimit = 1.5 * _fpsCoef;
			bis_fnc_halo_para_dirAdd = 0.03 * _fpsCoef;
			
			//--- Dir
			bis_fnc_halo_para_dir = bis_fnc_halo_para_dir * 0.98;
			bis_fnc_halo_para_dirAbs = bis_fnc_halo_para_dirAbs + bis_fnc_halo_para_dir;
			_para setdir bis_fnc_halo_para_dirAbs;
			_dir = direction _para;

			//--- Crash
			_velZ = velocity _para select 2;
			if ((_velZ - bis_fnc_halo_para_velZ) > 7 && (getposatl _para select 2) < 100) then {player setdamage 1;debuglog ["Log::::::::::::::",(_velZ - bis_fnc_halo_para_velZ)];};
			bis_fnc_halo_para_velZ = _velZ;

			//--- Pos
			_para setposasl [
				(getposasl _para select 0) + (sin _dir * (0.1 + bis_fnc_halo_para_vel)),
				(getposasl _para select 1) + (cos _dir * (0.1 + bis_fnc_halo_para_vel)),
				(getposasl _para select 2) - 0.01 - 0.1 * abs bis_fnc_halo_para_vel
			];

			[
				_para,
				(-bis_fnc_halo_para_vel * 75) + 0.5*(sin (time * 180)),
				(+bis_fnc_halo_para_dir * 25) + 0.5*(cos (time * 180))
			] call bis_fnc_setpitchbank;
		};

		bis_fnc_halo_para_mousemoving_eh = (finddisplay 46) displayaddeventhandler ["mousemoving","_this call bis_fnc_halo_para_loop;"];
		bis_fnc_halo_para_mouseholding_eh = (finddisplay 46) displayaddeventhandler ["mouseholding","_this call bis_fnc_halo_para_loop;"];

		sleep 4;

		ppeffectdestroy bis_fnc_halo_DynamicBlur;
		bis_fnc_halo_para_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call bis_fnc_halo_para_keydown;"];
	
		//--- End
		waituntil {((position vehicle _unit select 2) < 2) OR (_unit == vehicle _unit)};
		if (_unit != vehicle _unit) then {
			_spd = velocity _para select 2;
			_pos = [getPos _unit select 0,getPos _unit select 1,0];
			 moveOut _unit;
			_para setPos (_unit modelToWorld [0,-5,1]); 
			_unit setPos _pos;
			[_unit,_spd] spawn JTK_HALO_Landing;
			//_unit switchmove "ACTSPSITMSTPSNONWNONDNON_AMOVPERCMSTPSNONWNONDNON_JUMPFROMWALL";
			//if (speed _unit > 7) then {_unit setUnitPos _prone};
			sleep 1;
			deleteVehicle _para;//<=========================
		};
			
		(finddisplay 46) displayremoveeventhandler ["keydown",bis_fnc_halo_para_keydown_eh];
		(finddisplay 46) displayremoveeventhandler ["mousemoving",bis_fnc_halo_para_mousemoving_eh];
		(finddisplay 46) displayremoveeventhandler ["mouseholding",bis_fnc_halo_para_mouseholding_eh];
		

		bis_fnc_halo_para_vel = nil;
		bis_fnc_halo_para_velLimit = nil;
		bis_fnc_halo_para_velAdd = nil;
		bis_fnc_halo_para_dir = nil;
		bis_fnc_halo_para_dirLimit = nil;
		bis_fnc_halo_para_dirAdd = nil;
		bis_fnc_halo_para_keydown = nil;
		bis_fnc_halo_para_loop = nil;
		bis_fnc_halo_para_keydown_eh = nil;
		bis_fnc_halo_para_mousemoving_eh = nil;
		bis_fnc_halo_para_mouseholding_eh = nil;
	};
};




