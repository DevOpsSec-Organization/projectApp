#!/bin/bash

# Update system packages
sudo apt update && sudo apt install -y python3 python3-pip

# Ensure pip, virtualenv are installed
sudo pip3 install --upgrade pip virtualenv

# Navigate to your Django project directory
cd /path/to/your/django/projectApp

# Optionally, setup a virtual environment
python3 -m virtualenv venv
source venv/bin/activate

# Install required Python packages
pip install -r requirements.txt

# Run database migrations
python3 manage.py migrate

# Collect static files
python3 manage.py collectstatic --noinput

# Restart the application using PM2 and gunicorn
pm2 restart projectApp

# Deactivate the virtual environment
deactivate

# echo "Deployment complete."o project directory
cd projectApp/

