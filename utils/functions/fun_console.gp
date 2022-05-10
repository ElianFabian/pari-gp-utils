\\ fun_console.gp


\r _utils/constants/const_console.gp
\r _utils/functions/fun_member.gp



setConsoleColors(error = 9, historyNumbers = 13, prompt = 11, inputLine = 15, output = 14, helpMessages = 10, timer = 11) =
{
    default(colors,
        Str(
            error          ","
            historyNumbers ","
            prompt         "," \\ ignore
            inputLine      "," \\ ignore
            output         ","
            helpMessages   ","
            timer
        )
    );
}
addhelp(setConsoleColors, "setConsoleColors(error = 9, historyNumbers = 13, prompt = 11, inputLine = 15, output = 14, helpMessages = 10, timer = 11): set the font colors of the console. If there are no arguments it will estalish the deafault colors.");

setMyConsoleColorsConf() =
{
    setConsoleColors(
        COLOR_RED,
        COLOR_BLUE,
        COLOR_YELLOW,
        COLOR_YELLOW,
        COLOR_CYAN,
        COLOR_GREEN,
        COLOR_YELLOW
    );
}

clear() = system("cls");
addhelp(clear, "clear(): clears the screen.");

printInterpolation(str[..]) = print(str.strJoinln.strInterpolation);
addhelp(printInterpolation, "printInterpolation(str[..]): prints usint string interpolation. Strings separated by commas prints them in separated lines.");
