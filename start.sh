#!/bin/bash
# Lazy Git v0.3
# Made by Dr. Waldijk
# Just press a few buttons to get your git on and pushed to Github.
# Read the README.md for more info.
# By running this script you agree to the license terms.
# -----------------------------------------------------------------------------------
# Add the root path of your dev directory. Uncomment to use it, don't forget to uncomment further down.
# LAZYGITDEVDIR=$(echo "")
while :
do
    LAZYGITDIR=$(pwd)
    clear
    echo "Lazy Git v0.3"
    echo "1. Add  |  2. Remove  |  3. Commit  |  4. Commit (-a)"
    echo "5. Push |  6. Status  |  7. Init    |  8. Add remote"
    echo ""
    echo "Q. Quit"
    echo ""
    echo "Working directory: $LAZYGITDIR"
#    echo "(C. Change working directory)"
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
            git add $GITRM
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
#        [cC])
#            clear
#            echo "Current working directory: $LAZYGITDIR"
#            read -p "$Enter new full path: " LAZYGITDIR
#            cd $LAZYGITDIR
# Uncomment if you use custom path. Remember to comment out above.
#            read -p "$LAZYGITDEVDIR" LAZYGITDIR
#            cd $LAZYGITDEVDIR$LAZYGITDIR
#            echo ""
#            read -p "Press (the infamous) any key to continue... " -n1 -s
#        ;;
        [qQ])
            clear
            echo "Lazy Git v0.3"
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
