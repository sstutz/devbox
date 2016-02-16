#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-


##
# replace annoying motd with new one
#
tee /etc/motd.tail <<'EOF' >/dev/null

_|_|_|                          _|
_|    _|    _|_|    _|      _|  _|_|_|      _|_|    _|    _|
_|    _|  _|_|_|_|  _|      _|  _|    _|  _|    _|    _|_|
_|    _|  _|          _|  _|    _|    _|  _|    _|  _|    _|
_|_|_|      _|_|_|      _|      _|_|_|      _|_|    _|    _|

EOF


##
# what ever task you need goes here.
#


##
# creates a file to make sure this script only runs once
# if for some reason you need to execute this script more than once
# simply remove the /base-run file
#
touch /base-run
echo ""
