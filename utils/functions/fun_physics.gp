\\ fun_physiscs.gp


\r _utils/functions/fun_math.gp



distanceFromLatLonInMetters(p1, p2) =
{
    my(toRad = Pi / 180);
    my(R = 6371000); \\ Radius of the earth

    my(lat1 = p1[1] * toRad);
    my(lat2 = p2[1] * toRad);

    my(deltaLat = (p2[1] - p1[1]) * toRad);
    my(deltaLon = (p2[2] - p1[2]) * toRad);

    my(sinDeltaLatDiv2 = sin(deltaLat/2));
    my(sinDeltaLonDiv2 = sin(deltaLon/2));

    my(a = sinDeltaLatDiv2^2 + cos(lat1) * cos(lat1) * sinDeltaLonDiv2^2);

    my(angle = 2 * atan(sqrt(a) / sqrt(1-a)));

    return (R * angle);
}