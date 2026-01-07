# PPSSPP Adhoc Server
This is a fork from Souler/ppsspp-adhoc-server repository only to add support for a proxy v1.

## Proxy issue
I was trying to run this adhoc server in a raspberry pi zero, and then share it with friends over a tailnet (tailscape) VPN. To do that I was basically starting the Adhoc server and then use this command to share it over the network.

```sh
tailscape serve --tcp 27312 --proxy-protocol 1 127.0.0.1:27312
```

The problem is that if you use a proxy the adhoc server thinks that every request is coming from 127.0.0.1. That is a problem because the code is using the IP to distinquish users, so more than two users from the same IP is not allowed. Therefore I made a change to parse the IP from the PROXY special header of the v1 protocol. (more info here: [Haproxy PROXY v1 protocol](https://www.haproxy.org/download/1.8/doc/proxy-protocol.txt))

## Run docker
```
docker run -d --name=adhoc -p 27312:27312 ghcr.io/souler/ppsspp-adhoc
```

## Contributors
- [Kyhel](https://github.com/Kyhel) for sharing the original PPSSPP AdhocServer source code on [the forums](http://forums.ppsspp.org/showthread.php?tid=3595&pid=59021#pid59021)
- [Souler](https://github.com/Souler) for the original repository


## Compile requirements
Make sure you have installed the sqlite-dev dependencies.

On Ubuntu:

```sh
sudo apt install libsqlite3-dev
```
