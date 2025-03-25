#!/bin/bash

source /opt/venv/bin/activate
cd /code

python manage.py sendtestemail --admins 
python manage.py migrate --no-input 
python manage.py auto_admin


RUNTIME_PORT=${PORT:-8080}
RUNTIME_HOST=${HOST:-0.0.0.0}

# add our static files to container itself on runtime
# python manage.py collectstatic --no-input
gunicorn cfehome.wsgi:application --bind $RUNTIME_HOST:$RUNTIME_PORT