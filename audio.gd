extends Node

@export var master_volume: float = 100.0
@export var music_volume: float = 100.0
@export var sounds_volume: float = 100.0

func reset_bus_volumes():
	set_volume_master(master_volume)
	set_volume_music(music_volume)
	set_volume_sfx(sounds_volume)
	
func set_volume_master(volume: float):
	set_volume_channel("Master", volume)
	
func set_volume_music(volume: float):
	set_volume_channel("Music", volume)
	
func set_volume_sfx(volume: float):
	set_volume_channel("Sound Effects", volume)

func set_volume_channel(channel_name: String, volume: float):
	var bus_index= AudioServer.get_bus_index(channel_name)
	AudioServer.set_bus_volume_linear(bus_index, volume / 100)
