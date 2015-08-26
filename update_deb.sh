#!/bin/bash

apt-get update -qq

report=`apt-get -s upgrade | grep '^[0-9]\{1,\} upgraded'`
if [[ -z "$report" ]]; then
		exit 0
fi
to_upgrade=`echo $report | awk -F, '{print $0}' | awk '{print $1}'`
if [[ $to_upgrade -gt 0 ]]; then
		echo "$report"
fi
exit 0


