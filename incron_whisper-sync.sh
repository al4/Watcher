#!/bin/bash
watched_path=$1  #  $@
event_name=$2    #  $#
event_flags=$3   #  $%
event_flags_n=$4 #  $&

# example $event_name
# /opt/graphite/storage/whisper/gt-esmaster001/irq/irq-124.wsp

rel_filename=$(printf $event_name | sed 's/\/opt\/graphite\/storage\/whisper\///')

#echo $1:$2:$3 >> /root/whisper-sync.log

rsync --password-file /root/.rsync.pwd -a ${event_name} graphite@gt-graphite010::whisper/${rel_filename} 
echo $event_name >> /tmp/whisper-sync.log


