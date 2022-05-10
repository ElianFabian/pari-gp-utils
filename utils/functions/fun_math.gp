\\ fun_math.gp



\r _utils/constants/const_string.gp



logR(x) =
{
   my (a = log(x));
   while (log(a)>0, a = log(a));

   return(a);
}
addhelp(logR, "logR(x): applies the log recursively until the output is negative.");

slog(x, {b = 2}) =
{
   my (cont = 1, n = x);
   if (x <= 1, return(0));
   while (n > b, n = log(n)/log(b); cont++);

   return (cont);
}
addhelp(slog, "slog(x, {b = 2}): returns the superlogarithm of any given integer.");

sumDigitsR(n, {b = 10}) =
{
   my (a = sumdigits(n, b));
   while (a >= 10, a = sumdigits(a, b));
   return (a);
}
addhelp(sumDigitsR, "sumDigitsR(n, {b = 10}): returns the recursive sum of the digits of the given number.");

sumOfReciprocalPrimes(n) =
{
   my (sum = 0);
   for (i = 1, n, sum += 1.0/prime(i););

   return (sum);
}
addhelp(sumOfReciprocalPrimes, "sumOfReciprocalPrimes(n): returns the sum of the reciprocal of prime numbers: 1/2 + 1/3 + 1/5 + ... + 1/p");

Zn(n) = (1-(-1)^n*(2*n+1))/4;
addhelp(Zn, "Zn(n): relates the natural number and the integers (with 0 as a natural): 0, 1, -1, 2, -2...");

tetration(b, n) =
{
   my (z = b);
   for (i = 1, n - 1, z = b^z);
   return (z);
}
addhelp(tetration, "tetration(b, n): returns the tetration in base b of n.");

nDensity(n) =
{
   my(
      M = vector(10, x, 0),
      S = Vec(Str(n)),
      L = #Str(n)
   );

   for (i = 1, L,
      if (S[i] == "0", M[1]++,
         S[i] == "1", M[2]++,
         S[i] == "2", M[3]++,
         S[i] == "3", M[4]++,
         S[i] == "4", M[5]++,
         S[i] == "5", M[6]++,
         S[i] == "6", M[7]++,
         S[i] == "7", M[8]++,
         S[i] == "8", M[9]++,
         S[i] == "9", M[10]++)
    );

   M = M/L;

   return (M);
}
addhelp(nDensity, "nDensity(n): returns the porcentage of every digit of the given number.");

toDegrees(angle) = angle/(2*Pi) * 360;
toRadians(angle) = angle/360 * 2*Pi;


toGray(n)=bitxor(n,n>>1);
fromGray(n)=my(k=1,m=n);while(m>>k,n=bitxor(n,n>>k);k+=k);n;

toBase(n, b1, b2) =
{
  my (a = 0, c = "");
  n = Vec(Str(n));
  forstep (y = #n, 1, -1,
    for (x = 1, b1,
      if (n[y] == BaseDigitSet[x],
        a = a + (x - 1)*b1^(#n - y); \\ turns the number into decimal
      )
    )
  );
  until(a/b2 == 0,
    c = concat(BaseDigitSet[a%b2 + 1], c); \\ turns the number into the given base
    a = a\b2;
  );
  return(c);
}
addhelp(toBase, "toBase(numb1, b1, b2): turns a number from a given base to another base.");

truthTable(P) =
{
    my(var = variables(P), t, b);
    for (i = 0, 2^#var - 1 ,
        t = eval(P);
        for (j = 0, #var - 1,
            b = bittest(i, j);
            t = subst(t, var[j + 1], b);
            print1(b)
        );
        print(!!t)
    );
};
addhelp(truthTable, "truthTable(P): returns the truth table of the given expression.\nExample:\n\ntruthTable(x+y)\n000\n101\n011\n111");

isPalindrome(s) =
{
  s = Vec(Str(s));
  for (i = 1, #s\2,
    if (s[i] != s[#s - i + 1], return(0))
  );
  return (1);
}

v.toFloat = apply(x -> x*1.0, v);


recurrencef(f, a, t, n) =
{
   for (i = 1, n, t = f(a, t));
   return (t);
}
addhelp(recurrencef, "recurrencef(f, a, t, n): given a recurrence function f, the parameter a and the initial aproximation t, it returns the nth aproximation of the value we want to calculate.")

scalef(f, t, {k = 1}) = f(t/k) * k;
addhelp(scalef, "scalef(f, t, {k = 1}): given a function f and its input t, it scales the function by a factor of k and returns the corresponding from the scale version of the given function.");

translatef(f, t, {x = 0}, {y = 0}) = y + f(t - x);
addhelp(translatef, "translatef(f, t, {x = 0}, {y = 0}): given a function f and its input t, it translates the function among the axis x and y units, and returns the corresponding from the translated version of the given function.")

scaleAndTranslatef(f, t, {k = 1}, {x = 0}, {y = 0}) = y + f(t/k - x)/k;
addhelp(scaleAndTranslatef, "scaleAndTranslatef(f, t, {k = 1}, {x = 0}, {y = 0}): given a function f and its input t,  it scales the function by a factor of k and translates the function among the axis x and y units and returns the corresponding from the scaled translated version of the given function.");
