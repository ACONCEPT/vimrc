#!usr/bin/env bash

source ~/repos/df/workspace/env/bin/activate
cd ~/repos/df/workspace/manager/
python ~/repos/df/workspace/manager/manage.py -c stage sim_etl_tuples

