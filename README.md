# IOTProjectOne

Initialize the SSH keys from PowerShell and implement them on our IoT testbed.
Connect Visual Studio with grenoble.iot-lab.info.
Resolve SSH permission errors by specifying the remote platform as "Linux" in the json settings.
Connect with the given username, in this case, "iot2023oulu33".

**This does not contain the folder vscode-server due to being too large for git. It can be downloaded from: https://unioulu-my.sharepoint.com/:u:/g/personal/msafi23_student_oulu_fi/EYyIXs4aCQNGrQvm7E2Ot84BUl3sa5Ac52VfdqX_tamELQ?e=T5HI0e . The file is compressed using 7z so you may need that.**

Firstly, Clone the RIOT repository from the terminal using the command:

```
git clone https://github.com/RIOT-OS/RIOT.git


```
# Setting Up Temperature Sensor
Creating a folder for the temperature sensor, named "TemperatureSensor".
Creating the main.c and Makefile files in the temperature sensor folder to connect the sensors to the testbed.
Save the files and compile them using the terminal with the following commands:

```
cd TemperatureSensor
make
source /opt/riot.source



```
# Running in Terminal and Uploading to Testbed
Execute the following commands in the terminal to make the project and connect it to the testbed:


```
iotlab-experiment submit -n "1st" -d 120 -l 1,archi=m3:at86rf231+site=grenoble
make IOTLAB_NODE=auto flash
make IOTLAB_NODE=auto -C . term



```
Send another sensor to the testbed in a separate terminal using:



```
iotlab-experiment submit -n 2nd -d 120 -l grenoble,m3,2,./bin/iotlab-m3/tempsen.elf

```

Temperature readings could be found using: 

```
lps temperature start
```

# COAP Integration
Creating a COAP folder and writing its main and make files, as well as gcoap_cli.c.
Execute the COAP project similarly to before and send it to the server, using two COAP instances for the client and server.

```

iotlab-experiment submit -n COAP -d 60 -l grenoble,m3,3,./bin/iotlab-m3/COAP.elf
iotlab-experiment submit -n COAP2 -d 60 -l grenoble,m3,4,./bin/iotlab-m3/COAP.elf
   
```

# Checking Client and Server Communication
The client successfully sends a CoAP GET request to retrieve temperature data from the server.
The server responds with the requested information.
The server terminal provides network configuration details to ensure proper communication between the client and server.
```
nc m3-4 20000
ifconfig
```

now for the client part:
```
nc m3-3 20000
ping (server ip)
coap get (ip here) 5683 /temperature
```
# Youtube Demonstration
https://youtu.be/a_Oqbb4fRW8

Creator: Muhammad Safi

Partners: Haris Naveed

Syed Hasan
