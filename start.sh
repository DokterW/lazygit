#!/bin/bash
# LazyGit v1.0.1
# Made by Dr. Waldijk
# Just press a few buttons to get your git on and pushed to Github.
# Read the README.md for more info.
# By running this script you agree to the license terms.
# Alias -----------------------------------------------------------------------------
LAZYGITALIAS=$(cat ~/.bashrc | grep -o lazygit)
if [ $LAZYGITALIAS != "lazygit" ]
then
    LAZYGITALIAS=$(pwd)
    echo "alias lazygit='$LAZYGITALIAS/start.sh'" >> ~/.bashrc
fi
# -----------------------------------------------------------------------------------
LAZYGITVER="1.0.1"
LAZYGITNAM="LazyGit"
while :
do
    clear
    LAZYGITDIR=$(pwd)
    echo "$LAZYGITNAM v$LAZYGITVER"
    echo ""
    echo "1. Add  |  2. Remove  |  3. Commit  |  4. Commit (-a)"
    echo "5. Push |  6. Status  |  7. Init    |  8. Add remote"
    echo ""
    echo "Q. Quit"
    echo ""
    echo "Working directory: $LAZYGITDIR"
    echo "(C. Change working directory)"
    echo ""
    read -p "Enter option: " -s -n1 LAZYGIT
    case "$LAZYGIT" in
        1)
            clear
            git status
            echo ""
            read -p "Enter files you want to add: " GITADD
            git add $GITADD
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        2)
            clear
            git status
            echo ""
            read -p "Enter files you want to remove: " GITRM
            git rm $GITRM
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        3)
            clear
            read -p "Enter comment for your commit: " GITCOMMIT
            git commit -m "$GITCOMMIT"
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        4)
            clear
            read -p "Enter comment for your commit: " GITCOMMIT
            git commit -a -m "$GITCOMMIT"
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        5)
            clear
            git push -u origin master
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        6)
            clear
            git status
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        7)
            clear
            git init
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        8)
            clear
            read -p "Enter URL to your new Github repo: " GITHUBURL
            git remote add origin $GITHUBURL
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        [cC])
            while :
            do
                clear
                LAZYGITDIR=$(pwd)
                LAZYGITLS=$(ls -1)
                echo "$LAZYGITNAM v$LAZYGITVER"
                echo ""
                echo "$LAZYGITLS" | nl -nrz -w2 -s- | sed 's/-/ /g'
                echo "[$LAZYGITDIR]"
                echo ""
                echo "   00. Move down one folder"
                echo "01-99. Move up one folder"
                echo "   DD. Done"
                echo ""
                read -p "Enter option: " -s -n2 LAZYGIT
                case "$LAZYGIT" in
                    00)
                        cd ..
                    ;;
                    [0-9]*)
                        LAZYGITCNT=$(echo "$LAZYGITLS" | wc -l)
                        if [ "$LAZYGIT" -ge "$LAZYGITCNT" ]
                        then
                            clear
                            echo "$LAZYGITNAM v$LAZYGITVER"
                            echo ""
                            echo "No folder with that number, Butterfingers!"
                            sleep 1s
                        else
                            if [ "$LAZYGIT" = 0[1-9] ]
                            then
                                LAZYGIT=$(echo $LAZYGIT | cut -c 2)
                            fi
                            LAZYGITDIR=$(echo "$LAZYGITLS" | sed "$LAZYGIT!d")
                            cd $LAZYGITDIR
                        fi
                    ;;
                    dd|DD)
                        break
                    ;;
                esac
            done
        ;;
        [qQ])
            clear
            echo "$LAZYGITNAM v$LAZYGITVER"
            echo "Bye!"
            break
        ;;
        *)
            clear
            echo "Wrong option!"
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
    esac
done
