which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yain -d "Install specific package(s) from the repositories or the AUR"
        yay -S $argv
    end
end

