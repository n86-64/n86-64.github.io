
#!/bin/bash

COMMIT_MSG=$1 

if ! [[ $(git commit -a -m $COMMIT_MSG) ]]; then
	echo Nothing to push. Exiting.
	exit 1
fi

echo -n  Do you wish to push to master? ' ' 
read push

if [ $push == "y" ]; then
	echo Pushing to Master
	git push origin master
else
	echo Upload Cancalled
fi

