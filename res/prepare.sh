./res/prepare-`./res/checkdistro.sh`.sh
status=$?
if [[ ! $status == "0" ]]; then exit 1; fi
echo "ready"

