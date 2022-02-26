\\ fun_strings.gp



strSub(str, index, l) = strchr(Vecsmall(str)[n..index+l-1]);
addhelp(strSub, "strSub(str, index, l): returns a substring given the index and the length.\nSource: https://stackoverflow.com/questions/66966205/is-there-a-better-way-to-get-substring-in-pari-gp");

strReverse(str) = return ( strjoin(Vecrev(Vec(strtex(str)))) );
addhelp(strReverse, "strReverse(str): returns the reverse string.");

strRepeat(str, n) = strjoin( vector(n, s, str) );
addhelp(strRepeat, "strRepeat(str, n): returns a string str repeated n times.");

strInsert(str, index, n) =
{
   str = List(strsplit(str));
   listinsert(str, index, n);
   return ( strjoin(Vec(str)));
}
addhelp(strInsert, "strInsert(str, index, n): inserts a string in the given position.");

strInterpolation(str) =
{
   my(strList = strsplit(str));
   my(inside  = "");

   if (strList[1] == "{",

      strList[1] = "",                      \\ If the string starts with "{" then we delete it
      strList[1] = concat("\"", strList[1]) \\ If not we add a mark quote to the beginning
   );
   
   for (i = 1, #strList,
      if (
         strList[i] == "{",
            strList[i] = "\",",
         strList[i] == "}",
            strList[i] = ",\""
      )
   );
   if (strList[#strList - 1] == "," && strList[#strList] == "\"",
      
      strList[#strList] = "",                              \\ Deletes the final quote mark and the comma in case the string ends with a variable

      strList[#strList] = concat(strList[#strList], "\""); \\ Adds the quote mark in case the string ends with a string
   );
   inside = strjoin(strList);
   inside = Str("["inside"]");

   return ( concat(eval(inside)) );
}
addhelp(strInterpolation, "strInterpolation(str): Interpolates the strings between curly brackets.\nExample: \"1 + 1 = {1+1}\" -> \"1 + 1 = 2\".\nIt doesn't work with local variables.")

strJoinln(arr) =
{
   my(str = "");
   for (i = 1, #arr,

      str = concat([str, arr[i], "\n"]);
   );

   strArr = strsplit(str);
   strArr[#strArr] = "";   \\ Deletes the last scape character
   str = strjoin(strArr);

   return (str);
}
addhelp(strJoinln, "strJoinln(arr): given a vector returns a string concatenating all the elements with an escape character.")

strStartsWith(str, prefix)={
  str=Vec(str);
  prefix=Vec(prefix);
  if(#prefix > #str, return(0));
  for(i=1,#prefix,if(prefix[i]!=str[i], return(0)));
  return(1);
}
addhelp(strStartsWith, "strStartsWith(str, prefix): returns 1 if str starts with prefix.\nSource: https://rosettacode.org/wiki/String_matching#PARI.2FGP");

strContains(str, inner)={
  my(good);
  str=Vec(str);
  inner=Vec(inner);
  for(i=0,#str-#inner,
    good=1;
    for(j=1,#inner,
      if(inner[j]!=str[i+j], good=0; break)
    );
    if(good, return(i+1))
  );
  return(0);
}
addhelp(strContains, "strContains(str, inner): returns the position when inner is present in str.\nSource: https://rosettacode.org/wiki/String_matching#PARI.2FGP");

strEndsWith(str, suffix)={
  str=Vec(str);
  suffix=Vec(suffix);
  if(#suffix > #str, return(0));
  for(i=1,#suffix,if(suffix[i]!=str[i+#str-#suffix], return(0)));
  return(1);
}
addhelp(strEndsWith, "strEndsWith(str, suffix): returns 1 if str ends with prefix.\nSource: https://rosettacode.org/wiki/String_matching#PARI.2FGP");

caesarCipher(s, n)=
{
  strchr(Vecsmall(apply(k - > if( k > 96 && k < 123, (k+n-97)%26 + 97, if( k>64 && k<91, (k+n-65)%26 + 65, k ) ),
  Vec(Vecsmall(s)))))
}
addhelp(caesarCipher, "caesarCipher(s, n): applies caesar cipher to the given string.\nSource: https://rosettacode.org/wiki/Caesar_cipher#PARI.2FGP");
