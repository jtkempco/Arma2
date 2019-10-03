//by Kempco
	
_source = "HeliHEmpty" createVehicle (position player);
WaitUntil {!isNull _source};
_source attachto [player,[0,0,0]];
_source say3D "JTK_ChuteFlutter";

_source spawn {
	_t = 0;
	_inc = 0.5;
	_limit = 11;
	While {(player != vehicle player) AND (getPos player select 2 > 2)} do {
		sleep _inc;
		_t = _t + _inc;
		if (_t >= _limit) then {
			_t = 0;
			_this say "JTK_ChuteFlutter";
		};
	};
	detach _this;
	deleteVehicle _this;
};


