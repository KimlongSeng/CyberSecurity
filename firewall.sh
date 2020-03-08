start1()
{
printf "\n******Hello Welcome to The Help Menu*****\n
1.Check Iptable Status
2.Add Firewall Rule
3.Delete All Firewall Rule
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
if [ $num -eq 1 ]
then
    echo -e "***************************************************\n"
    sudo iptables -L
    echo  -e "\n"
    sudo iptables -S
    echo -e "\n*************************************************\n"
fi 
if [ $num -eq 2 ]
then

    echo -e " ***** Add Firewall Rule *****\n
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
    *) echo -e "Please 1, 2, 3, or 4 !"
    esac

    echo -e "
    1. Firewall with Single Source IP\n
    2. Firewall with Source Subnet
    3. Firewall with for All Source Networks
    4. Go to Main Menu\n"
    
    read option_IP
    case $option_IP in
    1) echo -e "\nPlease Enter the IP Address of the Source"
    read ip_source ;;
    2) echo -e "\nPlease Enter the Source Subnet (Example 111.111.11.1/11)"
    read ip_source ;;
    3) ip_source="0/0" ;;
    4)start1;;
   *) echo -e "Please 1, 2, 3, or 4 !"
    esac

    echo -e " Getting IP Address\n
    1. Using Single Destination IP
    2. Using Destination Subnet
    3. Using for All Destination Networks
    4. Go to Main Menu\n"

    read opt_ip
    case $opt_ip in
    1) echo -e "\nPlease Enter the IP Address of the Destination"
       read ip_dest ;;
    2) echo -e "\nPlease Enter the Destination Subnet (example 111.111.11.1/11)"
       read ip_dest ;;
    3) ip_dest="0/0" ;;
    4) start1;;
    *) echo -e "Please 1, 2, or 3!!!"
       esac
    echo -e " Getting Protocal \n
       1. Block All Traffic of TCP
       2. Block Specific TCP Service
       3. Block Specific Port
       4. Using no Protocol
       5. Go to Main Menu\n
       "
    read proto_ch
    case $proto_ch in
        1) proto=TCP ;;
        2) echo -e "Enter the TCP Service Name: (CAPITAL LETTERS!!!)"
        read proto ;;
        3) echo -e "Enter the Port Name: (CAPITAL LETTERS!!!)" 
        read proto ;;
        4) proto="NULL" ;;
        5) start1 ;;
        *) echo -e "Please 1, 2, 3, 4, or 5!"
    esac

    echo -e "Rule?\n
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
        *) echo -e "Please 1, 2, 3, 4, or 5!"
       esac

    echo -e "\n\tPress Enter key to Generate the Complete Rule!!!"
    read temp
    echo -e "The Generated Rule is \n"
    if [ $proto == "NULL" ]; then
    echo -e "\n sudo iptables -A $chain -s $ip_source -d $ip_dest -j $rule\n"
    gen=1
    else
    echo -e "\n sudo iptables -A $chain -s $ip_source -d $ip_dest -p $proto -j $rule\n"
    gen=2
    fi 
    echo -e "\n\tDo you want to Enter the Above rule to the IPTABLES? Yes=1 , No=2"
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
if [ $num -eq 3 ]
then 
  echo -e "\n*************************************************\n"
    sudo iptables -F 
    sudo iptables -t nat -F
    sudo iptables -t mangle -F
    sudo iptables -X
  echo -e "\n*************************************************\n"
fi

if [ $num -eq 5 ]
then
    sudo iptables-save
    echo -e "
    *****************all file save******************
    \nPress Enter To Go To Main Menu
    "
    read temp
    start1
fi
if [ $num -eq 6 ]
then 
exit 0
fi

}
start1
exit 0
