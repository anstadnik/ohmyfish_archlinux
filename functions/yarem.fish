which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yarem -d "Remove the specified package(s), its configuration(s) and unneeded depend
endencies"
        yay -Rns $argv
    end
end
