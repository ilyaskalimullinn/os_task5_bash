RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

declare -i hit=0
declare -i miss=0
declare -i step=1
declare -a numbers
declare -i total
declare -i hit_percent
declare -i miss_percent

while :
do
    echo "Step ${step}"

    random_number=${RANDOM: -1}
    read -p "Please enter number from 0 to 9 (q - quit): " input

    case "${input}" in
        [0-9])
            step+=1

            if (( random_number == input ))
                then
                    echo -e "${GREEN}Hit${RESET}! My number ${random_number}"
                    number_string="${GREEN}${random_number}${RESET}"
                    hit+=1
                else
                    echo -e "${RED}Miss!${RESET} My number ${random_number}"
                    number_string="${RED}${random_number}${RESET}"
                    miss+=1
            fi

            total=hit+miss
            hit_percent=hit*100/total
            miss_percent=100-hit_percent
            numbers+=(${number_string})


            echo "Hit: ${hit_percent}%" "Miss: ${miss_percent}%"
            echo -e "Numbers: ${numbers[@]: -(total<10 ? total : 10)}"
        ;;
        q)
            echo "Bye"
            echo "Exit..."
            exit 0
        ;;
        *)
            echo "Not valid input"
            echo "Please repeat"
        ;;
    esac
done
