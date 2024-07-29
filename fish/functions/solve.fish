function solve
    set fileName $argv.cpp

    set -l characters (echo $argv | fold -w1)

    for char in $characters
        if test "$char" = '.'
            set fileName $argv
        end
    end

    export fname=$fileName
    if not test -e $fileName
        cp ../templates/main.cpp $fileName
    end
    nvim $fileName
end
