use <Geometry.scad>

d_wire = 2; //hole diameter for wire
_Aalpha = 60; //degrees
_Ah = 35; //mm
_A = [[0, 0, 0],
			[-_Ah,_Ah*tan(_Aalpha/2),0],
			[-_Ah,-_Ah*tan(_Aalpha/2),0]
			];

_Balpha = 30; //degrees
_Bh = 35; //mm
_theta = 20; //degrees
_B = [[-_Ah, 0, 110],
			[-_Ah+_Bh, -10, 120],
			[-_Ah+_Bh, 10, 120]
			];

module draw(A, B, fn = $fn)
{
	//points B
	for(j=[0:len(B)-1])
		translate(B[j])
			color("blue")
				sphere(2);
	//
	vA0B1 = [A[0][0]-B[1][0], A[0][1]-B[1][1], A[0][2]-B[1][2]];
	vA0B2 = [A[0][0]-B[2][0], A[0][1]-B[2][1], A[0][2]-B[2][2]];
	vA1B0 = [A[1][0]-B[0][0], A[1][1]-B[0][1], A[1][2]-B[0][2]];
	vA1B2 = [A[1][0]-B[2][0], A[1][1]-B[2][1], A[1][2]-B[2][2]]; // * 4
	vA2B0 = [A[2][0]-B[0][0], A[2][1]-B[0][1], A[2][2]-B[0][2]];
	vA2B1 = [A[2][0]-B[1][0], A[2][1]-B[1][1], A[2][2]-B[1][2]]; // * 6
	
	dirVec = [normalize(vA0B1),
						normalize(vA0B2),
						normalize(vA1B0),
						normalize(vA2B1), // *6
						normalize(vA2B0),
						normalize(vA1B2)]; // *4
	
	posVec = [A[0], A[0], A[1], A[1], A[2], A[2]];
	
	difference()
	{
		union()
		{
			//points A
			translate(A[0]) sphere(5);
			translate(A[1]) sphere(5);
			translate(A[2]) sphere(5);
			//bars
			drawBar(4, A[0], A[1]);
			drawBar(4, A[0], A[2]);
			drawBar(4, A[1], A[2]);
			
			//cones
			for(i=[0:len(dirVec)-1])
				translate(posVec[i])
			
				rotate([0, -atan(norm([dirVec[i][0], dirVec[i][1]])/dirVec[i][2]), -atan(dirVec[i][1]/dirVec[i][0])])
					rotate_extrude()
						polygon(points = [[0, 0], [4, 0], [0, 30]]);
		}
		for(i=[0:len(dirVec)-1])
			translate(posVec[i])
				rotate([0, -atan(norm([dirVec[i][0], dirVec[i][1]])/dirVec[i][2]), -atan(dirVec[i][1]/dirVec[i][0])])
				{
					translate([0, 0, 1]) cylinder(d = d_wire, h = 66);
					translate([0, 0, 16]) cylinder(d = 10, h = 30);
				}
		translate([0, 0, -20])
			cube([200, 200, 40], center=true);
		
		//alignment holes
		translate(A[0] + [-2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);
		translate(A[0]+[2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);
		translate(A[1]) rotate([0, 0, -(180-_Aalpha)/2]){
			translate([2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);
			translate([-2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);}
		translate(A[2]) rotate([0, 0, (180-_Aalpha)/2]){
			translate([2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);
			translate([-2, 0, 0]) cylinder(d = d_wire, h = 6, center=true);} 	
	}
}

module drawBar(diameter, p1, p2)
{
	vDir = [p1[0]-p2[0], p1[1]-p2[1], p1[2]-p2[2]];
	translate(vDir/2+p2)
		rotate([0, -atan(norm([vDir[0], vDir[1]])/vDir[2]), atan(vDir[1]/vDir[0])])
			cylinder(d = diameter, h=norm(vDir), center=true);
}

echo(normalize([3, 4, 5]));
draw(_A, _B);