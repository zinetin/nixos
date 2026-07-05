set -e

if [ -z "$1" ]; then
  echo "Usage: $0 nixflake-name"
  exit 1
fi

pushd /etc/nixos || exit 1

nix flake update iridium
git pull
git add .
if [-z "$2" ]; then
  git commit -m "Auto Commit from Rebuild Script"
else
  git commit -m "$2"
fi
sudo nixos-rebuild switch --flake "/etc/nixos/#$1"
git push

popd
