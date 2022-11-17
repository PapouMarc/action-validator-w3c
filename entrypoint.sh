#!/bin/bash


function jsonValue() {
KEY=$1
num=$2
awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

function trapapi() {
#only file '.css', '.html', '.htm' and '.svg'
_ext="${1##*.}"
_format=""
case ${_ext} in 
  "html"|"htm") _format="text/html"
            ;;
  "css") _format="text/css"
       ;;
  "svg") _format="image/svg+xml"
       ;;
esac

if [ "x${_format}" != "x" ]; then
  curl -H "Content-Type: ${_format}; charset=utf-8" --data-binary @${1} https://validator.w3.org/nu/?out=json -o $$.json > /dev/null 2>&1
  _result=`cat $$.json | jsonValue message | sed 's/$/ /'`
  if [ "x${_result}" != "x" ]; then
    echo "########### [START] ${1} ###########\n${_result}\n########### [END] ${1} ###########\n\n"
  fi
fi
}


if [ -e "${1}" ]; then
  if [ -d "${1}" ]; then
    for n in `ls -p1 ${1} | grep -v /`; do
      result="${result}"`trapapi ${1}/$n`
    done
  else
    result=`trapapi ${1}`
  fi

  nb_line=`trapapi "${result}" | wc -l`
  if [ ${nb_line} -gt 1 ]; then
    echo "result-validator-w3c<<EOF" >> $GITHUB_OUTPUT
    echo "${result}" >> $GITHUB_OUTPUT
    echo "EOF" >> $GITHUB_OUTPUT  
  else
    echo "result-validator-w3c=${result}" >> $GITHUB_OUTPUT
  fi
fi
