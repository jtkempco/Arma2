//JTK_HALO_CloudEffects = {
/*	
Taken from the bis_fnc_halo script by Karel Moricky
Modified By Kempco
*/
		
_unit = _this select 0;
_pos = position _unit;
if (_pos select 2 < 2000) exitWith {};//Exit here if Alt not high enough
_bright = 0.99;

_clouds_array = [
	["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13, 0],	//0
	"",											//1
	"Billboard",									//2
	1,											//3
	3,											//4
	[0,0,-200],										//5
	wind,											//6
	0,											//7
	1.275,										//8
	1,											//9
	0,											//10
	[100],										//11
	[											//<====12
		[_bright,_bright,_bright,0],
		[_bright,_bright,_bright,0.01],
		[_bright,_bright,_bright,0.10],
		[_bright,_bright,_bright,0]
	],											//====>12
	[1000],										//13
	0,											//14
	0,											//15
	"",											//16
	"",											//17
	_unit											//18
];

_clouds = "#particlesource" createVehicleLocal _pos;  
_clouds setParticleParams _clouds_array;
_clouds setParticleRandom [0, [100, 100, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 1];
_clouds setParticleCircle [00, [00, 00, 00]];
_clouds setDropInterval (0.4 - (0.3 * overcast));

_clouds


