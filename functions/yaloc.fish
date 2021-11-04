which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yaloc -d "Display information about a given package in the local database"
        yay -Qi $argv
    end
end
