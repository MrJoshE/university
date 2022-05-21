# Week 2 - Application Layer



## Principles of network applications

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

**Vanilla TCP & UDP sockets:**

- No encryption
- clear text passwords sent into socket traverse internet

**Transport Layer Security (TLS)**

- Provides encrypted TCP connections
- data integrity
- End-point authentication

**TSL implemented in application layer**

- apps use TLS libraries, that use TCP in turn

**TLS socket API**

- cleartext sent into socket traverse internet *encrypted*



## Web and HTTP (Part 1)





#### HTTP overview

- Web's application layer protocol
- Client / server model:
  - client: browser that requests, recieves (using HTTP protocol) and displays Web objects
  - Server: Web server sends (using HTTP protocol) objects in response to requests

**HTTP uses TCP:**

- Client initiates TCP conection (creates socket) to server, port 80
- Server accepts TCP connection from client
- HTTP messages (application-layer protocol messages) exchanged between browsers (HTTP client) and web server (HTTP server)
- TCP conncetion closed.

**HTTP is 'stateless'**

- server maintains no information about past client requests



#### HTTP connections

**Non-persistent HTTP**

1. TCP connection opened
2. At most one object sent over TCP connection
3. TCP connection closed

**Persistent HTTP**

- TCP connection opened to a server
- multiple objects can be sent over single TCP connection between client and that server
- TCP connection closed



#### **Non-persistent HTTP Example**

1. HTTP client initiates TCP connection to HTTP server at www.josh.com on port 80
2. HTTP server at host www.josh.com waiting for TCP connection at port 80 'accepts' connection, notifiying client
3. HTTP client sends HTTP request message (containing URL) into TCP connection socket. Message indicates that the client wants object someSubdomain/home.index
4. HTTP server recieves request message, forms *response message* containing requested object, and sends message into its socket.
5. HTTP server closes TCP connection.
6. HTTP client recieves response message containing HTML file, displays HTML. Parsing HTML file, shows the contents in the browser.



#### **RTT (definiton)**:

- time for a small packet to travel fro client to server and back.

#### **HTTP response time (per object)**:

- one RTT to initiate TCP connectiojn
- one RTT for HTTP request and first few bytes of HTTP response to return
- Object/file transmission time



