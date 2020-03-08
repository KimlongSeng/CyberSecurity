start1()
{
printf "\n******Hello Welcome to The Help Menu*****\n
1. Check list of Rules
2.Add Firewall Rule
3.Delete Firewall Rule
4.Modify Firewall Rule
5.Save
6.Exit\n
Please Type In a Number to choose your option\n
    "
function
}

function(){

read -p "Type In a Number :" num
printf "\n"
echo "You pick option :" $num

if [ $num -eq 4 ]
then 

echo " 
1) Insert Rule
2) Replace Rule
3) Go to Main Menu\n
"
read num4
case $num4 in
 1) echo "\nplease Enter the Chain(INPUT,FORWARD,OUTPUT) and Hit Enter key \n"
    read -p " Chain :" chain1
    echo "\nplease Enter the Rule Number and Hit Enter key \n"
    read -p " Rule :" rules1
    echo "\nplease Enter DROP OR ACCEPT and Hit Enter key \n"
    read -p "DROP OR ACCEPT :" DorP
    echo " the result : sudo iptables -I $chain1 $rules1 -j $DorP"
    sudo iptables -I $chain1 $rules1 -j $DorP;;

 2) echo "\nplease Enter the Chain(INPUT,FORWARD,OUTPUT) and Hit Enter key \n"
    read -p " Chain :" chain1
    echo "\nplease Enter the Rule Number and Hit Enter key \n"
    read -p " Rule :" rules1
    echo "\nplease Enter the Rule Number and Hit Enter key (i.e 5.158.238.32)\n"
    read -p " New Rule Source :" sources
    echo "\nplease Enter DROP OR ACCEPT and Hit Enter key \n"
    read -p "DROP OR ACCEPT :" DorP
    echo "the result : sudo ipatble -R $chain1 $rules1 -s $sources -j $DorP"
    sudo iptables -R $chain1 $rules1 -s $sources -j $DorP;;
 3) start1;;
esac

fi 

if [ $num -eq 3 ]
then 
  echo  "\n*************************************************\n"
  echo  "
    1. Delete Rule by Chain and Number
    2. Flush By Chain
    3. Flush All Chains (Delete All)
    4. Go to Main Menu\n
  "
  read num1
  case $num1 in

  1) echo " 
  please enter the chain
  1. INPUT
  2. OUTPUT
  3. Forward
  4. Go to Main Menu\n"
    read num1a
    case $num1a in
    1) echo " enter number of rule"
    read numrule
    sudo iptables -D $num1a $numrule;;
    2) echo " enter number of rule"
    read numrule
    sudo iptables -D $num1a $numrule;;
    3) echo  " enter number of rule"
    read numrule
    sudo iptables -D $num1a $numrule;;
    4) start1;;
    esac ;;
  2) echo " 
      please enter the chain
    1. INPUT
    2. OUTPUT
    3. Forward
    4. Go to Main Menu\n"
    read num1b
    case $num1b in
    1) sudo iptables -F INPUT;;
    2) sudo iptables -F OUTPUT;;
    3)sudo iptables -F FORWARD;;
    4) start1;;
    esac ;;
  3) sudo iptables -F;;
  4) start1;;
esac
fi



if [ $num -eq 1 ]
then
    echo  "***************************************************\n"
    sudo iptables -L --line-numbers
    echo  "\n*************************************************\n
    ******Press enter to return to menu
    "
    read temp
    start1
fi 
if [ $num -eq 2 ]
then

    echo  " ***** Add Firewall Rule *****\n
    Please Choose a Chain of Fliter Table?\n
    1. INPUT
    2. OUTPUT
    3. Forward
    4. Go to Main Menu\n"
    
    read Input_option
    case $Input_option in
    1) chain="INPUT" ;;
    2) chain="OUTPUT" ;;
    3) chain="FORWARD" ;;
    4) start1 ;;
    *) echo  "Please 1, 2, 3, or 4!"
    esac

    echo  "
    1. Firewall with Single Source IP\n
    2. Firewall with Source Subnet
    3. Firewall with for All Source Networks
    4. Go to Main Menu\n"
    
    read option_IP
    case $option_IP in
    1) echo  "\nPlease Enter the IP Address of the Source"
    read ip_source ;;
    2) echo  "\nPlease Enter the Source Subnet (Example 111.111.11.1/11)"
    read ip_source ;;
    3) ip_source="0/0" ;;
    4)start1;;
   *) echo  "Please 1, 2, 3, or 4 !"
    esac

    echo  " Getting IP Address\n
    1. Using Single Destination IP
    2. Using Destination Subnet
    3. Using for All Destination Networks
    4. Go to Main Menu\n"

    read opt_ip
    case $opt_ip in
    1) echo  "\nPlease Enter the IP Address of the Destination"
       read ip_dest ;;
    2) echo  "\nPlease Enter the Destination Subnet (example 111.111.11.1/11)"
       read ip_dest ;;
    3) ip_dest="0/0" ;;
    4) start1;;
    *) echo  "Please 1, 2, or 3!!!"
       esac
    echo " Getting Protocal \n
       1. Block All Traffic of TCP
       2. Block Specific TCP Service
       3. Block Specific Port
       4. Using no Protocol
       5. Go to Main Menu\n
       "
    read proto_ch
    case $proto_ch in
        1) proto=TCP ;;
        2) echo  "Enter the TCP Service Name: (CAPITAL LETTERS!!!)"
        read proto ;;
        3) echo  "Enter the Port Name: (CAPITAL LETTERS!!!)" 
        read proto ;;
        4) proto="NULL" ;;
        5) start1 ;;
        *) echo  "Please 1, 2, 3, 4, or 5!"
    esac

    echo  "Rule?\n
       1. Accept the Packet\n
       2. Reject the Packet
       3. Drop the Packet
       4. Create Log
       5. Go to Main Menu\n"
       read rule_in
       case $rule_in in 
        1) rule="ACCEPT" ;;
        2) rule="REJECT" ;;
        3) rule="DROP" ;;
        4) rule="LOG" ;;
        5) start1 ;;
        *) echo  "Please 1, 2, 3, 4, or 5!"
       esac

    echo  "\n\tPress Enter key to Generate the Complete Rule!!!"
    read temp
    echo  "The Generated Rule is \n"
    if [ $proto == "NULL" ]; then
    echo  "\n sudo iptables -A $chain -s $ip_source -d $ip_dest -j $rule\n"
    gen=1
    else
    echo  "\n sudo iptables -A $chain -s $ip_source -d $ip_dest -p $proto -j $rule\n"
    gen=2
    fi 
    echo  "\n\tDo you want to Enter the Above rule to the IPTABLES? Yes=1 , No=2"
    read ans
    if [ $ans == 1 ] && [ $gen == 1 ]; then
    sudo iptables -A $chain -s $ip_source -d $ip_dest -j $rule
    else if [ $ans == 1 ] && [ $gen == 2 ]; then
    sudo iptables -A $chain -s $ip_source -d $ip_dest -p $proto -j $rule         
   
else if [ $ans == 2 ]; then
 Start
fi
fi
fi
fi


if [ $num -eq 5 ]
then
    sudo iptables-save
    echo  "
    *****************all file save******************
    \nPress Enter To Go To Main Menu
    "
    read temp
    start1
fi
if [ $num -eq 6 ]
then
echo "\n\t******Exiting The program \n 
 ********** HAVE A GOOD DAY **********\n" 
exit 0

fi

if [ $num -le 0 ] || [ $num -ge 7 ]
then
echo "please enter the write option i.e 1, 2, 3, 4, 5, 6"
start1
fi

}
start1
exit 0
