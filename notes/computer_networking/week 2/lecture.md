# Week 2 - Application Layer



## Overview

#### Goals:

- conceptual and implementation aspects of application-layer protocols
- transport-layer service models
- client-server paradigm
- peer-to-peer paradigm

#### Creating a network app

**Write programs that:**

- run on (different) end systems
- communicate over network
- web server software communicates with browser software

**No need to write software for network-core devices**

- network-core devices do not run user applications
- applications on end systems allows for rapid app development propagration



#### Client Server Paradigm

**Sever**

- always-on host 
- permanent IP address
- often in data centers, for scaling

**Client**

- contact, communicate with server 
- may be intermittently connected
- can be have a dynamic IP address
- do *not* communicate directly with each other

**Examples**

- HTTP, IMAP, FTP



#### Peer-peer architecture

- no *always*-on server
- unspecified amount of end systems directly communicate 
- peers request service from other peers, provide service in return to other peers
- peers are intermittently connected and change IP addresses 
  - complex management

**Example**

- P2P file sharing

  

#### Process communicating

**process:** program runnnig within a host

- within same host, two processes communicate using inter-process communication (defined by OS)
- processes in different hosts communicate by exchanging messages



#### Sockets

- Process sends/ recieves messafes to/from its socket
- Sockets share some characteristics with doors
  - sending process shoves messages out the door
  - sending process relies on transport infrasturcture on the other side of door to deliver message to socket at recieving process
  - two sockets involved: one on each side



#### Addressing Process

- to receive messages, process must have **identifier**
- host device has unique 32-bit IP address
- **identifier** includes both **IP address** and port numbers associated with process on host



#### Application-layer protocol defines:

- types of messages exchanged
  - e.g request, response
- message syntax:
  - what fields in messages & how fields are delineated
- rules for when and how processes send and respond to messages
- open protocols:
  - define in RFCs, everyone has access to protocol definition
  - allows for interoperability 
  - e.g HTTP, SMTP
- proprietary protocols:
  - Skype, Zoom



#### Internet trasport protocols services



#### Securing TCP