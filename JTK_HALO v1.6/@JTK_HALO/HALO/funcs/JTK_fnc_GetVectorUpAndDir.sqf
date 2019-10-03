//by Kempco
/*
	INPUT: [diection,direction offset]
	OUTPUT:ARRAY: [VECTOR UP ARRAY,DIR] 
	
	EX: [0,180] call JTK_GetVectorUp;
	returns: [[0,1,0],90]
*/

_dir = _this select 0;
_offset = if (count _this > 1) then {_this select 1}else{0};

_dir = round(_dir/45)*45;//Makes sure its a factor of 45	
//private ["_array"];

_array =  if (_offset == 180) then {
	switch (_dir) do {
		case 0:  {[[0,-1,0],90]};			
		case 45: {[[-0.5,-0.5,0],0]};	
		case 90: {[[-1,0,0],0]};
		case 135:{[[-0.5,0.5,0],90]};
		case 180:{[[0,1,0],90]};
		case 225:{[[0.5,0.5,0],0]};
		case 270:{[[1,0,0],0]};
		case 315:{[[0.5,-0.5,0],0]};
		case 360:{[[0,-1,0],90]};
	};
}else{
	 switch (_dir) do {
		case 0:  {[[0,1,0],90]};
		case 45: {[[0.5,0.5,0],0]};
		case 90: {[[1,0,0],0]};
		case 135:{[[0.5,-0.5,0],0]};
		case 180:{[[0,-1,0],90]};
		case 225:{[[-0.5,-0.5,0],0]};
		case 270:{[[-1,0,0],0]};
		case 315:{[[-0.5,0.5,0],90]};
		case 360:{[[0,1,0],90]};
	};
};
	
_array
	
	
	
	
	
	
