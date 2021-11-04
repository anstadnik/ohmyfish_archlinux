which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yare -d "Remove the specified package(s), retaining its configuration(s) and required depend
endencies"
        yay -R $argv
    end
end
