#!usr/bin/env bash
from=${1}
to=${2}

cp $from/campaigns.csv $to/campaigns.csv
cp $from/notifications.csv $to/notifications.csv
cp $from/profiles.csv  $to/profiles.csv
cp $from/fences.csv $to/fences.csv
cp $from/plots $to/plots
cp $from/useractions.csv $to/useractions.csv
cp $from/users.csv $to/users.csv
