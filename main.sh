git init

touch junk

declare -i x
echo "Enter Beginning date [yyyymmdd]"
read x

declare -i y
echo "Enter End date [yyyymmdd]"
read y

DATE=$x

function make_random_commits() {
    num_commits=$((1 + RANDOM % 3))  # Generate a random number between 1 and 3
    for ((i=0; i<num_commits; i++))
    do
        echo 'a' >> junk
        git add .
        msg="commit$(date +%Y%m%d -d $DATE)"
        git commit -m "$msg" --date="$(date -R -d $DATE)"
    done
}

while [ $DATE -le $y ]
do
    make_random_commits
    DATE=$(date +%Y%m%d -d "$DATE + 1 day")
done
