//by Kempco

_veh = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_veh removeAction _id;

_obj = (_veh getVariable "JTK_Zodiac_Marker") select 0;
detach _obj;
sleep 2;
deleteVehicle _obj; 

