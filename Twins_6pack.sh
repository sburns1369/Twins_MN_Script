#!/bin/bash
#0.99-- NullEntryDev Script
NODESL=Six
NODESN=6
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
CLEAR='\033[0m'
if [[ $(lsb_release -d) != *16.04* ]]; then
echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}
exit 1
fi
echo
echo
echo -e ${GREEN}"Are you sure you want to continue the installation of ${NODESL} Twins Masternodes?"
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo
echo -e ${BLUE}"May this script will store a small amount data in /usr/local/nullentrydev/ ?"${CLEAR}
echo -e ${BLUE}"This information is for version updates and later implimentation"${CLEAR}
echo -e ${BLUE}"Zero Confidental information or Wallet keys will be stored in it"${CLEAR}
echo -e ${YELLOW}"Press y to agree followed by [ENTER], or just [ENTER] to disagree"${CLEAR}
read NULLREC
echo
echo -e ${GREEN}"Would you like to enter custom IP addresses?"${CLEAR}
echo -e ${YELLOW}"If you don't know the answer, hit n for no"${CLEAR}
echo -e ${YELLOW}"If you have custom IPs hit y for yes"${CLEAR}
read customIP
echo "Creating ${NODESN} Twins system user(s) with no-login access:"
if id "twins" >/dev/null 2>&1; then
echo "legacy user exists"
MNl=1
fi
if id "twins1" >/dev/null 2>&1; then
echo "user exists"
MN1=1
else
sudo adduser --system --home /home/twins1 twins1
MN1=0
fi
if id "twins2" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user twins2!"${CLEAR}
MN2=1
else
sudo adduser --system --home /home/twins2 twins2
MN2=0
fi
if id "twins3" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user twins3!"${CLEAR}
MN3=1
else
sudo adduser --system --home /home/twins3 twins3
MN3=0
fi
if id "twins4" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user twins4!"${CLEAR}
MN4=1
else
sudo adduser --system --home /home/twins4 twins4
MN4=0
fi
if id "twins5" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user twins5!"${CLEAR}
MN5=1
else
sudo adduser --system --home /home/twins5 twins5
MN5=0
fi
if id "twins6" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user twins6!"${CLEAR}
MN6=1
else
sudo adduser --system --home /home/twins6 twins6
MN6=0
fi
echo
echo
echo
echo
echo -e ${RED}"Your New Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
if [[ "$MN1" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read MNKEY
echo
else
echo -e ${YELLOW}"Skipping First Masternode Key"${CLEAR}
fi
if [[ "$MN2" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Second Masternode Private Key:"${CLEAR}
read MNKEY2
echo
else
echo -e ${YELLOW}"Skipping Second Masternode Key"${CLEAR}
fi
if [[ "$MN3" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Third Masternode Private Key:"${CLEAR}
read MNKEY3
echo
else
echo -e ${YELLOW}"Skipping Third Masternode Key"${CLEAR}
fi
if [[ "$MN4" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fourth Masternode Private Key:"${CLEAR}
read MNKEY4
echo
else
echo -e ${YELLOW}"Skipping Fourth Masternode Key"${CLEAR}
fi
if [[ "$MN5" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fifth Masternode Private Key:"${CLEAR}
read MNKEY5
echo
else
echo -e ${YELLOW}"Skipping Fifth Masternode Key"${CLEAR}
fi
if [[ "$MN6" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Sixth Masternode Private Key:"${CLEAR}
read MNKEY6
echo
else
echo -e ${YELLOW}"Skipping Sixth Masternode Key"${CLEAR}
fi
cd ~
if [[ $NULLREC = "y" ]] ; then
if [ ! -d /usr/local/nullentrydev/ ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev"${CLEAR}
sudo mkdir /usr/local/nullentrydev
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/twins.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/twins.log"${CLEAR}
sudo touch /usr/local/nullentrydev/twins.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/twins.log"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/mnodes.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/mnodes.log"${CLEAR}
sudo touch /usr/local/nullentrydev/mnodes.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/mnodes.log"${CLEAR}
fi
fi
echo -e ${RED}"Updating Apps"${CLEAR}
sudo apt-get -y update
echo -e ${RED}"Upgrading Apps"${CLEAR}
sudo apt-get -y upgrade
if grep -Fxq "dependenciesInstalled: true" /usr/local/nullentrydev/mnodes.log
then
echo
echo -e ${RED}"Skipping... Dependencies & Software Libraries - Previously installed"${CLEAR}
echo
else
echo ${RED}"Installing Dependencies & Software Libraries"${CLEAR}
sudo apt-get -y install software-properties-common
sudo apt-get -y install build-essential
sudo apt-get -y install libtool autotools-dev autoconf automake
sudo apt-get -y install libssl-dev
sudo apt-get -y install libevent-dev
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install pkg-config
echo -e ${RED}"Press [ENTER] if prompted"${CLEAR}
sudo add-apt-repository -yu ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get -y install libdb4.8-dev
sudo apt-get -y install libdb4.8++-dev
echo -e ${YELLOW} "Here be dragons"${CLEAR}
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
if [[ $NULLREC = "y" ]] ; then
echo "dependenciesInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
if [[ customIP = "y" ]] ; then
echo -e ${GREEN}"IP for Masternode 1"${CLEAR}
read MNIP1
echo -e ${GREEN}"IP for Masternode 2"${CLEAR}
read MNIP2
echo -e ${GREEN}"IP for Masternode 3"${CLEAR}
read MNIP3
echo -e ${GREEN}"IP for Masternode 4"${CLEAR}
read MNIP4
echo -e ${GREEN}"IP for Masternode 5"${CLEAR}
read MNIP5
echo -e ${GREEN}"IP for Masternode 6"${CLEAR}
read MNIP6
else
regex='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'
FINDIP=$(hostname -I | cut -f2 -d' '| cut -f1-7 -d:)
if [[ $FINDIP =~ $regex ]]; then
echo "IPv6 Address check is good"
echo ${FINDIP} testing note
IP=${FINDIP}
echo ${IP}
else
echo "IPv6 Address check is not expected, getting IPv6 Helper to recalculate"
echo $FINDIP - testing note 1
sudo apt-get install sipcalc
echo $FINDIP - testing note 2
FINDIP=$(hostname -I | cut -f3 -d' '| cut -f1-8 -d:)
echo $FINDIP - check 3
echo "Attempting to adjust results and re-calculate IPv6 Address"
FINDIP=$(sipcalc ${FINDIP} | fgrep Expanded | cut -d ' ' -f3)
if [[ $FINDIP =~ $regex ]]; then
FINDIP=$(echo ${FINDIP} | cut -f1-7 -d:)
echo "IPv6 Address check is good"
IP=${FINDIP}
else
echo "IPv6 Addressing check has failed. Contact NullEntry Support"
echo ${IP} testing note
exit 1
fi
fi
echo ${MNIP1} testing note
echo ${IP} testing note
echo -e ${YELLOW} "Building IP Tables"${CLEAR}
sudo touch ip.tmp
for i in {15361..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
MNIP1=$(hostname -I | cut -f1 -d' ')
MNIP2=$(sed -n '2p' < ip.tmp)
MNIP3=$(sed -n '3p' < ip.tmp)
MNIP4=$(sed -n '4p' < ip.tmp)
MNIP5=$(sed -n '5p' < ip.tmp)
MNIP6=$(sed -n '6p' < ip.tmp)
rm -rf ip.tmp
fi
if grep -Fxq "swapInstalled: true" /usr/local/nullentrydev/mnodes.log
then
echo -e ${RED}"Skipping... Swap Area already made"${CLEAR}
else
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
if [[ $NULLREC = "y" ]] ; then
echo "swapInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
cd ~
touch twinscheck.tmp
ps aux | grep twins >> twinscheck.tmp
if grep home/twins/.twins twinscheck.tmp
then
echo Found OLD ${NC} twins Node running
OldNode="1"
else
echo No ${NC} twins Node not running
OldNode="0"
fi
until [[ $NC = 9 ]]; do
if grep /home/twins${NC}/.twins twinscheck.tmp
then
echo Found ${NC} twins Node running
declare IPN$NC="1"
RB=1
else
echo No ${NC} twins Node not running
declare IPN$NC="0"
echo $NC
fi
NC=$[$NC+1]
done
rm -r twinscheck.tmp
if [[ "$OldNode" = "1" ]]; then
twins-cli -datadir=/home/twins/.twins stop
fi
if [[ "$IPN1" = "1" ]]; then
twins-cli -datadir=/home/twins1/.twins stop
fi
if [[ "$IPN2" = "1" ]]; then
twins-cli -datadir=/home/twins2/.twins stop
fi
if [[ "$IPN3" = "1" ]]; then
twins-cli -datadir=/home/twins3/.twins stop
fi
if [[ "$IPN4" = "1" ]]; then
twins-cli -datadir=/home/twins4/.twins stop
fi
if [[ "$IPN5" = "1" ]]; then
twins-cli -datadir=/home/twins5/.twins stop
fi
if [[ "$IPN6" = "1" ]]; then
twins-cli -datadir=/home/twins6/.twins stop
fi
if [[ "$IPN7" = "1" ]]; then
twins-cli -datadir=/home/twins7/.twins stop
fi
if [[ "$IPN8" = "1" ]]; then
twins-cli -datadir=/home/twins8/.twins stop
fi
if [[ "$IPN9" = "1" ]]; then
twins-cli -datadir=/home/twins9/.twins stop
fi
if [[ "$IPN0" = "1" ]]; then
twins-cli -datadir=/home/twins0/.twins stop
fi
if [ ! -d /root/twins ]; then
sudo mkdir /root/twins
fi
cd /root/twins
echo "Downloading latest Twins binaries"
wget https://github.com/NewCapital/TWINS-Core/releases/download/twins_v3.2.1.0/twins-3.2.1.0-x86_64-linux-gnu.tar.gz
tar -xvzf twins-3.2.1.0-x86_64-linux-gnu.tar.gz
sleep 3
sudo mv /root/twins/twins-3.2.1/bin/twinsd /root/twins/twins-3.2.1/bin/twins-cli /usr/local/bin
sudo chmod 755 -R /usr/local/bin/twins*
rm -rf /root/twins
if [ ! -f /home/twins1/.twins/twins.conf ]; then
echo -e "${GREEN}Configuring First Twins Node${CLEAR}"
sudo mkdir /home/twins1/.twins
sudo touch /home/twins1/.twins/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins1/.twins/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins1/.twins/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins1/.twins/twins.conf
echo "server=1" >> /home/twins1/.twins/twins.conf
echo "daemon=1" >> /home/twins1/.twins/twins.conf
echo "maxconnections=250" >> /home/twins1/.twins/twins.conf
echo "masternode=1" >> /home/twins1/.twins/twins.conf
echo "rpcport=13295" >> /home/twins1/.twins/twins.conf
echo "listen=0" >> /home/twins1/.twins/twins.conf
echo "externalip=${MNIP1}:37817" >> /home/twins1/.twins/twins.conf
echo "masternodeprivkey=$MNKEY" >> /home/twins1/.twins/twins.conf
echo "addnode=23.94.102.195" >> /home/twins1/.twins/twins.conf
MN1=0
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion1 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion1 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo -e ${YELLOW}"Found /home/twins1/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration there"${CLEAR}
fi
echo
echo -e ${YELLOW}"Launching First Twins Node"${CLEAR}
twinsd -datadir=/home/twins1/.twins -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
if [ ! -f /home/twins2/.twins/twins.conf ]; then
if [ ! -f /home/twins2/twins.conf ]; then
echo -e "${YELLOW}Second Twins Normal Warning - Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Second Twins Node${CLEAR}"
sudo mkdir /home/twins2/.twins
sudo touch /home/twins2/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins2/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins2/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins2/twins.conf
echo "server=1" >> /home/twins2/twins.conf
echo "daemon=1" >> /home/twins2/twins.conf
echo "maxconnections=250" >> /home/twins2/twins.conf
echo "masternode=1" >> /home/twins2/twins.conf
echo "rpcport=13296" >> /home/twins2/twins.conf
echo "listen=0" >> /home/twins2/twins.conf
echo "externalip=[${MNIP2}]:37817" >> /home/twins2/twins.conf
echo "masternodeprivkey=$MNKEY2" >> /home/twins2/twins.conf
echo "addnode=[${MNIP1}]" >> /home/twins1/.twins/twins.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode2 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion2 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion2 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo
echo -e ${GREEN}"Found /home/twins2/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Second Node "${CLEAR}
MN2=0
fi
else
echo -e ${YELLOW}"Found /home/twins2/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Second Node"${CLEAR}
fi
echo
if [ ! -f /home/twins3/.twins/twins.conf ]; then
if [ ! -f /home/twins3/twins.conf ]; then
echo -e "${GREEN}Third Twins Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Third Twins Node${CLEAR}"
sudo mkdir /home/twins3/.twins
sudo touch /home/twins3/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins3/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins3/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins3/twins.conf
echo "server=1" >> /home/twins3/twins.conf
echo "daemon=1" >> /home/twins3/twins.conf
echo "maxconnections=250" >> /home/twins3/twins.conf
echo "masternode=1" >> /home/twins3/twins.conf
echo "rpcport=13298" >> /home/twins3/twins.conf
echo "listen=0" >> /home/twins3/twins.conf
echo "externalip=[${MNIP3}]:37817" >> /home/twins3/twins.conf
echo "masternodeprivkey=$MNKEY3" >> /home/twins3/twins.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode3 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion3 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion3 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo -e ${YELLOW}"Found /home/twins3/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Third Node "${CLEAR}
MN3=0
fi
echo
else
echo -e ${YELLOW}"Found /home/twins3/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Third Node"${CLEAR}
fi
echo
if [ ! -f /home/twins4/.twins/twins.conf ]; then
if [ ! -f /home/twins4/twins.conf ]; then
echo -e "${GREEN}Fourth Twins Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fourth Twins Node${CLEAR}"
sudo mkdir /home/twins4/.twins
sudo touch /home/twins4/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins4/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins4/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins4/twins.conf
echo "server=1" >> /home/twins4/twins.conf
echo "daemon=1" >> /home/twins4/twins.conf
echo "maxconnections=250" >> /home/twins4/twins.conf
echo "masternode=1" >> /home/twins4/twins.conf
echo "rpcport=13299" >> /home/twins4/twins.conf
echo "listen=0" >> /home/twins4/twins.conf
echo "externalip=[${MNIP4}]:37817" >> /home/twins4/twins.conf
echo "masternodeprivkey=$MNKEY4" >> /home/twins4/twins.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode4 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion4 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion4 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo
echo -e ${YELLOW}"Found /home/twins4/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fourth Node "${CLEAR}
MN4=0
fi
else
echo -e ${YELLOW}"Found /home/twins4/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fourth Node"${CLEAR}
fi
if [ ! -f /home/twins5/.twins/twins.conf ]; then
if [ ! -f /home/twins5/twins.conf ]; then
echo -e "${GREEN}Fifth Twins Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fifth Twins Node${CLEAR}"
sudo mkdir /home/twins5/.twins
sudo touch /home/twins5/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins5/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins5/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins5/twins.conf
echo "server=1" >> /home/twins5/twins.conf
echo "daemon=1" >> /home/twins5/twins.conf
echo "maxconnections=250" >> /home/twins5/twins.conf
echo "masternode=1" >> /home/twins5/twins.conf
echo "rpcport=13300" >> /home/twins5/twins.conf
echo "listen=0" >> /home/twins5/twins.conf
echo "externalip=[${MNIP5}]:37817" >> /home/twins5/twins.conf
echo "masternodeprivkey=$MNKEY5" >> /home/twins5/twins.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode5 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion5 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion5 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo
echo -e ${YELLOW}"Found /home/twins5/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fifth Node "${CLEAR}
MN5=0
fi
else
echo -e ${YELLOW}"Found /home/twins5/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fifth Node"${CLEAR}
fi
if [ ! -f /home/twins6/.twins/twins.conf ]; then
if [ ! -f /home/twins6/twins.conf ]; then
echo -e "${GREEN}Sixth Twins Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Sixth Twins Node${CLEAR}"
sudo mkdir /home/twins6/.twins
sudo touch /home/twins6/twins.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/twins6/twins.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/twins6/twins.conf
echo "rpcallowip=127.0.0.1" >> /home/twins6/twins.conf
echo "server=1" >> /home/twins6/twins.conf
echo "daemon=1" >> /home/twins6/twins.conf
echo "maxconnections=250" >> /home/twins6/twins.conf
echo "masternode=1" >> /home/twins6/twins.conf
echo "rpcport=13301" >> /home/twins6/twins.conf
echo "listen=0" >> /home/twins6/twins.conf
echo "externalip=[${MNIP6}]:37817" >> /home/twins6/twins.conf
echo "masternodeprivkey=$MNKEY6" >> /home/twins6/twins.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode6 : true" >> /usr/local/nullentrydev/twins.log
echo "walletVersion6 : 3.2.1" >> /usr/local/nullentrydev/twins.log
echo "scriptVersion6 : 0.99" >> /usr/local/nullentrydev/twins.log
fi
else
echo
echo -e ${YELLOW}"Found /home/twins6/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Sixth Node "${CLEAR}
MN6=0
fi
else
echo -e ${YELLOW}"Found /home/twins6/.twins/twins.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Sixth Node"${CLEAR}
fi
echo
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on First Masternode Block Chain to Synchronize${CLEAR}"
echo -e "${YELLOW}Once complete, it will stop and copy the block chain to${CLEAR}"
echo -e "${YELLOW}the other masternodes. This prevent all masternodes${CLEAR}"
echo -e "${YELLOW}from downloading the block chain individually; taking up${CLEAR}"
echo -e "${YELLOW}more time and resources. Current Block count will be displayed below.${CLEAR}"
until twins-cli -datadir=/home/twins1/.twins mnsync status | grep -m 1 'IsBlockchainSynced": true'; do
twins-cli -datadir=/home/twins1/.twins getblockcount
sleep 60
done
echo -e "${GREEN}Haulting and Replicating First Twins Node${CLEAR}"

twins-cli -datadir=/home/twins1/.twins stop
sleep 10
if [[ "$MN2" -eq "0" ]]; then
sudo cp -r /home/twins1/.twins/* /home/twins2/.twins
rm /home/twins2/.twins/twins.conf
cp -r /home/twins2/twins.conf /home/twins2/.twins/twins.conf
sleep 1
fi
if [[ "$MN3" -eq "0" ]]; then
sudo cp -r /home/twins1/.twins/* /home/twins3/.twins
rm /home/twins3/.twins/twins.conf
cp -r /home/twins3/twins.conf /home/twins3/.twins/twins.conf
sleep 1
fi
if [[ "$MN4" -eq "0" ]]; then
sudo cp -r /home/twins1/.twins/* /home/twins4/.twins
rm /home/twins4/.twins/twins.conf
cp -r /home/twins4/twins.conf /home/twins4/.twins/twins.conf
sleep 1
fi
if [[ "$MN5" -eq "0" ]]; then
sudo cp -r /home/twins1/.twins/* /home/twins5/.twins
rm /home/twins5/.twins/twins.conf
cp -r /home/twins5/twins.conf /home/twins5/.twins/twins.conf
sleep 1
fi
if [[ "$MN6" -eq "0" ]]; then
sudo cp -r /home/twins1/.twins/* /home/twins6/.twins
rm /home/twins6/.twins/twins.conf
cp -r /home/twins6/twins.conf /home/twins6/.twins/twins.conf
sleep 1
fi
echo -e ${YELLOW}"Launching First Twins Node"${CLEAR}
twinsd -datadir=/home/twins1/.twins -daemon
sleep 20
echo -e ${YELLOW}"Launching Second Twins Node"${CLEAR}
twinsd -datadir=/home/twins2/.twins -daemon
sleep 20
echo -e ${YELLOW}"Launching Third Twins Node"${CLEAR}
twinsd -datadir=/home/twins3/.twins -daemon
sleep 20
echo -e ${YELLOW}"Launching Fourth Twins Node"${CLEAR}
twinsd -datadir=/home/twins4/.twins -daemon
sleep 20
echo -e ${YELLOW}"Launching Fifth Twins Node"${CLEAR}
twinsd -datadir=/home/twins5/.twins -daemon
sleep 20
echo -e ${YELLOW}"Launching Sixth Twins Node"${CLEAR}
twinsd -datadir=/home/twins6/.twins -daemon
sleep 20
echo -e ${BOLD}"All ${NODESN} Twins Nodes Launched".${CLEAR}
echo

echo -e "${GREEN}You can check the status of your Twins Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1: \"twins-cli -datadir=/home/twins1/.twins masternode status\""${CLEAR}
echo -e "${YELLOW}For mn2: \"twins-cli -datadir=/home/twins2/.twins masternode status\""${CLEAR}
echo -e "${YELLOW}For mn3: \"twins-cli -datadir=/home/twins3/.twins masternode status\""${CLEAR}
echo -e "${YELLOW}For mn4: \"twins-cli -datadir=/home/twins4/.twins masternode status\""${CLEAR}
echo -e "${YELLOW}For mn5: \"twins-cli -datadir=/home/twins5/.twins masternode status\""${CLEAR}
echo -e "${YELLOW}For mn6: \"twins-cli -datadir=/home/twins6/.twins masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: ${MNIP1}:37817${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [${MNIP2}]:37817${CLEAR}"
echo -e "${BOLD} Masternode - \#3 IP: [${MNIP3}]:37817${CLEAR}"
echo -e "${BOLD} Masternode - \#4 IP: [${MNIP4}]:37817${CLEAR}"
echo -e "${BOLD} Masternode - \#5 IP: [${MNIP5}]:37817${CLEAR}"
echo -e "${BOLD} Masternode - \#6 IP: [${MNIP6}]:37817${CLEAR}"
fi
echo -e ${BLUE}" Your patronage is appreciated, tipping addresses"${CLEAR}
echo -e ${BLUE}" Twins address: WTXakU15hxA9Q5yXMNacMPFAayovMNot69"${CLEAR}
echo -e ${BLUE}" XGS address: BayScFpFgPBiDU1XxdvozJYVzM2BQvNFgM"${CLEAR}
echo -e ${BLUE}" LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo
echo -e ${YELLOW}"Need help? Find Sburns1369\#1584 on Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo -e ${YELLOW}"If Direct Messaged please verify by clicking on the profile!"${CLEAR}
echo -e ${YELLOW}"it says Sburns1369 in bigger letters followed by a little #1584" ${CLEAR}
echo -e ${YELLOW}"Anyone can clone my name, but not the #1584".${CLEAR}
echo
echo -e ${RED}"The END."${CLEAR};
