#!/bin/sh

expand() {
    echo "${!1}"
}
# person() {
#     declare -A person
#     person["Name"]=Brad
#     person["Age"]=45
#     person["Job"]=Actor
#     echo ${person[@]}

#     echo "${!person[@]}"
# }
person() {
    # eval echo '"${'$1'["name"]}"'
    eval $1[name]='"$2"'
    eval $1[age]=$3
    eval $1[job]=$4
    eval $1[greet]='"echo ${'$1'["name"]}: Hello"'
    local age='"["age"]=5"'
    local ageSix='"["age"]=6"'
    eval $1[turnFive]="$1$age"
    eval $1[turnSix]="$1$ageSix"
    # local age='"["age"]=5"'
    # local ageSix='"["age"]=6"'
    # eval $1[turnFive]="$1$age"
    # eval $1[turnSix]="$1$ageSix"

    # eval $1[haveBirthday]="$start$1$age"
    # eval $person["age"]=$3
    # eval $person["greet"]="echo hello"
    # echo ${person["name"]}
}

declare -A brad
declare -A will
person brad "Brad Pitt" 45 actor
person will "Will Smith" 44 actor

eval "${brad[greet]}"
eval "${will[greet]}"
echo "${will[age]}"
eval "${will[turnFive]}"
echo "${will[age]}"
eval "${will[turnSix]}"
echo "${will[age]}"
