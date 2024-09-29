extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func populate_proficiency_and_initiative(data, derived_data):
	$HBCProficiency/LabelPB.text = "%+d" % derived_data.pb
	$HBCInitiative/LabelInit.text = "%+d" % derived_data.ini
	var speed_list = get_speed_list(data)
	$HBCSpeed/LabelSpeedList.text = ", ".join(speed_list)
	
func get_speed_list(data):
	var speed_dict = data.system.attributes.movement
	var speed_list : Array
	for speed in speed_dict:
		var wtf = speed_dict[speed]
		if typeof(speed_dict[speed]) in [TYPE_INT, TYPE_FLOAT]:
			if speed_dict[speed] > 0:
				var units = speed_dict["units"] if speed_dict["units"] != null else "ft"
				var desc = "%d%s %s" % [speed_dict[speed], units, speed]
				if speed == "fly" and speed_dict["hover"]:
					desc += " (hover)"
				speed_list.append(desc)
	
	return speed_list
