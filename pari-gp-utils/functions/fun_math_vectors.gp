\\ fun_math_vectors.gp



V2D_ZERO  = [0, 0];
V2D_ONE   = [1, 1];
V2D_RIGHT = [1, 0];
V2D_LEFT  = [-1, 0];
V2D_UP    = [0, 1];
V2D_DOWN  = [0, -1];

V_ZERO    = [0, 0, 0];
V_ONE     = [1, 1, 1];
V_RIGHT   = [1, 0, 0];
V_LEFT    = [-1, 0, 0];
V_UP      = [0, 1, 0];
V_DOWN    = [0, -1, 0];
V_FORWARD = [0, 0, 1];
V_BACK    = [0, 0, 1];

v.x = v[1];
v.y = v[2];
v.z = v[3];

vnorm(u) = sqrt( sum(i = 1, #u, u[i]^2) );
addhelp(norm, "norm(u): returns the magnitude of the given vector.");

vnormalize(v) = v/vnorm(v);
addhelp(vnormalize, "_.vnormalize: returns the normalize vector from the given vector. Is isFloat is equal to 1 then it will return the components in float representation.");

vdot(u,v) = sum(i=1,#u,u[i]*v[i]);

vcross(u, v) =
{[
    u[2]*v[3] - u[3]*v[2],
    u[3]*v[1] - u[1]*v[3],
    u[1]*v[2] - u[2]*v[1]
]}  

foreachMap(M, expr = (x, y) -> print(Str(x, ": ", y))) = foreach(M, item, expr(item[1][1], item[1][2]));
addhelp(foreachMap, "foreachMap(M, {expr}): loops through a map M with an expresion expr of type (x, y) -> {...}, with x as the key and y as the value.\n Example:\n\nloopThroughMap(myMap, (x, y) -> {\n\n\tprint(Str(x, \": \", y));\n})");
