\\ fun_logicGates.gp



not(bit) =
{
   if (type(bit) == "t_INT" || type(bit) == "t_STR",

      if(bit == 0 || bit == 1, return(!bit));

      return(eval( strjoin(not(eval( Vec(Str(bit)) ))) ));
   );
   bit = apply((b) -> !eval(b), bit);
   return (bit);
}
addhelp(not, "not(bit): applies the negation gate to the given bit/bits/vector/matrix.");

or(bits[..]) =
{
   my(b1 = eval(bits[1]));

   if ( type(b1) == "t_VEC", bits = b1 ); \\ If a vector is given bits is set to that vector

   my(b2 = eval(bits[2]));

   if (bits == 2 && type(b1) == "t_INT" && type(b2) == "t_INT",

      return( bitor(b1, b2) );
   );
   foreach ( bits, bit, if (bit == 1, return(1)) );
   return (0);
}
addhelp(or, "or(bits[..]): applies the OR the given bits, bit vector, undefined number of parameters or to every pair of bits.");

and(bits[..]) =
{
   my(b1 = eval(bits[1]));

   if ( type(b1) == "t_VEC", bits = b1 ); \\ If a vector is given bits is set to that vector

   my(b2 = eval(bits[2]));

   if (bits == 2 && type(b1) == "t_INT" && type(b2) == "t_INT",

      return( bitand(b1, b2) );
   );
   foreach ( bits, bit, if (bit == 0, return(0)) );
   return (1);
}
addhelp(and, "and(bits[..]): applies the AND the given bits, bit vector, undefined number of parameters or to every pair of bits.");

xor(bits[..]) =
{
   my(b1 = eval(bits[1]));

   if ( type(b1) == "t_VEC", bits = b1 ); \\ If a vector is given bits is set to that vector

   my(b2 = eval(bits[2]));

   if (#bits == 2 && type(b1) == "t_INT" && type(b2) == "t_INT",

      return (bitxor(b1, b2));
   );
   my(oneCount = 0);
   foreach (bits, bit,

      oneCount += bit;
      if (oneCount > 1, return(0));
   );
   return (1);
}
addhelp(xor, "xor(bits[..]): applies the XOR the given bits, bit vector, undefined number of parameters or to every pair of bits.");

nor(bits[..]) = not(or(bits));
addhelp(nor, "nor(bits[..]): applies the negate OR gate.");

nand(bits[..]) = not(and(bits));
addhelp(nand, "nand(bits[..]): applies the negate AND gate.");

xnor(bits[..]) = not(xor(bits));
addhelp(xnor, "xnor(bits[..]): applies the negate XOR gate.");
