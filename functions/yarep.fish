which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yarep -d "Display information about a given package in the repositories or the AUR"
        yay -Si $argv
    end
end

