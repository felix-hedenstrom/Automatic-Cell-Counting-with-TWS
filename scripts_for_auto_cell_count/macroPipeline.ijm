input = getDirectory("Choose source directory of macro");
print(input);

File.setDefaultDir(input);
print(File.getDefaultDir);

//textOut = File.open("");
//File.saveString(input, "sourcePath.txt")
//print(textOut, input);
//File.close(textOut);

exec("python", input + "file_architect.py");

//TODO figure out bean shell calling
//runMacro(input + "BS_TWS_apply.bsh");

// Run ImageJ macros
//runMacro(input + "just_thresh.ijm", input);
//runMacro(input + "count_from_roi.ijm", input);
//runMacro(input + "count_over_dir.ijm", input);
y = input + "test.py";
z = input + "classifier_comparison.py";

print(y);
// Next run classifier comparison
//exec("python", y);
exec("python", z, input);
print("finished pipeline");