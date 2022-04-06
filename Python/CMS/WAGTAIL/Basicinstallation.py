# in a Python 3 virtual environment
pip install wagtail
wagtail start mysite
cd mysite
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
