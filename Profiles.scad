//a, b are the sides
//length is the length of the profile
//e is the thickness
//r is the external radius. Internal radius will be calculated for const thickness
module bar(a, b, length, r0=0)
{
    //cube([a,b,length], center=true);
    linear_extrude(height = length, center=true)
    {
        offset(r = r0)
        {
            square([a-2*r0, b-2*r0], center = true);
        }
    }
}

module squareProfile(a, b, length, e, r=0)
{
    difference()
    {
        bar(a, b, length, r);
        bar(a-2*e, b-2*e, length + 666, r-e);
    }
}

module roundProfile(r, length, e)
{
	difference()
	{
		cylinder(r = r, h = length);
		translate([0, 0, -333]) cylinder(r = r-e, h = length + 666);
	}
}


roundProfile(10, 400, 2);
// squareProfile (20, 100, 2, 1);