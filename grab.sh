#!/bin/bash

scr_fp=$(dirname "$0")
xml_path=/data/guide.xml
counter=0

echo "--------------start------------------"
rm -rf $xml_path && touch $xml_path

source $scr_fp/regions
for i in "${regions[@]}"
do
    if [ $counter -gt 0 ]
    then
        echo "-------------------------------------"
    fi
    echo "Getting EPG XML for ${i} Freeview"
    curl -o /tmp/guide-${i}.xml http://i.mjh.nz/au/${i}/epg.xml --silent
    if [ $counter -eq 0 ]
    then
        cat /tmp/guide-${i}.xml >> $xml_path
        echo "Added ${i} to guide.xml"
        rm -rf /tmp/guide-${i}.xml
        echo "Deleted guide-${i}.xml"
    else
        tail -n +3 /tmp/guide-${i}.xml >> $xml_path
        echo "Added ${i} to guide.xml"
        rm -rf /tmp/guide-${i}.xml
        echo "Deleted guide-${i}.xml"
    fi
    let counter=counter+1
done
echo "-------------done--------------------"