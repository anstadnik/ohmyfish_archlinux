which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yamir -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
        yay -Syy $argv
    end
end
