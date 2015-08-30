#! /usr/bin/env bash

ZIP="master.zip"
VMTools="VmTools"
D0Tools="Dom0Tools"
DTMP="_dtmp"
DURL="https://github.com/QubesOS/qubes-doc/archive/$ZIP"

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

clean

wget -c "$DURL"

#two times the same thing make function
unzip  "$ZIP" "*/$VMTools/*" -d "$VMTools$DTMP"
unzip  "$ZIP" "*/$D0Tools/*" -d "$D0Tools$DTMP"

mkdir "$VMTools"
mkdir "$D0Tools"

find "$VMTools$DTMP/" -name "*.md" -type f -print0 | xargs -0 -I {} mv {} -t "$VMTools"
find "$D0Tools$DTMP/" -name "*.md" -type f -print0 | xargs -0 -I {} mv {} -t "$D0Tools"
