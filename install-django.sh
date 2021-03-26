set -e

echo "== started installing django =="

echo "Update your local package index with apt"
apt-get update

echo "Check which version of Python"
python3 -V

echo " Install pip from the Ubuntu repositories"
apt install python3-pip python3-django

echo " Install the venv package with pip"
apt install python3-venv

