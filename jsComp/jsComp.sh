#!/bin/bash

touch $1.css

echo -e "import React from 'react';\n\nimport './$1.css';\n\nconst $1 = () => {\n  return ();\n};\n\nexport default $1;" > $1.js

echo $2

if [ $# -gt 1 ]
then
  if [ $2 == '-o' ]
  then
    nvim $1.js
  fi
fi
#cp ~/Desktop/coding/bash/jsComp/jsCompTemp.js $1.js

