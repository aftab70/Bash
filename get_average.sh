#!/bin/bash
set -x
set -e
ORG_FILE="/home/aftab/script/number.txt"
awk '{print $2}' "$ORG_FILE" > GAPI_LIST.txt
G_API_LIST="/home/aftab/script/GAPI_LIST.txt"
awk -F, '!seen[$1]++' GAPI_LIST.txt > UNIQUE_API_URL.txt
U_API_URL="/home/aftab/script/UNIQUE_API_URL.txt"
U_API_HITS=$(cat UNIQUE_API_URL.txt | wc -l)
echo "Total API name count is $U_API_HITS"
echo ""
n=2
while [ $n -le $U_API_HITS ];do
        sed -n "$n"p "$U_API_URL" > "$n".txt
        n=$((n+1))
done
N=2
while [ $N -le  $U_API_HITS ];do
        cat number.txt | grep `(cat "$N".txt)` > saprate_"$N".txt
        N=$((N+1))
done
echo "" > res_time.txt
N2=2
while [ $N2 -le  $U_API_HITS ];do
        echo `awk -F : '{sum+=$1} END {print "AVG=",sum/NR}' saprate_"$N2".txt` millisecond "----->"`cat "$N2".txt`  >> res_time.txt
        N2=$((N2+1))
done
cat res_time.txt
