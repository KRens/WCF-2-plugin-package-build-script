#!/bin/sh
#Usage: ./build.sh com.your.packagename
#The package has to be in the subfolder com.your.packagename/.

PACKAGE_NAME="$1"

echo "Usage: ./build.sh com.your.packagename"
cd $PACKAGE_NAME/
test -e requirements && echo "\nBuilding requirements\n-------------------------" && mkdir requirements
test -e acptemplates && echo "\nBuilding acptemplates.tar\n-------------------------" && cd acptemplates && tar cvf ../acptemplates.tar * && cd ..
test -e files && echo "\nBuilding files.tar\n------------------" && cd files && tar cvf ../files.tar --exclude .DS_Store * && cd ..
test -e templates && echo "\nBuilding templates.tar\n----------------------" && cd templates && tar cvf ../templates.tar * && cd ..
echo "\nBuilding $PACKAGE_NAME archive"
for i in `seq 1 ${#PACKAGE_NAME}`;
do
printf "-"
done
printf "\n"
tar --exclude=acptemplates --exclude=files --exclude=templates --exclude=nbproject --exclude=README* --exclude=.gitignore --exclude=*.tar.gz --exclude=LICENSE* --exclude=c --exclude=z --exclude=v -czvf ../$PACKAGE_NAME.tar.gz *
test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar
exit 0
