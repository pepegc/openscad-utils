module test()
{
	union()
	{
		cylinder(h=10, d=10);
		translate([5, 0, 0])
			cylinder(h=10, d=6);
	}
}

module XPattern (n, dir, dist)
{
	dir = dir/sqrt(dir[0]*dir[0]+dir[1]*dir[1]+dir[2]*dir[2]);
	
	for (i=[0: n-1])
	{
		translate(dir*dist*i)
			children();
	}
}

module XYPattern (n1, dir1, dist1, n2, dir2, dist2)
{
	XPattern(n1, dir1, dist1)
		XPattern(n2, dir2, dist2)
			children();
}

module XYZPattern (n1, dir1, dist1, n2, dir2, dist2, n3, dir3, dist3)
{
	XYPattern(n1, dir1, dist1, n2, dir2, dist2)
		XPattern(n3, dir3, dist3)
			children();
}


module CircularPattern (n, radius, angle = 360, dir = 1, fixed=0)
{
	theta = angle/n;
	
	for (i = [0 : n-1])
	{
		rotate(a = theta*i*dir, v=[0, 0, 1])
			translate([radius, 0, 0])
				rotate(a = -theta*i*dir*fixed, v=[0, 0, 1])
					children();
	}
}

module CilindricalPattern (nRadial, distRadial, nAxial, distAxial, angle=360, dir=1, rotated=1)
{
	CircularPattern(nRadial, distRadial, angle, dir, rotated)
		XPattern(nAxial, [0, 0, 1], distAxial);
}
//XYZPattern (3, [1, 0, 0], 15, 2, [0, 1, 0], 15, 4, [0, 0, 1], 15)
	//test();
CircularPattern(6, 30)
	test();
echo("asdasdasd", false*45);
	