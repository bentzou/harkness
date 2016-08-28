#!/bin/bash

function hello () {
   if [ -n "$1" ]; then
      echo "hello $1"
   else
      echo "hello world"
   fi
}

function goodbye () {
   echo "goodbye"
}
