# Automated Admissions Data Entry Clerk

The process of renaming application documents is a task that Westmont Admissions Data Entry Clerks spend countless hours
on. The Automated Admissions Data Entry Clerk (AADEC) is a tool to automate the renaming process as it analyzes and         classifies prospective students’ letters of recommendations, transcripts, school profiles, and so forth. The AADEC's data   cleaning and extraction are handled by standard bash scripting, while the data analysis is done by the natural language     processing (NLP) service from Amazon Web Services (AWS) which utilizes machine learning to classify the letters of rec.     The entire workflow of the project will soon be compiled into a user friendly desktop application or easily executable  file.
  
  For more details and in depth details about the project:
  * See [Poster](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Poster.pdf)
  * Skip to [Abstract](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#abstract)
  

## Table of Contents:
  1) [Download Requirements](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#dnld)
  2) [How to Use](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#How-to-use:)
  3) [Abstract](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#abstract)
  4) [Data Preparation](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#dataprep)
  5) [Workflow](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#workflow)
  6) [Classification](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#classification)
  7) [Results](https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/README.md#results)
 
<a name="dnld:"/>

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

<a name="How-to-use:"/>

### How to use:

- Simply run the command: './rename.sh'

- Drag the folders as it asks you

- ENJOY!

<a name="abstract"/><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.00.44%20PM.png" width=50%><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Screen%20Shot%202019-07-18%20at%201.10.32%20PM.png" width=45% height="125" align="top" hspace='20'>


<a name="dataprep"/><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.01.19%20PM.png" width=50% align="top"><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.02.08%20PM.png" width=50%>


<a name="workflow"/><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.02.44%20PM.png" width=50%><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.03.20%20PM.png" width=50%>

<a name="classification"/><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.03.59%20PM.png" width=50% align="top"><a name="results"/><img src="https://github.com/ichiu9/Automated-Admissions-Data-Entry-Clerk/blob/master/Poster_Images/Screen%20Shot%202019-07-18%20at%2012.04.26%20PM.png" width=50%>




