extends Node

const IPADDRESS: String = "localhost"
const PORT: int = 4000

var peer: ENetMultiplayerPeer

func startServer() -> void :
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	
func startClient() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IPADDRESS,PORT)
	multiplayer.multiplayer_peer = peer
