\\ fun_time.gp



sleep(milliseconds) =
{
   my(t0 = getwalltime());
   while(getwalltime() < milliseconds + t0,);
};
addhelp(sleep, "sleep(milliseconds): stops the program the number of milliseconds given.");

time_date() =
{
   my(time_date = externstr("echo %date:~6,4%-%date:~3,2%-%date:~0,2%")[1]);
   return (time_date);
}
addhelp(time_date, "time_date(): returns the current date in the format: yyyy-MM-dd.\n Only supported on Windows.");

time_hour() =
{
   my(time_hour = externstr("echo %time:~0,8%")[1]);
   return (time_hour);
}
addhelp(time_hour, "time_hour(): returns the current hour in the format hh:mm:ss.\n Only supported on Windows.");