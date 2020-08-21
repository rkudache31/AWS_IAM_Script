####################################################################
#Script Details:- This script for user managment activity          #
#Auther:- Ravindra Kudache  Date:- 21-08-20                        #
####################################################################
echo "Please select one of the codition
press 1 usercreation
press 2  useraddtion in group
press 3  User assign polices
"
read input



#username=$1
#groupname=$2
#User addition function
useradd(){
echo "Enter username "
read  username
if [ -z $username ]
then
echo "missing username"
else
aws iam create-user --user-name $username
if [ $? == 0 ]
then
echo "User $username is add"
fi

fi
}
#Group add function
UserAddGroup(){
echo "Enter username "
read username
echo "Enter group name"
read groupname
if [ -z $username ] | [ -z $groupname ]
then
echo "missing username or groupname please rerun script"
else
aws iam add-user-to-group --user-name $username --group-name  $groupname
if [ $? == 0 ]
then
echo "User $username is added in $groupname"
fi
fi
}
UserAddRole(){
echo "Enter Policeis ARN"
read role
echo "Enter username"
read username
if [ -z $username ] | [ -z $role ]
then
echo "missing username or role please rerun script"
else
aws iam attach-user-policy --user-name $username --policy-arn $role
if [ $? == 0 ]
then
echo "User $username is added in $role polices "
fi

fi
}


#As per input run the script
case "$input" in
   "1") useradd
    ;;
   "2") UserAddGroup
    ;;
   "3") UserAddRole
    ;;
   *) echo "Sorry wrong input"
    ;;
esac
