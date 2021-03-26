set -e

echo "=== Adding repositiory ==="
add-apt-repository ppa:linuxuprising/guake
echo "=== completed ==="

echo "=== updating ==="
apt update
echo "=== complete ==="

echo "=== installing  guake ==="
apt install guake
echo "=== complete ==="

