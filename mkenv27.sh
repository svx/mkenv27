#!/bin/sh
#
# Copyleft (C) 2011 by svx and maartentp
# sven@so36.net, maartentp@milieudefensie.nl
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation , Version 3
# https://www.gnu.org/copyleft/gpl.html
#

#dirty wrapper around vritualenv, needs to rewritten
#just a proof of concept, atm

error_exit() {
        echo "$1"
        exit 1
}

case "$1" in

        -h | --help | ? )

                echo "Usage: $0 #NEWENVNAME"
                exit 1
        ;;

        * )

                [ -z "$1" ] && error_exit "Need target directory"
                [ -d "$1" ] && error_exit "Directory $1 already exists"

                virtualenv --python=python2.7 --no-site-packages "$1" || \
                error_exit "something went wrong, please investigate"
        ;;
esac

