#!/bin/bash

function jsonValue() {
KEY=$1
num=$2
awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

function trapapi() {

curl -H "Content-Type: text/html; charset=utf-8" --data-binary @${1} https://validator.w3.org/nu/?out=json -o $$.json > /dev/null 2>&1

echo -e "########### START ${1} ###########\n"`cat $$.json | jsonValue message`"\n########### END ${1} ###########\n"


}
if [ -e "${1}" ]; then
  if [ -d "${1}" ]; then
    for n in `ls -1 ${1}`; do
      result="${result}\n"`trapapi ${1}/$n`
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
