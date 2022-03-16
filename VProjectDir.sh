#!/bin/bash
#This script is used to create all the subdirectories needed for a video project.

cd /Volumes/  #Go to the volumes directory.

#This loop is used to list all the directories and naviguate inside them.
while : #This is an infinite loop, there's no conditition. The break will stop the loop.
do
echo "Please select a folder, press \"1\" to create a folder or \"Ctrl + C\" to quit : "
select d in \-\>\ Create\ folder \<\-\ Go\ back */; do  #Allows you to create a list. 1) is to create a folder, 2) is to go back and */ is to list all directories.
[[ -n "$d" ]] && break; echo "Invalid selection, please select a valid option"  #This is to test if the selection is in the list. If not, it will print a text asking to do a valid selection. -n = True if lenght of string is nonzero.
done  #End of select.
if [[ "$d" == \-\>\ Create\ folder ]]; then break #If create folder is selected, it will stop the loop and go to the next loop.
elif [[ "$d" == \<\-\ Go\ back ]]; then cd .. #If go back is selected, it will go back in the previous directory.
else cd "$d" && pwd #If no one of the two if are selected, it will change directory and loop again until create directory is selected.
fi
done  #End of the loop

#This loop is used to create directories before the final project directory is created.
while : #This is an infinite loop, there's no condition. The break will stop the loop.
do
read -p "If you want to create a folder first, enter the name or press \"S\" to skip to the project name : " dirName  #If the value S or s is typed as the folder name, it will stop the loop and go for the project directories creation.
if [[ ! -d $dirName ]]; then #Test if the directory exist. If not, it will proceed to create a new directory and move inside of it.
  echo "Directory doesn't exists, creating now."
  mkdir "$dirName" && cd "$dirName" && pwd  #Used to print the path.
else
  echo "Directory exist"
fi
fi
done  #End of the loop.

#This is to create the project directory and all the subdirectories inside it.
read -p "Enter the name of the folder : " #Takes what the user typed and assign it to a variable.
if [[ ! -d $fName ]]  #Test if the directory exist.
then
  echo "Directory doesn't exist, creating all project folders now."
  mkdir "$fName" && cd "$fName" && pwd  #Creation of the directory and moving inside.
  mkdir -p {Audio/{Project,Music,Voice},Footage,Images,Project/AE,Render} #You can edit this part to fit your need.
else
  echo "Directory exist"
fi #End of code.
