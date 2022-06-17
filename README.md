# pari-gp-utils
This is simple set of functions and constants to use in PARI/GP.


If the folder "utils" is in the PARI/GP directory to import all the functions and constants use the command:

```
\r utils/_init.gp
```

This file reads another files (_init_functions.gp and _init_constants.gp) that will import the functions and constants written in each file (both files reads all the files by default).


In you want to import only one file and that file have dependencies from others they are already included (which make imports less efficient if you import all but I don't know if there's a better way to deal with it.
