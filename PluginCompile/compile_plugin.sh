#!/bin/sh

# STEP 0.5 Add plugincompile dir to path temporarily
PATH="$PATH:$(dirname $0)"
#echo $PATH

# STEP 1 Increment Version Number
oldnum="$( grep 'Version' info.lua | cut -d $'\"' -f2 | cut -d $'\"' -f1 )"
#echo $oldnum
newnum="$oldnum"

majnum=${oldnum%%.*}
minnum=${oldnum#*.}
minnum=${minnum%%.*}
fixnum=${oldnum%.*}
fixnum=${fixnum##*.}
devnum=${oldnum##*.}

if test "$1" = "ver_maj"
then
  echo "updating version major num"

  #majnum=${oldnum:0:1}
  ((majnum++))
  newnum="$majnum.0.0.0"

elif test "$1" = "ver_min"
then
  echo "updating version minor num"

  #minnum=${oldnum:2:1}
  ((minnum++))
  newnum="$majnum.$minnum.0.0"

elif test "$1" = "ver_fix"
then
  echo "updating version fix num"

  #fixnum=${oldnum:4:1}
  ((fixnum++))
  newnum="$majnum.$minnum.$fixnum.0"

elif test "$1" = "ver_dev"
then
  echo "updating version dev num"

  #devnum=${oldnum:6:1}
  ((devnum++))
  newnum="$majnum.$minnum.$fixnum.$devnum"

else
  echo "updating version dev num"

  #devnum=${oldnum:6:1}
  ((devnum++))
  newnum="$majnum.$minnum.$fixnum.$devnum"

fi

#echo $newnum
sed -i -E "s/$oldnum/$newnum/" info.lua

# STEP 2 Create new GUID if the plugin doesn't already have one
oldid="$( grep 'Id' info.lua | cut -d $'\"' -f2 | cut -d $'\"' -f1 )"
#echo $oldid

if test "$oldid" = "<guid>"
then
  echo "generating guid for plugin"
  newid="$( uuidgen )"
  #echo $newid
  sed -i -E "s/$oldid/$newid/" info.lua
fi

# STEP 3 Fix up line endings
unix2dos -q info.lua