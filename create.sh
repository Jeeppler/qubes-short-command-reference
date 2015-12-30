#! /usr/bin/env bash

ZIP="master.zip"
VMTools="vm-tools"
D0Tools="dom0-tools"
DTMP="_dtmp"
DURL="https://github.com/QubesOS/qubes-doc/archive/$ZIP"
REName="short-reference"
REExt="md"
REFile="$REName.$RExt"
RBScript="transform.rb"
GENScript="generate.sh"

function clean() {
  if [[ -f "$ZIP" ]]
  then
    rm "$ZIP"
  fi

  # put them into an array and iterate over the array elements
  if [[ -d "$VMTools$DTMP" ]]
  then
    rm -rf "$VMTools$DTMP"
  fi

  if [[ -d "$D0Tools$DTMP" ]]
  then
    rm -rf "$D0Tools$DTMP"
  fi

  if [[ -d "$VMTools" ]]
  then
    rm -rf "$VMTools"
  fi

  if [[ -d "$D0Tools" ]]
  then
    rm -rf "$D0Tools"
  fi
}

function unpackAndMove() {
  tools="$1"

  unzip  "$ZIP" "*/$tools/*" -d "$tools$DTMP"

  mkdir "$tools"

  find "$tools$DTMP/" -name "*.md" -type f -print0 | xargs -0 -I {} mv {} -t "$tools"
}

function addToReference() {
  title="$1"
  tools="$2"

  echo "$title" >> "$REFile"

  #TODO sort the documents alphabetically 
  find "$tools/" -name "*.md" -type f -print0 | xargs -0 -I {} ruby "$RBScript" {} >> "$REFile"
}

if [[ -f "$REFile" ]]
then
  rm "$REFile"
fi

clean

wget -c "$DURL"

unpackAndMove "$VMTools"
unpackAndMove "$D0Tools"

touch "$REFile"

addToReference "# Dom0 Tools" "$D0Tools"
addToReference "# VM Tools" "$VMTools"

source "$GENScript" "$REFile" "$REName"

clean
