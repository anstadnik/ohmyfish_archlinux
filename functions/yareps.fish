which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yareps -d "Search for package(s) in the repositories and the AUR"
        yay -Ss $argv
    end
end

