function pacdisowned -d "Display list of disowned files"
  if test -d "$TMPDIR"
    set tmp $TMPDIR
  else
    set tmp "/tmp"
  end
  set dir (mktemp -d -p $tmp)

  set -l fs "$dir/fs"
  set -l db "$dir/db"

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr ! -name lost+found \
         \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"

  # clean-up after ourself
  rm -rf "$dir"
end

function pacin -d "Install specific package(s) from the repositories"
  sudo pacman -S $argv
end
function pacins -d "Install specific package not from the repositories but from a file"
  sudo pacman -U $argv
end
function paclist
  pacman -Qei (pacman -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
end
function pacloc -d "Display information about a given package in the local database"
  pacman -Qi $argv
end
function paclocs -d "Search for package(s) in the local database"
  pacman -Qs $argv
end
function paclsorphans -d "Display a list of packages that were installed as dependencies but are no longer required by any installed package"
  pacman -Qdt $argv
end
function pacmanallkeys -d "Get all keys for developers and trusted users"
  curl https://www.archlinux.org/developers/ https://www.archlinux.org/trustedusers/ | awk -F\" '(/pgp.mit.edu/) {sub(/.*search=0x/,"");print $1}' | xargs sudo pacman-key --recv-keys
end
function pacmansignkeys -d "Allow user to sign keys"
  for key in $argv;
    sudo pacman-key --recv-keys $key
    sudo pacman-key --lsign-key $key
    printf 'trust\n3\n' | sudo gpg --homedir /etc/pacman.d/gnupg \
        --no-permission-warning --command-fd 0 --edit-key $key
  end
end
function pacmir -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
  sudo pacman -Syy $argv
end
function pacre -d "Remove the specified package(s), retaining its configuration(s) and required dependencies"
  sudo pacman -R $argv
end
function pacrem -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
  sudo pacman -Rns $argv
end
function pacrep -d "Display information about a given package in the repositories"
  pacman -Si $argv
end
function pacreps -d "Search for package(s) in the repositories"
  pacman -Ss $argv
end
function pacrmorphans -d "Remove all real orphan packages"
  sudo pacman -Rs (pacman -Qtdq) $argv
end
which abs 2> /dev/null > /dev/null
if test $status -ne 1
  function pacupd -d "Update and refresh the local package and ABS databases against repositories"
    sudo pacman -Sy; and sudo abs
  end
else
  function pacupd -d "Update and refresh the local package against repositories"
    sudo pacman -Sy
  end
end
function pacupg -d "Synchronize with repositories before upgrading packages that are out of date on the local system."
  sudo pacman -Syu $argv
end
