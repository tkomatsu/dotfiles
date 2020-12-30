#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

# Norminette
cd $THIS_DIR
git clone https://github.com/42Paris/norminette.git ~/.norminette/
cd ~/.norminette/
bundle

# 42 header
