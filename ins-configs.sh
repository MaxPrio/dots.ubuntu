#!/bin/bash

CFG_DIR=~/gits/dots.ubuntu/configs
[[ ! -d "$CFG_DIR" ]] && exit 1

# count existing
cd "$CFG_DIR"
INDX_IS=0
INDX_ALL=0
while read cfg_file
    do
        ((INDX_ALL++))
        [[ -f ~/$cfg_file ]] && ((INDX_IS++))
    done < <( find . -type f )

# ovowrite existing ?
REPLY=''
if [[ $INDX_IS -gt 0 ]]
    then
        echo -n "ATENTION: $INDX_IS of $INDX_ALL files exist. Overwrite ? < yes >: "
        read -r REPLY
        echo ''
    fi

# main
while read cfg_file
    do
        if [[ ! -f ~/$cfg_file ]] || [[ $REPLY =~ yes|YES|Yes ]]
            then
                cp_path=~/${cfg_file#./}
                cp_dir=${cp_path%/*}
                [[ ! -d $cp_dir ]] && mkdir -p $cp_dir
                \cp $cfg_file $cp_dir/
            fi

    done < <( find . -type f )

cd - 2&>/dev/null
