extends Control

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
var source_data: Dictionary
var derived_data: Dictionary

func _on_loadactorfile_button_down() -> void:
	#TODO THIS IS THE ACTUAL CALL
	#$ActorFileDialog.popup_centered()
	#TODO THIS IS THE SHORTCUT 
	load_actor("D:\\Dana\\Local Data\\fvtt-tess-test.json")

func save_actor():
	pass

func calculate_proficiency_bonus(data) -> int:
	var levels = 0
	for item in data.items:
		if(item.type == "class"):
			levels += item.system.levels
	return max(2, 1 + ceil(levels/4))

func calculate_initiative_bonus(data) -> int:
	var ini_bonuses = []
	return int(data.system.abilities.dex.value)/2 -5

func calculate_derived_data(data) -> void:
	derived_data["pb"] = calculate_proficiency_bonus(data)
	derived_data["ini"] = calculate_initiative_bonus(data)

func load_actor(path: String) -> void:
	var json = JSON.new()
	print(path)
	var file = FileAccess.open(path, FileAccess.READ)
	if !file.file_exists(path):
		return
	
	var error = json.parse(file.get_as_text())
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_DICTIONARY:
			#print(data_received) # Prints array
			source_data = data_received
			populate_basic_info(data_received)
			calculate_derived_data(data_received)
			populate_attributes(data_received)
			populate_skills(data_received)
			populate_more_stats(data_received)
		else:
			print("Unexpected data")
	
	file.close()

func _on_actorfiledialog_file_selected(path: String) -> void:
	load_actor(path)

func get_actor_size(data: Dictionary) -> String:
	# tiny, sm, med, lg, huge, grg
	var size = data.system.traits.size
	if size == "sm":
		size = "small"
	elif size == "med":
		size = "medium"
	elif size == "lg":
		size = "small"
	elif size == "grg":
		size = "gargantuan"
	return size

func get_species_data(data: Dictionary):
	var item_id = data.system.details.race
	var species_data = search_items_by_id(data, item_id)
	if (species_data):
		return species_data
	return null

func search_items_by_id(data: Dictionary, id: String):
	for item in data.items:
		var key = item.find_key(id)
		if (key):
			return item
	return null

func populate_basic_info(data: Dictionary) -> void:
	var name = data.name
	var species_data = get_species_data(data)
	$ContainerBasicDetails/VBCBasicDetails/LabelName.text = name
	$ContainerBasicDetails/VBCBasicDetails/LabelSpecies.text = species_data.name
	$ContainerBasicDetails/VBCBasicDetails/LabelSize.text = get_actor_size(data)
	$ContainerBasicDetails/VBCBasicDetails/LabelType.text = species_data.system.type.value

func populate_attributes(data: Dictionary) -> void:
	$MarginContainerStats/HBoxContainerStats.populate_attributes(data, derived_data)

func populate_skills(data: Dictionary) -> void:
	$MarginContainerSkills/GridContainerSkills.populate_skills(data, derived_data)
	
func populate_more_stats(data: Dictionary) -> void:
	$MarginContainerMore/VBoxContainer.populate_proficiency_and_initiative(data, derived_data)

#func load_actor():
	#var json = JSON.new()
	#var save_location = $FileDialog.current_path
	#var file = FileAccess.open(save_location, FileAccess.READ)
	#if !file.file_exists(save_location):
		#return
	#
	#var error = json.parse(file.get_as_text())
	#if error == OK:
		#var data_received = json.data
		#if typeof(data_received) == TYPE_ARRAY:
			#print(data_received) # Prints array
		#else:
			#print("Unexpected data")
	#
	#file.close()
