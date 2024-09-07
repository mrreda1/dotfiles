function addcase
    if test (count $argv) -lt 1
        getclip | tee ../templates/default.in
    else
        echo $argv[1] | tee ../templates/default.in
    end
end
