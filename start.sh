#!/bin/bash
# Lazy Git v0.1
# Just press a few buttons to get your git don and pushed to Github.
# Written by Dr. Waldijk
# Read the README.md for more info.
# -----------------------------------------------------------------------------------
while :
do
    clear
    echo "Lazy Git v0.1"
    echo "   1. Status   |      2. Add      |      3. Commit      |  4. Push"
    echo "   5. Init     |   6. Add remote"
    echo ""
    read -p "Enter option: " -s -n1 LAZYGIT
    case "$LAZYGIT" in
        1)
            clear
            git status
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        2)
            clear
            read -p "Enter files you want to add: " GITADD
            git add $GITADD
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
            git push -u origin master
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        5)
            clear
            git init
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        6)
            clear
            read -p "Enter URL to your new Github repo: " GITHUBURL
            git remote add origin $GITHUBURL
            echo ""
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
        0)
            clear
            echo "Lazy Git v0.1"
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
