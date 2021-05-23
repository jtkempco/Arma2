/*
	PUROPOSE: Returns the Time it will take to reach the ground from a given altitude. (Sir Isac Newton FTW!) 
	INPUT: NUMBER (i.e. Altitude)  
	OUTPUT: TIME (in seconds)
	
	by Kempco
	
	NOTE: - Gravitational constant = 2.95 NOT 9.8!!!
		- 5.6 is the time it takes to reach terminal velocity.
		
		
*/

_alt = _this select 0;
_g = 2.95;
_t_sqrd = 2*(_alt/_g) - 5.6;	
_t = (sqrt _t_sqrd);
_t
