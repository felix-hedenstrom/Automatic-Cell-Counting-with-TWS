/**
 * Author: Theo Kataras, Tyler Jang
 * Date: 2/3/2022
 * 
 * Description:
 */
// The user needs to select the source directory of the code so that the program knows where the user has downloaded the program.
input = getDirectory("Choose source directory of the macro (Scripts for Auto Cell Count)");

// Set measurements to calculate
run("Set Measurements...", "area mean standard modal min centroid center perimeter bounding fit shape feret's integrated median skewness kurtosis area_fraction limit display redirect=None decimal=8");

// Populate all folders. If folders already exist, selectively does not make those folders
exec("python", input + "file_architect.py", input);

// Ask if the user needs to run Weka 
Dialog.create("Run Weka to create new probability output?");
Dialog.addCheckbox("Do you need to run Weka?", true);
Dialog.show();
ifWeka = Dialog.getCheckbox();
if (ifWeka) {
	run("BS TWS apply prob");
} 

// Threshold the images into distinct values
//runMacro(input + "just_thresh.ijm", input);

// TODO Check if can run without projected images
searchDirectory = input;
Dialog.create("Multiple Image Segmentations?");
Dialog.addCheckbox("Do you need to project multiple image segmentations?", false);
Dialog.show();
result = Dialog.getCheckbox();
if (result) {
	exec("python", input + "project_N_images_by_ID.py", input);
	searchDirectory = input + "../training_area/Weka_Output_Projected/";
} else {
	searchDirectory = input + "../training_area/Weka_Output/";
}

// Run ImageJ macros
runMacro(input + "count_from_roi.ijm", input);

runMacro(input + "count_over_dir_prob_TK.ijm", searchDirectory);

// Next, run classifier comparison
exec("python", input + "classifier_comparison.py", input);

// Run ROC Curve script
exec("python", input + "roc_curve.py", input);

print("Finished Act 1");