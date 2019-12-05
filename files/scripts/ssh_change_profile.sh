#!/bin/bash

# iTerm2でこのスクリプト経由でsshするとprofileを変えることが出来る
# set profile 
echo -ne "\033]1337;SetProfile=ssh_profile\a"
 
# ssh login
/usr/bin/ssh "$@"
 
# set profile(default)
echo -ne "\033]1337;SetProfile=Default\a"
