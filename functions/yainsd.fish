which yay 2> /dev/null > /dev/null
if test $status -ne 1

    function yainsd -d "Install given package(s) as depend
endencies of another package"
        yay -Syu $argv
    end
end
