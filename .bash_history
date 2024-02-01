ls
exit
cd sesnor
ls
cd A8
exit
cd
ls
cd shared
ls
exit
git clone https://github.com/RIOT-OS/RIOT
ls
cd TempratureSensor
ls
make
source /opt/riot.source
make
iotlab-auth -u iot2023oulu33@iot-lab.info
iotlab-experiment submit -n "Tempsens" -d 120 -l 6,archi=m3:at86rf231+site=grenoble
cd TempratureSensor/ make IOTLAB_NODE=auto flash make IOTLAB_NODE=auto -C . term
make IOTLAB_NODE=auto flash make IOTLAB_NODE=auto -C . term
iotlab-experiment submit -n SecondSens -d 120 -l grenoble,m3,2,./bin/iotlab-m3/tempsensor.elf
git init 
ls
cd /
ls
exit
ls
make
ls
cd TemperatureSensor
ls
make
source /opt/riot.source
make
.make
ls
makefile
make
cd TemperatureSensor/ make IOTLAB_NODE=auto flash
TemperatureSensor/ make IOTLAB_NODE=auto flash
make IOTLAB_NODE=auto flash
make IOTLAB_NODE=auto auto -C . term
exit
iotlab-experiment submit -n 4th -d 120 -l grenoble,m3,2,./bin/iotlab-m3/tempsen.elf
lps
make IOTLAB_NODE=auto auto -C . term
lps
iotlab-auth -u iot2023oulu33@iot-lab.info
make IOTLAB_NODE=auto auto -C . term
make IOTLAB_NODE=auto auto -C . term
cd TemperatureSensor
make IOTLAB_NODE=auto auto -C . term
cd
ls
ls TemperatureSensor
make
cd TemperatureSensor
make
source /opt/riot.source
make
lps
lps temp
cd
ls
make
source /opt/riot.source
make
iotlab-experiment submit -n "1st" -d 120 -l 1,archi=m3:at86rf231+site=grenoble
make IOTLAB_NODE=auto flash
make IOTLAB_NODE=auto auto -C . term
make IOTLAB_NODE=auto -C . term
cd TemperatureSensor
iotlab-experiment submit -n 2nd -d 120 -l grenoble,m3,2,./bin/iotlab-m3/tempsen.elf
cd..
cd ..
ls
cd COAP
ls
make
source /opt/riot.source
make
iotlab-experiment submit -n COAP -d 60 -l grenoble,m3,3,./bin/iotlab-m3/COAP.elf
iotlab-experiment submit -n COAP -d 60 -l grenoble,m3,4,./bin/iotlab-m3/COAP.elf
nc m3-3 20000
nc m3-4 20000
git init
git commit -m "first commit"
git branch -M main
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/safijatala/IotProj1.git
git push -u origin main
git checkout -b main
git add .
git commit -m "Initial commit"
git push -u origin main
touch .gitignore
git add .gitignore
git commit -m "Add .gitignore file to ignore cache files and other non-essential files"
git push -u origin main
git commit -m "Initial commit"
git branch -M main
git push -u origin main
ls
git init
git add.
git add .
git commit
git init
git add .
git status
git comit m-"iot"
git commit m-"iot"
git commit m- "iot"
git commit 
