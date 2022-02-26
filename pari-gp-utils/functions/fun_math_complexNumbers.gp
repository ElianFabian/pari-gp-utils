\\ fun_math_complexNumbers.gp



rotate(z, angle) =
{
    my(v = [norm(z), arg(z)]);
    v[2] += angle;

    return( v[1]*(cos(v[2]) + I*sin(v[2])) );
}
addhelp(rotate, "rotate(z, angle): rotates a complex number z a certain angle.");
