//macro for per image count from goi. also has xy location of all points



//prompt window to select input folder
input = getDirectory("Choose source directory");
output = getDirectory("Choose output directory (Not the same as the source directory)");

//CLOSES old Results and Summary to avoid mixing with new results
run("Clear Results"); 



//hide details from user to minimize screen clutter
setBatchMode(true); 

//holds all file names from input folder
list = getFileList(input);

if(list.length < 2) {
	print("Need at least two input roi files");
} else {
//iterate  macro over the objects in the input folder
	for (i = 0; i < list.length; i++)
	        action(input, list[i]);
	
	
	//describes the actions for each image
	function action(input, filename) {
	        
	        open(input + filename);
	        run("Measure");
	      
			
			close();
			
	}
	
	
	// prints text in the log window after all files are processed
	print("counts from "+list.length+" rois")
	//run("Summarize");
	saveAs("Results", output +"/roi_counts.csv");
}