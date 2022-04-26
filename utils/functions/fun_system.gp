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