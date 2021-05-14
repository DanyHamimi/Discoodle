# Discoodle

# Discoo.dog : A discoodle implementation.

Discoo.dog is a web application with the main features of Discord and Moodle. It can be used by students to chat, voice chat, check announcements, and discuss with their teachers.

It has a similar interface to discord, with channels, servers, WebRTC voice and video chat.

## Implementation :

Discoo.dog is a fully dynamic web application. **It is almost 100% javascript.** Which makes it asynchronous and way faster. Since it's a web app, it can also be multiplatform or implemented into a standalone executable as in Discord (using Electron).

### Languages used :

Front end : HTML5, Javascript, CSS.

Back end : NodeJs, SQL.

### Main libraries used :

1) Express Server (HTTP Requests)
2) Mutler (File Upload)
3) Socket.io (WebSockets)
4) bCrypt (Back-end encryption)
5) CookieParser (Back-End cookie parser)
6) MySQL (SQL)
7) HandShake (Client-Server middleware)
8) PeerJS (Peer-to-Peer WebRTC for voice and video)

## How to run :

### Prerequisites :
In order to run discoo.dog, **you need :**

**1) Npm :** `apt install npm`

**2) NodeJs :** `apt install nodejs`

**3) MySql :** `apt install mysql`

### Running :

If you're running this for the first time, you need to setup your mysql database. Execute these lines **in order in the git folder** :

```
mysql -u root -p
CREATE DATABASE discoodle;
USE discoodle
SOURCE discoodleBDD.sql
```

**PS: You can use PhpMyAdmin for an easier mysql database setup.** 

Then, we need to install npm prerequisites and run the local server. Execute these lines **in order in the git folder** :
```
npm install
npm start
```

If the console logs `Server started`, we can open a web browser and type the url: 

`localhost:5000`

## Main Features :

1) Real time WebSocket chat.
2) Real time WebSocket image upload and display.
3) Server - Channel - Chat hierarchy.
4) Client side SQL API. Can interact with database anywhere in any file.
5) 