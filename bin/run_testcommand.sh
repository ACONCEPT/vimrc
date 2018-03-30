#! usr/bin/env bash
source ~/repos/df/workspace/env/bin/activate
cd  ~/repos/df/workspace/manager
python manage.py -c test testcommand

