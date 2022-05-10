\\ fun_files.gp

fileExists(filename) = if ( iferr(readstr(filename), E, 0), 1, 0 )
addhelp(fileExists, "fileExists(filename): given a filename it returns 1 if the file exists.");

createFolder(filename) = if( !fileExists(filename), system(Str("mkdir " filename)) );
addhelp(createFolder, "createFolder(filename): creates a folder with the given name.")

deleteFolder(foldername, recursive = 0) =
{
   my (str = " ");
   if (recursive, str = " /s /q ");

   if( fileExists(foldername), system(Str("rm" str, foldername)) );
}
addhelp(deleteFolder, "deleteFolder(filename, {recursive = 0}): deletes the given foldername.")

createFile(text, mode = "w", filename = "text.txt", Folder = "Texts") =
{
   my (path = Str(Folder, "/", filename));
   createFolder(Folder);
   write(path);

   my (file = fileopen(path, mode));
   filewrite(file, text);
   fileclose(file);
}
addhelp(createFile, "createFile(text, mode = 'w', filename = 'text.txt', Folder = 'Texts'): creates a file given a filename)")
