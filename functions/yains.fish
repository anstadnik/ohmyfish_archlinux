which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yains -d "Install specific package from a file"
        yay -U $argv
    end
end
