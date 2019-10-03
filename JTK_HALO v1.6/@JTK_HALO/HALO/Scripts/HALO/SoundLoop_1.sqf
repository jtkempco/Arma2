//by Kempco
//JTK_Para_SoundLoop_1 = {


_source = "HeliHEmpty" createVehicle (position player);
WaitUntil {!isNull _source};
_source attachto [player,[0,0,0]];
_source say3D "JTK_SkyDiveWind";

_source spawn {
	_t = 0;
	_inc = 0.5;
	_limit = 16;
	While {player == vehicle player} do {
		sleep _inc;
		_t = _t + _inc;
		if (_t >= _limit) then {
			_t = 0;
			_this say3D "JTK_SkyDiveWind";
		};
	};
	detach _this;
	deleteVehicle _this;
};


