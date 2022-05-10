\\ fun_member.gp


\r _utils/functions/fun_math_vectors.gp
\r _utils/functions/fun_strings.gp
\r _utils/functions/fun_math.gp
\r _utils/functions/fun_math_linearInterpolation.gp



\\\\\\ BUILT-IN FUNCTIONS

\\\ ALIAS
alias("_.arg", arg)
alias("_.real", real)
alias("_.imag", imag)
alias("_.conj", conj)
alias("_.isprime", isprime)

\\\ MEMBER
M.mget = (x) -> mapget(M, x)


\\ ALIAS
alias("_.length", Length)
alias("_.isPalindrome", isPalindrome)
alias("_.fileExists", fileExists)
alias("_.toDegrees", toDegrees)
alias("_.toRadians", toRadians)

\\ VECTORS
alias("_.vnorm", norm)
alias("_.vnormalize", normalize)

\\ STRING
alias("_.strReverse", strReverse)
alias("_.strInterpolation", strInterpolation)
alias("_.strJoinln", strJoinln)

\\ APPLY
x.toDegrees = apply(toDegrees, x)
x.toRadians = apply(toRadians, x)

\\ FUNCTIONS WITH PARAMETERS
t.map         = (a1, b1, a2, b2) -> map        (t, a1, b1, a2, b2)
t.lerp        = (a, b)           -> lerp       (t, a, b)
t.inverseLerp = (a, b)           -> inverseLerp(t, a, b)
t.clamp       = (a, b)           -> clamp      (t, a, b)

n.toBase = (b1, b2) -> toBase(n, b1, b2)

u.vdot    = (v) -> vdot   (u, v)
u.vcross  = (v) -> vcross (u, v)
u.vdist   = (v) -> vdist  (u, v)
u.vdistSq = (v) -> vdistSq(u, v)

z.rotate = (angle) -> rotate(z, angle)

str.strStartsWith = (inner)    -> strStartsWith(str, inner)
str.strContains   = (inner)    -> strContains  (str, inner)
str.strEndsWith   = (inner)    -> strEndsWith  (str, inner)
str.strInsert     = (index, n) -> strInsert    (str, index, n)
str.strSub        = (index, l) -> strSub       (str, i, l)
str.strRepeat     = (n)        -> strRepeat    (str, n)

f.recurrencef        = (a, t, n)          -> recurrencef       (f, a, t, n)
f.scalef             = (t, {k})           -> scalef            (f, t, k)
f.translatef         = (t, {x}, {y})      -> translatef        (f, t, x, y)
f.scaleAndTranslatef = (t, {k}, {x}, {y}) -> scaleAndTranslatef(f, t, k, x, y)

M.mforeach = (expr) -> foreachMap(M, expr)
