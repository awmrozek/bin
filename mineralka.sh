#!/bin/bash

find . -iname "*.EXE" -exec mv {} ~/win_install \;
find . -iname "*.MSI" -exec mv {} ~/win_install \;
find . -iname "*.TAR.BZ2" -exec mv {} ~/backup \;
find . -iname "*.ZIP" -exec mv {} ~/backup \;

