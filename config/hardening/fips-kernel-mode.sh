#!/bin/sh
# This script was written by Frank Caviggia, Red Hat Consulting
# Last update was 19 March 2015
# This script is NOT SUPPORTED by Red Hat Global Support Services.
#
# Script: fips-kernel-mod.sh (system-hardening)
# Description: RHEL 6 Hardening - Configures kernel to FIPS mode
# License: Apache License, Version 2.0
# Copyright: Red Hat Consulting, March 2015
# Author: Frank Caviggia (fcaviggia@gmail.com)

########################################
# FIPS 140-2 Kernel Mode
########################################
sed -i 's/PRELINKING=yes/PRELINKING=no/g' /etc/sysconfig/prelink
prelink -u -a
dracut -f
BOOT=`df /boot | tail -1 | awk '{ print $1 }'`
/sbin/grubby --update-kernel=ALL --args="boot=${BOOT} fips=1"
