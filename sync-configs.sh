#!/bin/bash
# sync. of the back-up dir. with ~/ files, based on madification time.

[[ -z $1 ]] \
    && BKP_DIR=~/gits/dots.ubuntu/configs \
    || BKP_DIR=$1
[[ ! -d "$BKP_DIR" ]] && exit 1

cd $BKP_DIR
while read back_file
    do
        front_file=~/${back_file#./}
        if [[ ! -f $front_file ]]
            then
                front_dir=${front_file%/*}
                [[ ! -d $front_dir ]] && mkdir -p $front_dir
                cp $back_file $front_file
            else
                back_mt=$( date +%s --date "$(stat -c %y $back_file)" )
                front_mt=$( date +%s --date "$(stat -c %y $front_file)" )
                [[ $front_mt -gt $back_mt ]] \
                    && \cp $front_file $back_file
                [[ $front_mt -lt $back_mt ]] \
                    && \cp $back_file $front_file
            fi

    done < <( find . -type f )

cd - 2&>/dev/null
