#!/bin/bash
source /etc/profile.d/rvm.sh
LD_LIBRARY_PATH="/usr/lib/jvm/java-7-oracle/jre/lib/i386/:." ruby --fast -J-Xmn256m -J-Xms1024m -J-Xmx1024m -J-server bin/8-bit-meteor.rb
