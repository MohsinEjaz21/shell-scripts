# hello World
echo "============================"

GIT_DIRECTORY='/Users/ibmislamabad/Desktop/Kyndryl/kyndryl-workspace/hwsw-webapp'
FILES=`git --git-dir=$GIT_DIRECTORY/.git --work-tree=$GIT_DIRECTORY ls-files --modified`
declare -a list

# replace rules for files names
# src/main/resources replaceWith WEB-INF/classes
# src/main/java replaceWith WEB-INF/lib
# .java replaceWith .class
# then print them
for file in $FILES
do
# temp
# relace src/main/resources with WEB-INF/classes and return new string
    if [[ $file == src/main/resources/* ]]
    then
        temp=${file//src\/main\/resources/WEB-INF\/classes}
    fi

# relace src/main/java with WEB-INF/classes and return new string
    if [[ $file == src/main/java/* ]]
    then
        temp=${file//src\/main\/java/WEB-INF\/classes}
        temp=${temp//.java/.class}
    fi

    temp='unzip -o /Users/ibmislamabad/Desktop/Kyndryl/deployments/hwsw-webapp/hwsw-webapp.war '$temp
    temp=' '$temp' -d /Users/ibmislamabad/Desktop/Kyndryl/deployments/hwsw-webapp/final_war'
    echo $temp | sed 's/src\/main\/java/WEB-INF\/classes/'
    list+=($temp'\n')

done

# copy the $temp to clipboard
echo ${list[@]} | pbcopy

echo "============================"
