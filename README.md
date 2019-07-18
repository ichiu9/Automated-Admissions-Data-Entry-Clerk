# Automated Admissions Data Entry Clerk

The process of renaming application documents is a task that Westmont Admissions Data Entry Clerks spend countless hours
on. The Automated Admissions Data Entry Clerk (AADEC) is a tool to automate the renaming process as it analyzes and         classifies prospective students’ letters of recommendations, transcripts, school profiles, and so forth. The AADEC's data   cleaning and extraction are handled by standard bash scripting, while the data analysis is done by the natural language     processing (NLP) service from Amazon Web Services (AWS) which utilizes machine learning to classify the letters of rec.     The entire workflow of the project will soon be compiled into a user friendly desktop application or easily executable  file.
  
  For more details and in depth details about the project, see poster:
  
  https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster.pdf

### Poster Contents:
  1) Abstract
  2) Data Preparation
  3) Workflow
  4) Classification
  5) Results

    
### A few download requirements:
- If you are running on Windows:
  - Download Cygwin or Winbash
  
- Check if you have homebrew: 'brew -v'
  - If brew is not on your computer 
    - Download Homebrew with 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  - If brew is on your computer
    - Update Homebrew with
    'brew update'
    
- Download xpdf: 'brew install xpdf'

- Check that pdftotext is working with command 'pdftotext -v'

- cd into the folder where rename.sh is located and use 'chmod +x rename.sh' to grant permission to run

### How to use:

- Simply run the command: './rename.sh'

- Drag the folders as it asks you

- ENJOY!

