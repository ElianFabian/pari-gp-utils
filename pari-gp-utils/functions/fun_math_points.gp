\\ fun_math_points.gp



points(a, b, f, s = 1) =
{
   my( pointsVec = Vec(0, floor((b - a)/s) + 1) );
   my(j = 1);
   forstep (i = a, b, s,

      pointsVec[j] = [i, f(i)];
      j++;
   );
   return (pointsVec);
}
addhelp(points, "points(a, b, f, {s = 1}): returns a vector of points from range a to b with step s evaluated with the function f.");

pointsToString(points) =
{
   my(str = "");
   foreach (points, p,

      str = concat(str, Str("("p[1]", "p[2]")""\n"))
   );
   return (str);
}
addhelp(pointsToString, "pointsToString(points): returns a string with the points from the vector points in the form:\n(x1, y1)\n(x2, y2)\n(x3, y3)\n...");

pointsFile(a, b, f, {s = 1}, mode = "w", filename = "points.txt", Folder = "Points") =
{
   my(j, points = "", file);
   my(interval = (b - a)/s);

   for (i = 0, interval,
      j = a + i*s; points = concat(points, Str("("j", "f(j)")""\n")); \\"(j, f(j))"
   );
   createFile(points, mode, filename, Folder);
}
addhelp(pointsFile, "pointsFile(a, b, f, {s = 1}, {mode = 'w'}, {filename = 'points.txt'}): it's like the pointsToString() function but puts the result into a file. This can be used to copy and paste in Desmos.com to represent points.");

pointIntersection(x0, f, g, digitPosition = 1, precision = 10) =
{
   my([i, result, n] = [10^-digitPosition, x0, 0]);
   my(funs(a, b) = [f(a), g(b)]);

   if ( f(x0-i/10) - g(x0-i/10) < 0, funs(a, b) = [g(a), f(b)] );
   while (n < precision,

      result += i;
      my([fn, gn] = funs(result, result));
      if (fn-gn < 0, result -= i; i /= 10; n++)
   );
   return (result);
}
addhelp(pointIntersection, "pointIntersection(x0, f, g, digitPosition, precision = 10): It's similar to the built-in function solve() (it also has better performance).\nIt returns the intersection point between the funtions f and g given the initial point x0, the initial digit position digitPosition start looking for and the number of digits of the number of digits of the result precision.");
