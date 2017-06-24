use <String.scad>
// Holes.scad should be "used" in other files
CSUNKANGLE = 90;
DBITANGLE = 118;
PI = 3.1415;

PRINT_k = 1.0;
	
module cSunkHole(hDiameter, hLength, cSunkDiameter, cSunkAngle = CSUNKANGLE)
{
	rotate_extrude()
		polygon( points = [
	[0, 0],
	[cSunkDiameter/2, 0],
	[hDiameter/2, (cSunkDiameter-hDiameter)/2/tan(cSunkAngle/2)],
	[hDiameter/2, hLength],
	[ 0, hLength + hDiameter/2/tan(DBITANGLE/2)]
	]);
}

module cBoredHole(hDiameter, hLength, bDiameter, bLength)
{
	rotate_extrude()
		polygon( points = [
	[0, 0],
	[bDiameter/2, 0],
	[bDiameter/2, bLength],
	[hDiameter/2, bLength],
	[hDiameter/2, bLength + hLength],
	[0, bLength + hLength + hDiameter/2/tan(DBITANGLE/2)]]);
}


module socketHeadScrewHole(type, mode="", mode2="")
{
	c = 0; //clearance
	m = 1; //multiplier
	d = 0;
	l = 0;
	hD = 0; //head Diameter
	hH = 0; //head Height
/*
	if(mode == "CLEARANCE")
		if(mode2 == "CLOSE") {}
		else if(mode2 == "STANDARD") {}
		else if(mode2 == "3DPRINT") {}
			
		
	else if(mode == "TAP")
		if(mode2 == "SOFT") {}
		else if(mode2 == "HARD") {}
		else if(mode2 == "3DPRINT") {}
*/
	
	if(type[0] == "M")
	{
		x = search("x", type)[0];
		d = strToInt(substr(type, 1, x-1));
    l = strToInt(substr(type, x+1, len(type)-x-1));		
		echo("x", x);
		echo("d", d);
		echo("l", l);
	}
	
	if (d == 2){ hD = 3.8;} // head diameter = 3.8, height = 2
	else if (d == 2.5){ hD = 4.5;} // head diameter = 4.5, height = 2.5
	else if (d == 3){ hD = 5.5;} // head diameter = 5.5, height = 3
	else if (d == 4){ hD = 7;} // head diameter = 7, height = 4
	else if (d == 5){ hD = 8;} // head diameter = 8, height = 5
	else if (d == 6){ hD = 10;} // head diameter = 10, height = 6
	else if (d == 8){ hD = 13;} // head diameter = 13, height = 8
	else if (d == 10){ hD = 16;} // head diameter = 16, height = 10
	else if (d == 12){ hD = 18;} // head diameter = 18, height = 12
	
	cBoredHole (d*m+c, l, hH, d);
}


socketHeadScrewHole("M3x8", "asd");




