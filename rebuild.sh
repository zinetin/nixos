if [ -z "$1" ]; then
  echo "Usage: $0 nixflake-name"
  exit 1
fi

current_dir=$(pwd)
cd /etc/nixos
nix flake update iridium
git pull
git add .
git commit -m "Auto Commit from Rebuild Script"
sudo nixos-rebuild switch --flake /etc/nixos/#$1
git push
cd current_dir
