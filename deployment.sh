# hello World
echo "============================"

# GIT_DIRECTORY='/Users/ibmislamabad/Desktop/Kyndryl/kyndryl-workspace/hwsw-webapp'
# FILES=`git --git-dir=$GIT_DIRECTORY/.git --work-tree=$GIT_DIRECTORY ls-files --modified`

WAR_PATH='/Users/ibmislamabad/Desktop/Kyndryl/deployments/hwsw-webapp/hwsw-webapp.war'
DESTINATION='/Users/ibmislamabad/Desktop/Kyndryl/deployments/hwsw-webapp/FINAL_WAR'
declare -a list
declare -a FILES

FILES=(
src/main/java/com/ibm/hscms/common/Queries.java
src/main/java/com/ibm/hscms/dao/modules/server/IServerInventoryDAO.java
src/main/java/com/ibm/hscms/dao/modules/server/ServerInventoryDAOImpl.java
src/main/java/com/ibm/hscms/services/modules/servers/ServerInventoryService.java
src/main/java/com/ibm/hscms/web/framework/ApplicationConfig.java
src/main/java/com/ibm/hscms/web/modules/server/ServerInventoryAction.java
)


for file in ${FILES[@]}
do
# temp
   # relace src/main/resources with WEB-INF/classes
    if [[ $file == src/main/resources/* ]]
    then
        temp=${file//src\/main\/resources/WEB-INF\/classes}
    fi

    # relace src/main/java with WEB-INF/classes & .java replace with .class
    if [[ $file == src/main/java/* ]]
    then
        temp=${file//src\/main\/java/WEB-INF\/classes}
        temp=${temp//.java/.class}
    fi

    temp='unzip -o '$WAR_PATH' '$temp' -d '$DESTINATION' '
    echo $temp
    list+=($temp'\n')

done

# copy the $temp to clipboard
echo ${list[@]} | pbcopy

# for each list item execute it

echo "============================"




# read FILES.

# while read line
# do
#     FILES=("${FILES[@]}" $line)
#     case $input in [break]);; *) break;; esac
# done

# echo ${FILES[@]}
