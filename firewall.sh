printf "\n******Hello Welcome to The Help Menu*****\n
1.Check Iptable Status
2.Add Firewall Rule\n
3.Delete Firewall Rule\n
4.Modify Firewall Rule\n
5.Exit\n
Please Type In a Number to choose your option\n
"
read -p "Type In a Number :" num
printf "\n"
echo "You pick option :" $num

if [ $num -eq 1 ]
then
    echo -e "************************************\n"
     >rpm -q iptables 
     >/etc/init.d/iptables status 
    echo -e "************************************\n"
fi 