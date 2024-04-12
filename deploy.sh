#!/bin/bash

# Exit on error
set -e

# It's a good practice to log the deployment process
LOGFILE="/var/log/deploy.log"

echo "Deployment started: $(date)" >> "$LOGFILE"

# Update the package list
sudo apt update

# Install Python and pip if not already installed, adjust the versions if necessary
sudo apt install -y python3 python3-pip

# Optionally install and create a virtual environment for your application if needed
# sudo apt install -y python3-venv
# python3 -m venv myvenv
# source myvenv/bin/activate

# Navigate to your Django project directory
cd projectApp/

# Install Python dependencies
pip install -r requirements.txt

# Run database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Restart Gunicorn (or your chosen WSGI server)
# You should have Gunicorn set up as a service if using this method
sudo systemctl restart gunicorn

echo "Deployment completed: $(date)" >> "$LOGFILE"
