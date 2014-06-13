#!/usr/bin/env bash
cd /media/desarrollo/tribus
export DEBIAN_FRONTEND=noninteractive
export DJANGO_SETTINGS_MODULE=tribus.config.web
export PYTHONPATH=/media/desarrollo/tribus
service mongodb restart
service postgresql restart
service redis-server restart
service slapd restart
#python manage.py celeryd -c 1 --beat -l INFO >/dev/null 2>&1
#python manage.py celery beat -s celerybeat-schedule >/dev/null 2>&1
python manage.py runserver 0.0.0.0:8000
find / -name "*.pyc" -print0 | xargs -0r rm -rf
find /var/cache/apt -type f -print0 | xargs -0r rm -rf
find /var/lib/mongodb -type f -print0 | xargs -0r rm -rf
find /var/lib/apt/lists -type f -print0 | xargs -0r rm -rf
find /usr/share/man -type f -print0 | xargs -0r rm -rf
find /usr/share/doc -type f -print0 | xargs -0r rm -rf
find /usr/share/locale -type f -print0 | xargs -0r rm -rf
find /var/log -type f -print0 | xargs -0r rm -rf
find /var/tmp -type f -print0 | xargs -0r rm -rf
find /tmp -type f -print0 | xargs -0r rm -rf

exit 0
