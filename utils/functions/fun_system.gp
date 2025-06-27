switch(x, valuesAndCode[..]) =
{
    for (i = 1, floor(#valuesAndCode / 2),

        my(j = i * 2 - 1);

        my(currentValue = valuesAndCode[j]);
        my(currentCode = valuesAndCode[j+1]);

        if (x == currentValue, currentCode(); return());
    );

    if (#valuesAndCode % 2 == 1, valuesAndCode[#valuesAndCode](); return());
}
addhelp(switch, "switch(x, valuesAndCode[..]): check x and execute the corresponding code.");


\\ EXAMPLE:
\\switch(x, {
\\    1, ()-> print("one"),
\\    2, ()-> print("two"),
\\    3, ()-> print("three"),
\\    4, ()-> print("four"),
\\    5, ()-> print("five"),
\\    ()-> print("default")
\\})



getOsName() = {
  if(system("uname > /dev/null 2>&1") == 0,
    os = extern("uname");
    if(os == "Linux",
      if (system("getprop > /dev/null 2>&1") == 0,
        return("android")
      );
      return("linux")
    );
    if(os == "Darwin", return("macOS"));
    return(os);
  );

  if(system("ver > nul 2>&1") == 0,
    return("windows");
  );

  return("");
}


getAndroidApiLevel() = {
    if (system("getprop > /dev/null 2>&1") == 0,
        return(extern("getprop ro.build.version.sdk"));
    );
    return(0);
}
