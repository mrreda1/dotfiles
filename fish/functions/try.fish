function try
    if test -e result
        rm result
    end
    g++ $fname -g -D_DEBUG -O0 -o result
    ./result
    cat ../templates/default.out
end
