\\ fun_math_linearInterpolation.gp



map(t, a1, b1, a2, b2) = a2 + (b2 - a2)*(t - a1)/(b1 - a1);
addhelp(map, "map(t, a1, b1, a2, b2): maps a value t in range [a1, b1] to range [a2, b2].");

lerp(t, a, b) = a + (b - a)*t;
addhelp(lerp, "lerp(t, a, b): maps a value t from range [0, 1] to range [a, b].");

inverseLerp(t, a, b) = t/(b - a);
addhelp(inverseLerp, "inverseLerp(t, a, b): maps a value t from range [a, b] to range [0, 1].");

clamp(t, a, b) = if ( (t < a), a, (b < t), b, t );
addhelp(clamp, "clamp(t, a, b): clamps the given value between the given range [a, b].");

scale(t, n, f) = t*f(t, n);
addhelp(scale, "scale(t, n, f): scales the returning value of the function f evaluated at t with n iterations.");

flip(t) = 1 - t;
addhelp(flip, "flip(t): flips the given value between 0 and 1.\nSource: https://www.febucci.com/2018/08/easing-functions/");

easeInN(t, n) = t^n;
addhelp(easeInN, "easeInN(t, n): smooth start with n iterations where t is in range [0, 1].\nSource: https://youtu.be/mr5xkf6zSzk?t=781");

easeOutN(t, n) = 1-(1-t)^n;
addhelp(easeOutN, "easeOutN(t, n): smooth stop with n iterations where t is in range [0, 1].\nSource: https://youtu.be/mr5xkf6zSzk?t=1048");

easeIntOutN(t, n) = lerp(t, easeInN(t, n), easeOutN(t, n));
addhelp(easeIntOutN, "easeIntOutN(t, n): smooth start and stop with n iterations where t is in range [0, 1].\nSource: https://www.febucci.com/2018/08/easing-functions/");

easeInArchN(t, n) = (1 - t) * t^n;
addhelp(easeInArchN, "easeInArchN(t, n): archs the curve with easeIn n iterations where t is in range [0, 1].\nSource: https://youtu.be/mr5xkf6zSzk?t=1431");

easeOutArchN(t, n) = t * (1 - t)^n;
addhelp(easeOutArchN, "easeOutArchN(t, n): archs the curve with easeOut n iterations where t is in range [0, 1].\nSource: https://youtu.be/mr5xkf6zSzk?t=1466");

bellCurve2N(t, n) = easeOutN(t, n) * easeInN(t, n);
addhelp(bellCurve2N, "bellCurve2N(t, n): bell curve with easeIn and easeOut n iterations where t is in range [0, 1].\nSource: https://youtu.be/mr5xkf6zSzk?t=1476");

spikeN(t, n) = if ( t <= 0.5, easeInN(t * 2, n), easeInN(flip(t) * 2, n) );
addhelp(spikeN, "spikeN(t, n): adds a peak in the middle of the curve where t is in range [0, 1].\nSource: https://www.febucci.com/2018/08/easing-functions/");
