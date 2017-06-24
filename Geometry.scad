

function getVec(p, q) = [p[0]-q[0], p[1]-q[1], p[2]-q[2]];
function crossProd(u, v) = [u[1]*v[2]-u[2]*v[1], u[2]*v[0]-u[0]*v[2], u[0]*v[1]-u[1]*v[0]];
function dotProd(u, v) = u[0]*v[0]+u[1]*v[1]+u[2]*v[2];													
function getAngle(u, v) = asin(norm(crossProd(u, v))/norm(u)/norm(v));
function normalize(v) = v/norm(v);
function getDistance(u, v) = norm([v[0]-u[0], v[1]-u[1], v[2]-u[2]]);
function getRotatedPlane(dir, angle, plane) = [0, 0, 0, 0]; // TO DO
function getPlane1(p, n) =
	normalize(concat(n, dotProd(p, n)));
function getPlane2(p, q, r) = 
	let(t = normalize(crossProd(getVec(p, q), getVec(p, r))))
	normalize(concat(t, -dotProd(p, t)));
function getProjection(p, plane) =
	let(p2=[-plane[3]/plane[0], 0, 0]) //random point on plane
		let(t=(plane[0]*p2[0]-plane[0]*p[0]+plane[1]*p2[1]-plane[1]*p[1]+plane[2]*p2[2]-plane[2]*p[2])/(pow(plane[0],2)+pow(plane[1],2)+pow(plane[2],2)))
			p+t*[plane[0], plane[1], plane[2]];

echo(getProjection([1, 1, 1], [1, 1, 0, 3]));
//echo(dotProd([1, 1, 0], [-1, 1, 0]));
//echo(getAngle([-1, 1, 0], [1, 1, 0]));
//echo(getDistance([-3, 1, 1], [1, 1, 0]));
//
//echo(getPlane2([1, 1, 0], [-1, 1, 2], [1, -1, 6]));
//echo(getPlane1([0, 0, 0], crossProd([-1, 1, 2], [1, -1, 6])));
