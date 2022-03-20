\\ fun_math_vectors.gp



V2_ZERO  = [0, 0];
V2_ONE   = [1, 1];
V2_RIGHT = [1, 0];
V2_LEFT  = [-1, 0];
V2_UP    = [0, 1];
V2_DOWN  = [0, -1];

V3_ZERO    = [0, 0, 0];
V3_ONE     = [1, 1, 1];
V3_RIGHT   = [1, 0, 0];
V3_LEFT    = [-1, 0, 0];
V3_UP      = [0, 1, 0];
V3_DOWN    = [0, -1, 0];
V3_FORWARD = [0, 0, 1];
V3_BACK    = [0, 0, 1];

v.x = v[1];
v.y = v[2];
v.z = v[3];

vnorm(u) = sqrt( sum(i = 1, #u, u[i]^2) );
addhelp(vnorm, "vnorm(u): returns the magnitude of the given vector.");

vnormalize(v) = v/vnorm(v);
addhelp(vnormalize, "vnormalize: returns the normalized vector from the given vector.");

vdot(u,v) = sum(i=1,#u,u[i]*v[i]);
addhelp(vdot, "vdot(u,v): returns the dot product of the given vectors")

vcross(u, v) =
{[
    u[2]*v[3] - u[3]*v[2],
    u[3]*v[1] - u[1]*v[3],
    u[1]*v[2] - u[2]*v[1]
]}
addhelp(vcross, "vcross(u, v): returns the cross product of the given vectors")

vdist(u, v) = sqrt( sum(i = 1, #u, (v[i] - u[i])^2) );
addhelp(vdist, "vdist(u, v): returns the distance between the given vectors.")

vdistSq(u, v) = sum(i = 1, #u, (v[i] - u[i])^2)
addhelp(vdistSq, "vdistSq(u, v): returns the squared distance between the given vectors.")

foreachMap(M, expr = (x, y) -> print(Str(x, ": ", y))) = foreach(M, item, expr(item[1][1], item[1][2]));
addhelp(foreachMap, "foreachMap(M, {expr}): loops through a map M with an expresion expr of type (x, y) -> {...}, with x as the key and y as the value.\n Example:\n\nloopThroughMap(myMap, (x, y) -> {\n\n\tprint(Str(x, \": \", y));\n})");
