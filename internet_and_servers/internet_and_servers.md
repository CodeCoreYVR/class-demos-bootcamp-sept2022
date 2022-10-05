TCP/IP

Transmission Control Protocal / Internet Protocol

A four layer model to breakdown how data is transfered from one computer to another on the internet

Layer 1: Link/Physical
- responsible for turning bit streams 1s and 0s into something that can be physically transfered througha wire
- how to transport raw data from node to node

-------------------------------------------------

Layer 2: Internet
- responsible for getting data to a destination

- IPv4 - protocol used to identify every computer in a network and is also used to determine what route data should go to reach its destination

- IPv4 Address is a four byte number used to uniquely identify a computer (32 -bit)
- IPv4 has about 4.3 billion unique addresses. But this is not enough addresses for the world

IPv6 is the newer IPv4
an IPv6 address is made up of 128 bits
IPv6 address are 4 16-bit addresses. So every number can go up to ~65,000
It uses hexadecimal which is a base 16 number...
0 - 9
A - 10
B - 11
C - 12
D - 13
E - 14
F - 15

IPv6 has 2^128

DNS - Domain Name Service
Because we do not want to memorize IP addresses we use a DNS to create a nickname for a domain address.
DNS Services have a dictionary that knows which domain name belongs to what address
codecore.ca -> has the address of -> 205.144.171.150
google.ca -> has the address of -> 172.217.14.195

you can use the command `host <domain_name>` to find out the IP address of a domain name

-------------------------------------------------

Layer 3: Transport
- Repsonsible for turning a larger resource into small pieces called packets
- Responsible for reconstructing the packets back into the larger resource at the destination

TCP - Transmission Control Protocol
- A resource is split up into multiple packets
- A packet has 3 parts
  - Header: Holds information used to error check & info on how to assemble the packets back into the original resource
  - Body/Payload: The actual data that needs to transported
  - Footer: Information to end the packet
- Is reliable
- Packets are ordered
- Packets are error checked
- Connection based

Ports
- Ports can be thought of as doors that your computer can open and close when it needs to send information or recieve information from the internet.
- Every application that is running, that requires internet access, will give assigned a port.

UDP - User Datagram Protocol
- Unreliable
- No order checking
- conectionless
- faster than TCP

Servers & Clients
- A client is a computer that is requesting/sending a resource
- A Server is a computer that responds to incoming requests

-------------------------------------------------

Layer 4: Application
- This is the layer that we work with the most as web developers
- This is where applications like (web browesrs) google chrome, safari, work in.
- It's responsible for fetching resources. (it will turn images into an encoded format)

HTTP - HyperText Transfer Protocol
- used to send text between clients and servers
- has built in verbs used to describe requests
- has built in response codes for extra information in reponses
- Uses a combination of VERBs URL's and PATHs to get resources from servers


<!--  -->
TCP/IP as a whole. Sending a image to facebook

----------------------Layer 4--------------------------
1) User uploads an image on the application layer
2) The application turns the image into a encoded text format and sends it using HTTPS
----------------------Layer 3--------------------------
3) TCP will break up the encoded text into multiple packets
4) Defines rules on how to re-build the packets at the destination
----------------------Layer 2--------------------------
5) IPv4 Will route packets from the origin to the destination
----------------------Layer 1--------------------------
6) Changing the encoded text into a phsyical form that can be transported through a wire
