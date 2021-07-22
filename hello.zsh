echo "shell: Hello!"

i=1;
for arg in "$@"
do
    echo "$arg";
    i=$((i + 1));
done