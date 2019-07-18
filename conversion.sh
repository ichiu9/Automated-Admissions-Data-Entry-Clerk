#!/bin/bash

#Ask user for which folder they want to transform

echo Hello, give me the path to the folder of files that I should convert?
read FILES
echo

echo Where should these files go?
read destination
echo

echo Where should the letters of rec go?
read lor
echo

echo Where should the transcripts go?
read tran
echo

echo Where should the school profiles go?
read scooby
echo

#Converts all pdfs to text files
FILES="$FILES/*"
i=0
for f in $FILES;
do
  bn=$(basename "$f")
  hey="${bn%.*}"
  #echo Processing ... $hey
  pdftotext "$f" "$destination/$hey.txt"
  i=$((i+1))
  
  lineone=$(head -n 1 "$destination/$hey.txt")
  if [[ $lineone == *"Official Transcript"* ]]
  then 
    mv "$f" "$tran"
  elif [[ $lineone == *"School Profile"* ]]
  then 
    mv "$f" "$scooby"
  fi

  #Loop through Back up only a certain amount of times to save time
  #if [ $i -gt 1000 ]
  #then
  #  break;
  #fi

done

echo "Processed $i files"

echo "Extracting Letters of Recommendation"

#Sends all the Letters of Recs to their own folder
DEST="$destination/*"
for g in $DEST;
do
  firstline=$(head -n 1 "$g")
  extracase=$(head -n 3 "$g")
  thirdline=$(head -n 3 "$g"| tail -n -1)
  fifthline=$(head -n 5 "$g"| tail -n -1)
  if [[ $firstline == *"Letter of Recommendation"* ]] 
  then #Easy Parchment LOR
    LANG=C sed -i '' -e :a -e '$d;N;2,4ba' -e 'P;D' "$g"
    LANC=C sed -i '' '1,2d' "$g"
    mv "$g" "$lor"
  elif [[ $firstline == *"CEEB:"* ]] || [[ "$extracase" == *"CEEB:"* ]] #This discovers if they are Common App
  then
    if [[ $thirdline == *"Teacher Evaluation"* ]] || [[ $fifthline == *"Teacher Evaluation"* ]]
    then #It is a Teacher Eval
      LANG=C sed -i '' -n '/TE Short Evaluation/,/CEEB:/p' "$g"; LANG=C sed -i '' '/TE/d' "$g"
      mv "$g" "$lor"
    elif [[ $thirdline == *"Counselor Recommendation"* ]] || [[ $fifthline == *"Counselor Recommendation"* ]]
    then # It is a Counselor Rec
      LANG=C sed -i '' -n '/CR Detailed evaluation/,/CEEB:/p' "$g"; LANG=C sed -i '' '/CR/d' "$g"
      mv "$g" "$lor"
    elif [[ $thirdline == "Recommendation" ]] || [[ $fifthline == *"Recommendation"* ]]
    then # Then it is a LORP
      LANG=C sed -i '' -n '/OE Short Evaluation/,/CEEB:/p' "$g"; LANG=C sed -i '' '/OE/d' "$g"
      mv "$g" "$lor"
    fi
  fi
done

echo Building csv file 

#Create and fill the training csv
touch /Users/Isaiah/TrainingSampleData/TrainingCSV/trainingdatacapstone5.csv
csvboi="/Users/Isaiah/TrainingSampleData/TrainingCSV/trainingdatacapstone5.csv"

LOR="$lor/*"
for l in $LOR;
do
  br=$(basename "$l")
  filename="${br%.*}"
  text=$(tr ',' ' ' <"$l" | tr '\n' ' ')

  if [[ $filename == *"LORA"* ]]
  then
  echo "LORA, $text" >> $csvboi
  elif [[ $filename == *"LORP"* ]] 
  then
  echo "LORP, $text" >> $csvboi
  elif [[ $filename == *"LORN"* ]]
  then
  echo "LORN, $text" >> $csvboi
  else
  echo "OOPS, OOPS" >> $csvboi
  fi
done

#Cleaning the csv file
gawk -i inplace 'length>300 ' $csvboi #Takes out all rows that are less than 300