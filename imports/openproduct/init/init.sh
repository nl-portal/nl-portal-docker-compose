#!/bin/bash

# Apply database migrations
>&2 echo "Apply database migrations"
python src/manage.py migrate
exists=$(echo "from django.contrib.auth import get_user_model; User = get_user_model(); print(User.objects.filter(username='admin').exists())" | python src/manage.py shell)
if [ "False" = "${exists}" ]
then
  echo "Creating user 'admin'"
  python src/manage.py createsuperuser --username=admin --email=admin@example.com --noinput
else
  echo "User 'admin' already exists"
fi
echo "Setting 'admin' password."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username='admin'); user.set_password('admin'); user.save()" | python src/manage.py shell
echo "Loading fixtures"
#python src/manage.py loaddata demodata
#echo "Loading UPL from UPL-actueel.csv"
#python src/manage.py load_upl --file UPL-actueel.csv
echo "Finished setup"

sh /start.sh
