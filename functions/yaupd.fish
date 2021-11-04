which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yaupd -d "Update and refresh the local package database against repositories"
        yay -Sy
    end
end
