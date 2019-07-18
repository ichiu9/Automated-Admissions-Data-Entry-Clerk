#!/bin/bash

#Ask user for which folder they want to transform

echo Hello, give me the path to the folder of files that I should rename
read FILES
echo

echo Where should these files go?
read destination
echo

#Converts all pdfs to text files
FILE="$FILES/*"
i=0
for f in $FILE;
do
  bn=$(basename "$f")
  hey="${bn%.*}"
  #echo Processing ... $hey
  pdftotext "$f" "$destination/$hey.txt"
  i=$((i+1))
  #Loop through Back up only a certain amount of times to save time
  #if [ $i -gt 1000 ]
  #then
  #  break;
  #fi
done

echo "PROCESSED $i FILES"
echo "------------------------------------------"
echo "RENAMING DOCUMENTS"

#Sends all the Letters of Recs to their own folder
DEST="$destination/*"
for g in $DEST;
do
  bb=$(basename "$g")
  h="${bb%.*}"
  firstline=$(head -n 1 "$g")
  extracase=$(head -n 3 "$g")
  thirdline=$(head -n 3 "$g"| tail -n -1)
  fifthline=$(head -n 5 "$g"| tail -n -1)
  seventhline=$(head -n 7 "$g"| tail -n -1)
  eleventhline=$(head -n 11 "$g"| tail -n -1)
  if [[ $firstline == *"Letter of Recommendation"* ]] 
  then #Easy Parchment LOR
    #LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g" #LANG=C slims it down to just the letter
    #LANC=C sed -i '' '1,2d' "$g"
    
    #Find the Name of the student
    if [[ $seventhline == *"Student Name:"* ]] 
    then
      NAME=${seventhline%A\ school\ profile*}
      NAME=${NAME##*:}
      set -- $NAME
      if [[ $3 == "" ]] # Has no Middle Name
      then
        correctName="$2, $1"
      elif [[ $3 != "" ]] #Has a Middle Name
      then
        if [[ $4 != "" ]] #Has a 4th name
        then
          mi="${3:0:1}"
          correctName="$4, $1 $2 $mi"
        else              #Has just a Middle Name
          mi="${2:0:1}"
          correctName="$3, $1 $mi"
        fi
      fi
    else
      NAME=${thirdline%Page*}  # retain the part before the colon
      NAME=${NAME##*:}
      set -- $NAME
      if [[ $3 == "" ]] # Has no Middle Name
      then
        correctName="$2, $1"
      elif [[ $3 != "" ]] #Has a Middle Name
      then
        if [[ $4 != "" ]] #Has a 4th name
        then
          mi="${3:0:1}"
          correctName="$4, $1 $2 $mi"
        else              #Has just a Middle Name
          mi="${2:0:1}"
          correctName="$3, $1 $mi"
        fi
      fi
    fi
    for u in $FILE;
    do 
      by=$(basename "$u")
      p="${by%.*}"
      if [[ "$h" ==  "$p" ]]
      then
        ranNum=$[RANDOM%1000+1]
        lorFN="$destination/$correctName LOR @RecName$ranNum.pdf"
        if [ -f "$lorFN" ]
        then
          while [ -f "$lorFN" ]
          do
            ranNum=$[RANDOM%1000+1]
            lorFN="$destination/$correctName LOR @RecName$ranNum.pdf"
          done
        fi
        mv "$FILES/$p.pdf" "$lorFN"
      fi
    done
  elif [[ $eleventhline == *"Official Transcript"* ]]
  then #Easy Transcript
    #LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g"
    #LANC=C sed -i '' '1,2d' "$g"
    for u in $FILE;
    do 
      by=$(basename "$u")
      p="${by%.*}"
      if [[ "$h" ==  "$p" ]]
      then
        transcriptID=$((transcriptID+1))
        now=$(date +"%Y-%m-%d")
        ranNum=$[RANDOM%1000+1]
        tranFN="$destination/@Student$ranNum EDU @School $now O.pdf"
        if [ -f "$tranFN" ]
        then
          while [ -f "$tranFN" ]
          do
            ranNum=$[RANDOM%1000+1]
            tranFN="$destination/@Student$ranNum EDU @School $now O.pdf"
          done
        fi
        mv "$FILES/$p.pdf" "$tranFN"
      fi
    done
  elif [[ $eleventhline == *"Parchment Transcript"* ]]
  then #Easy Parchment Title Transcript
    #LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g"
    #LANC=C sed -i '' '1,2d' "$g"
    for u in $FILE;
    do 
      by=$(basename "$u")
      p="${by%.*}"
      if [[ "$h" ==  "$p" ]]
      then
        transcriptID=$((transcriptID+1))
        now=$(date +"%Y-%m-%d")
        ranNum=$[RANDOM%1000+1]
        tranFN="$destination/@Student$ranNum EDU @School $now O.pdf"
        if [ -f "$tranFN" ]
        then
          while [ -f "$tranFN" ]
          do
            ranNum=$[RANDOM%1000+1]
            tranFN="$destination/@Student$ranNum EDU @School $now O.pdf"
          done
        fi
        mv "$FILES/$p.pdf" "$tranFN"
      fi
    done
  elif [[ $firstline == *"School Profile"* ]]
  then #Easy School Profile
    #LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g"
    #LANC=C sed -i '' '1,2d' "$g"
    
    if [[ $seventhline == *"A school profile"* ]] 
    then
      NAME=${seventhline%A\ school\ profile*}  # retain the part before the colon
      NAME=${NAME##*:}
      set -- $NAME
      if [[ $3 == "" ]] # Has no Middle Name
      then
        correctName="$2, $1"
      elif [[ $3 != "" ]] #Has a Middle Name
      then
        if [[ $4 != "" ]] #Has a 4th name
        then
          mi="${3:0:1}"
          correctName="$4, $1 $2 $mi"
        else              #Has just a Middle Name
          mi="${2:0:1}"
          correctName="$3, $1 $mi"
        fi
      fi
    else
      NAME=${seventhline%Page*}  # retain the part before the colon
      NAME=${NAME##*:}
      set -- $NAME
      if [[ $3 == "" ]] # Has no Middle Name
      then
        correctName="$2, $1"
      elif [[ $3 != "" ]] #Has a Middle Name
      then
        if [[ $4 != "" ]] #Has a 4th name
        then
          mi="${3:0:1}"
          correctName="$4, $1 $2 $mi"
        else              #Has just a Middle Name
          mi="${2:0:1}"
          correctName="$3, $1 $mi"
        fi
      fi
    fi
    for u in $FILE;
    do 
      by=$(basename "$u")
      p="${by%.*}"
      if [[ "$h" ==  "$p" ]]
      then
        now=$(date +"%Y-%m-%d")
        ranNum=$[RANDOM%1000+1]
        profFN="$destination/@Student$ranNum EDU @School Profile.pdf"
        if [ -f "$profFN" ]
        then
          while [ -f "$profFN" ]
          do
            ranNum=$[RANDOM%1000+1]
            profFN="$destination/@Student$ranNum EDU @School Profile.pdf"
          done
        fi
        mv "$FILES/$p.pdf" "$profFN"
      fi
    done
  elif [[ $firstline == *"Guidance Report"* ]]
  then #Easy Guidance Report
    #LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g"
    #LANC=C sed -i '' '1,2d' "$g"
    for u in $FILE;
    do 
      by=$(basename "$u")
      p="${by%.*}"
      if [[ "$h" ==  "$p" ]]
      then
        ranNum=$[RANDOM%1000+1]
        repFN="$destination/@Student$ranNum EDU @School SchoolReport.pdf"
        if [ -f "$repFN" ]
        then
          while [ -f "$repFN" ]
          do
            ranNum=$[RANDOM%1000+1]
            repFN="$destination/@Student$ranNum EDU @School SchoolReport.pdf"
          done
        fi
        mv "$FILES/$p.pdf" "$repFN"
      fi
    done
  fi
done

cd $destination
find . -name "*.txt" -type f -delete

echo JOB COMPLETE