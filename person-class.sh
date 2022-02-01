#!/bin/sh

person() {
    # eval echo '"${'$1'["name"]}"'
    eval $1[name]='"$2"'
    eval $1[age]=$3
    eval $1[job]=$4
    eval $1[greet]='"echo ${'$1'["name"]}: Hello"'
    eval $1[haveBirthday]='"'$1'[age]=$((${'$1'["age"]}+1))"'
    eval $1[Introduction]='"printf '%b'"''" \"My name is ${'$1'[name]}\nMy age is ${'$1'[age]}\nI work as an ${'$1'[job]}\n\""'
}

declare -A brad
declare -A will
person brad "Brad Pitt" 45 actor
person will "Will Smith" 44 actor

eval ${will[Introduction]}
eval ${brad[Introduction]}
