# fun_math_approximations.gp



ln_approx(x) = (x - 1/x) / 2

ln_approx1(x, n = 100) =
{
	my (p = 10 * n);

	return ( ln_approx(x^(1/p)) * p );
}

ln_approx2(x) =
{
	my (logOf10 = 2.3025850929940456840179914546843642076);
	my (p = #Str(x));

	return ( ln_approx(x / 10^p) + p * logOf10);
}