which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yaupg -d "Update and refresh the local package database against repositories"
        yay -Syu
    end
end
