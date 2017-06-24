$fn = 100;

module Bearing(_dE, _dI, _h)
{
	difference()
	{
		cylinder(d = _dE, h = _h, center = true);
		translate([0, 0, 0])
			cylinder(d = _dI, h = _h + 2, center = true);
	}
}

Bearing (16, 6, 6);
