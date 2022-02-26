\\ fun_math_quaternions.gp



\\ https://eater.net/quaternions/											# This is to understand quartenions
\\ https://compsci290-s2016.github.io/CoursePage/Materials/EulerAnglesViz/  # This is for visualizing Euler angles
\\ https://www.andre-gaschler.com/rotationconverter/						# This is a quaternion calculator

\\ Some of the functions are taken from https://rosettacode.org/wiki/Quaternion_type#PARI.2FGP



Q_ZERO = [0, 0, 0, 0];
Q_ONE  = [1, 1, 1, 1];

Q_W = [1, 0, 0, 0];
Q_I = [0, 1, 0, 0];
Q_J = [0, 0, 1, 0];
Q_K = [0, 0, 0, 1];

q.qw = q[1];
q.qi = q[2];
q.qj = q[3];
q.qk = q[4];


q.qnorm =
{
    if (type(q) != "t_VEC" || #q != 4, error("incorrect type"));
    
    sqrt( q[1]^2 + q[2]^2 + q[3]^2 + q[4]^2 );
}
addhelp(qnorm, "_.qnorm: returns the magnitude the quaternion.");

q.qconj =
{
    if (type(q) != "t_VEC" || #q != 4, error("incorrect type"));
    -[ -q[1], q[2], q[3], q[4] ];
}
addhelp(qconj, "_.qconj: returns the conjugated quaternion.");

q.qinverse = r.qconj/r.qnorm^2;

q.qadd =
{
    if (type(q) != "t_VEC" || #q != 4, error("incorrect type"));

    r -> if (type(r) == "t_INT" || type(r) == "t_REAL",
        [ q[1] + r, q[2], q[3], q[4] ]
    ,
        if(type(r) == "t_VEC" && #r == 4,
            q + r
        ,
            error("incorrect type")
        )
    );
}
addhelp(qadd, "_.qadd: returns the sum of the quaternions.");

q.qmult =
{
    if (type(q) != "t_VEC" || #q != 4, error("incorrect type"));
    r -> if (type(r) == "t_INT" || type(r) == "t_REAL",

        r * q
    ,
        if(type(r) == "t_VEC" && #r == 4,
            [
                q[1]*r[1] - q[2]*r[2] - q[3]*r[3] - q[4]*r[4],
                q[1]*r[2] + q[2]*r[1] + q[3]*r[4] - q[4]*r[3],
                q[1]*r[3] - q[2]*r[4] + q[3]*r[1] + q[4]*r[2],
                q[1]*r[4] + q[2]*r[3] - q[3]*r[2] + q[4]*r[1]
            ]
        ,
            error("incorrect type")
        );
    );
}
addhelp(qmult, "_.qmult: returns the product of the quaternions.");

q.qdiv = r -> q.qmult(r.qinverse);

q.qnormalize = q/q.qnorm;
q.qreal = q[1];
q.qimag = [q[2], q[2], q[3]];
q.qdot = r -> q[1]^2 + q[2]^2 + q[3]^2 + q[4]^2;

e.qEulerToQuaternion =
{
    my(result = [0, 0, 0, 0]);
    my(xOver2, yOver2, zOver2);
    my(sinXOver2, sinYOver2, sinZOver2);
    my(cosXOver2, cosYOver2, cosZOver2);

    xOver2 = e[1]/2.0;
    sinXOver2 = sin(xOver2);
    cosXOver2 = cos(xOver2);

    yOver2 = e[2]/2.0;
    sinYOver2 = sin(yOver2);
    cosYOver2 = cos(yOver2);

    zOver2 = e[3]/2.0;
    sinZOver2 = sin(zOver2);
    cosZOver2 = cos(zOver2);

    result[1] = cosXOver2 * cosYOver2 * cosZOver2 + sinXOver2 * sinYOver2 * sinZOver2;
    result[2] = sinXOver2 * cosYOver2 * cosZOver2 - cosXOver2 * sinYOver2 * sinZOver2;
    result[3] = cosXOver2 * sinYOver2 * cosZOver2 + sinXOver2 * cosYOver2 * sinZOver2;
    result[4] = cosXOver2 * cosYOver2 * sinZOver2 - sinXOver2 * sinYOver2 * cosZOver2;

    return (result);
}
addhelp(qEulerToQuaternion, "_.qEulerToQuaternion: turns an euler vector into a quaternion.\nSource:https://stackoverflow.com/questions/11492299/quaternion-to-euler-angles-algorithm-how-to-convert-to-y-up-and-between-ha");


\\ This function may not work as intended
q.qQuaternionToEuler =
{[
         atan( (2*(q[1]*q[3] - q[2]*q[4])) / (1 - 2*(q[3]^2 - q[4]^2)) ),
         atan( (2*(q[1]*q[2] - q[3]*q[4])) / (1 - 2*(q[2]^2 - q[4]^2)) ),
         asin(  2*(q[2]*q[3] + q[1]*q[4]) )
]}
addhelp(qQuaternionToEuler, "_.qQuaternionToEuler: turns a quaternions into an euler vector.\nSource: https://answers.unity.com/questions/416169/finding-pitchrollyaw-from-quaternions.html");
