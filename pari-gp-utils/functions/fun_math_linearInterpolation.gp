\\ fun_math_linearInterpolation.gp



map(t, a1, b1, a2, b2) = a2 + (b2 - a2)*(t - a1)/(b1 - a1);
addhelp(map, "map(t, a1, b1, a2, b2): maps a value t in range [a1, b1] to range [a2, b2].");

lerp(t, a, b) = a + (b - a)*t;
addhelp(lerp, "lerp(t, a, b): maps a value t from range [0, 1] to range [a, b].");

inverseLerp(t, a, b) = t/(b - a);
addhelp(inverseLerp, "inverseLerp(t, a, b): maps a value t from range [a, b] to range [0, 1].");

clamp(t, a, b) = if ( (t < a), a, (b < t), b, t );
addhelp(clamp, "clamp(t, a, b): clamps the given value between the given range [a, b].");
