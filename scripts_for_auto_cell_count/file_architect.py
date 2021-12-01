# -*- coding: utf-8 -*-
"""
Created on Fri Oct 22 09:25:36 2021

@author: Theo, Tyler
File architect: creates the correct number of classifier folders in output folders
"""
import os
import sys

print("Starting file_architect.py")
# Method to change working directory from inputted ImageJ Macro
curr_dir = os.getcwd()
def setDir(arg1):
    curr_dir = arg1
    os.chdir(curr_dir)
setDir(sys.argv[1])

test_stage = False
if len(sys.argv) == 3:
    class_list_pre_trim = []
    class_list_pre_trim.append(sys.argv[2])

    #set the location of the source folder where the folder is installed. 
    source = "../training_area/testing_area/"
    class_origin =  source + "Classifiers/"
    test_stage = True
else:
    #set the location of the source folder where the folder is installed. 
    source = "../training_area/"
    #locate classifiers
    class_origin =  source + "Classifiers/"
    #determing the number of classifiers
    class_list_pre_trim = os.listdir(class_origin)

#trim the classifier names of the ".model" at the end
class_list = []
for x in class_list_pre_trim:
    name = x.split('.model')
    class_current = [(name[0])]
    class_list += class_current
print(class_list)
    
#make folders in locations
output = source + "Weka_Output/"
output_prob = source + "Weka_Probability/"
output_prob2 = source + "Weka_Probability_Projected/"
output_thresh = source + "Weka_Output_Thresholded/"
output_project = source + "Weka_Output_Projected/"
output_count = source + "Weka_Output_Counted/"

#create classifier folders in each prescribed location if it doesn't already exist
for class_ID in class_list:
    if not os.path.isdir(output + class_ID):
        os.mkdir(output + class_ID)
    if not os.path.isdir(output_prob + class_ID):
        os.mkdir(output_prob + class_ID)    
    if not os.path.isdir(output_prob2 + class_ID):
        os.mkdir(output_prob2 + class_ID)    
    if not os.path.isdir(output_thresh + class_ID):
        os.mkdir(output_thresh + class_ID)
    if not os.path.isdir(output_project + class_ID):
        os.mkdir(output_project + class_ID)
    if not os.path.isdir(output_count + class_ID):
        os.mkdir(output_count + class_ID)

# Generate classifier subfolders for audit directories
if test_stage:
    if not os.path.isdir(source + "Audit_Images/"):
        os.mkdir(source + "Audit_Images/")
    if not os.path.isdir(source + "Audit_Images/" + class_list[0]):
        os.mkdir(source + "Audit_Images/" + class_list[0])

    if not os.path.isdir(source + "Audit_Hand_Counts/"):
        os.mkdir(source + "Audit_Hand_Counts/")
    if not os.path.isdir(source + "Audit_Hand_Counts/" + class_list[0]):
        os.mkdir(source + "Audit_Hand_Counts/" + class_list[0])

    if not os.path.isdir(source + "Audit_Counted/"):
        os.mkdir(source + "Audit_Counted/")
    if not os.path.isdir(source + "Audit_Counted/" + class_list[0]):
        os.mkdir(source + "Audit_Counted/" + class_list[0])
    
print("Finished file_architect.py")