\\ fun_extended.gp


\r _utils/functions/fun_math.gp



Length(n) =
{
   if(type(n) == "t_STR" || type(n) == "t_VEC", return(#n),
      type(n) == "t_INT",  return(#Str(n)),
      type(n) == "t_REAL", return(deleteTralingZeros(Str(n)).length - 1),
      type(n) == "t_LIST", return(#n),
      type(n) == "t_MAT",  return(#n));
    error("not allowed type");
}
addhelp(Length, "Length(n): returns the length of the given argument. It can be a string, int, real, list and matrix.");

logb(x, b = 10) = log(x)/log(b);
addhelp(logb, "logb(x, {b = 10}): returns the log base b of x.")
