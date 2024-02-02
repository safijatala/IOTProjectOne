# IoT Project One

<em>This project is a part of Oulu University course requirement for IoT course.</em>

To use this project, firstly initialize the SSH keys from PowerShell and implement them on our IoT testbed.
Connect Visual Studio with grenoble.iot-lab.info.
Then Connect with the given username, in this case, "iot2023oulu33" but would be different for you.

**This repository does NOT contain the folder vscode-server due to being too large for git. It can be downloaded from: https://unioulu-my.sharepoint.com/:u:/g/personal/msafi23_student_oulu_fi/EYyIXs4aCQNGrQvm7E2Ot84BUl3sa5Ac52VfdqX_tamELQ?e=T5HI0e . The file is compressed using 7z so you may need that. Once downloaded, add it to main folders and it should be good.**
The cache folder is also missing but it is not necessary.

Now, clone the RIOT repository from the github using the terminal command:

```
git clone https://github.com/RIOT-OS/RIOT.git
```
# Setting Up Temperature Sensor
As our purpose is to measure the temperature from the sensors in grenoble france and see their communication, firstly we need to make a folder for the temperature sensor, which i created and named it "TemperatureSensor".
Then we need to creat the main.c and Makefile files in the temperature sensor folder to connect the sensors to the testbed and get the readings. These are all included in the repository. If you're doing from scratch then you may need to make them yourself.
Save the files and compile them using the terminal with the following commands:

```
cd TemperatureSensor
source /opt/riot.source
make
```

# Running in Terminal and Uploading to Testbed
Execute the following commands in the terminal to make the project and connect it to the testbed and run it for 120 mins or two hours:


```
iotlab-experiment submit -n "1st" -d 120 -l 1,archi=m3:at86rf231+site=grenoble
make IOTLAB_NODE=auto flash
make IOTLAB_NODE=auto -C . term
```
Send another sensor to the testbed in a separate terminal using:

```
iotlab-experiment submit -n 2nd -d 120 -l grenoble,m3,2,./bin/iotlab-m3/tempsen.elf
```
Dont foget to enter temperaturesensor sub folder using cd TemperatureSensor in the new terminal too.
These commands sends the sensors to run on testbed node 1st and 2nd with the same names.

Temperature readings could be found using on the first sensor: 

```
lps
lps temperature start
```

# COAP Integration
To add COAP, you need to create a COAP folder and writing its main and make files, as well as gcoap_cli.c. 
Making the COAP similar to temperature sensor which done before and then send it to the server, using two COAP instances for the client and server.

```
iotlab-experiment submit -n COAP1 -d 60 -l grenoble,m3,3,./bin/iotlab-m3/COAP.elf
iotlab-experiment submit -n COAP2 -d 60 -l grenoble,m3,4,./bin/iotlab-m3/COAP.elf
```
These will send COAP to node 3 and 4 for 60 minutes.

# Checking Client and Server Communication
The client successfully sends a CoAP GET request to retrieve temperature data from the server.
The server responds with the requested information.
The server terminal provides network configuration details to ensure proper communication between the client and server. 

To demonstrate it, this command can be used for server terminal as it is on node 4.
```
nc m3-4 20000
ifconfig
```
ifconfig will show server ip which you need to paste in the client terminal to see if everything is working okay.

Now for the client part:
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

# Misc and Discalimer
You can resolve SSH permission errors by specifying the remote platform as "Linux" in the json settings if it gives publickey error.

It may also ask for authentication in form of an error if your're not authenticated, which can be done by entering your username and password by this:
```
iotlab-auth -u iot2023oulu33@iot-lab.info
```
This repository is created by firstly storing the files locally and then pushed to git hub using powershell. Large missing files are included on drive with public sharing. Some files may be hidden by gitguardian. In case of any error, feel free to ask me.


