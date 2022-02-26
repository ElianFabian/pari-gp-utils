\\ fun_math_random.gp



randomRange(a, b) = random([a, b]);
addhelp(randomRange, "randomRange(a, b): returns a random number between the given ranges, both inclusive.");

randomValue({N = 2^31}) = random(N)/N*1.0
addhelp(randomValue, "randomValue({N = 2^31}): returns a  random value between 0 and 1. The larger the value of N the more ammount of digits will produce.");

randomFromSeed(n, {seed = getrand}, {N = 2^31}) =
{
  setrand(seed);
  for(i = 1, n - 1, random(N));

  return(random);
}
addhelp(randomFromSeed, "randomFromSeed(n, seed, {N = 2^31}): returns a nth random number from the given a seed.");

randomFromVector(v) = v[ random(#v) + 1 ];
addhelp(randomFromVector, "randomFromVector(v): returns a random value from the given vector.");

randomVectorValues({n = 3}, {N = 2^31}) = vector(n, x, random(N)/N*1.0);
addhelp(randomVectorValues, "randomVectorValues({n = 3}, {N = 2^31}): returns a vector with random values between 0 and 1.");

randomVectorFromRange({n = 3}, {a = 0}, {b = 2^31 - 1}) = vector(n, x, random([a, b]));
addhelp(randomVectorFromRange, "randomVectorFromRange({n = 3}, {a = 0}, {b = 2^31 - 1}): returns a vector with random values from the given range.")
