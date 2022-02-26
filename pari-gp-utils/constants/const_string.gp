\\ const_string.gp



AsciiSet = strsplit(strchr([1..255]));
addhelp(AsciiSet, "AsciiSet: a vector with all the ASCII characters.");

LowerSet = strsplit(strchr([(65 + 32)..(64 + 26 + 32)]));
addhelp(LowerSet, "LowerSet: a vector with all the lowercase letters.");

UpperSet = strsplit(strchr([65..(64 + 26)]));
addhelp(UpperSet, "UpperSet: a vector with all the uppercase letters.");

DigitSet = ["0","1","2","3","4","5","6","7","8","9"];
addhelp(DigitSet, "DigitSet: a vector with all the digits from decimal system as a string.");

BaseDigitSet = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
addhelp(BaseDigitSet, "BaseDigitSet: a vector with the characters from 0 to 9 and a to z. This is used to represent numbers within different bases.")