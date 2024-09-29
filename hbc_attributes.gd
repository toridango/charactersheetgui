extends HBoxContainer

func populate_attributes(data: Dictionary, derived_data: Dictionary) -> void:
	var name = data.name; var mod = 0
	var pb = derived_data.pb
	var str_data = data.system.abilities.str; mod = int(str_data.value)/2 -5
	$VBCStrength/LabelValue.text = str(str_data.value)
	$VBCStrength/LabelMod.text = "%+d" % mod
	$VBCStrength/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*str_data.proficient)
	$VBCStrength/HBoxContainer/CheckBoxProf.button_pressed = str_data.proficient > 0
	var dex_data = data.system.abilities.dex; mod = int(dex_data.value)/2 -5
	$VBCDexterity/LabelValue.text = str(dex_data.value)
	$VBCDexterity/LabelMod.text = "%+d" % mod
	$VBCDexterity/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*dex_data.proficient)
	$VBCDexterity/HBoxContainer/CheckBoxProf.button_pressed = dex_data.proficient > 0
	var con_data = data.system.abilities.con; mod = int(con_data.value)/2 -5
	$VBCConstitution/LabelValue.text = str(con_data.value)
	$VBCConstitution/LabelMod.text = "%+d" % mod
	$VBCConstitution/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*con_data.proficient)
	$VBCConstitution/HBoxContainer/CheckBoxProf.button_pressed = con_data.proficient > 0
	var int_data = data.system.abilities.int; mod = int(int_data.value)/2 -5
	$VBCIntelligence/LabelValue.text = str(int_data.value)
	$VBCIntelligence/LabelMod.text = "%+d" % mod
	$VBCIntelligence/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*int_data.proficient)
	$VBCIntelligence/HBoxContainer/CheckBoxProf.button_pressed = int_data.proficient > 0
	var wis_data = data.system.abilities.wis; mod = int(wis_data.value)/2 -5
	$VBCWisdom/LabelValue.text = str(wis_data.value)
	$VBCWisdom/LabelMod.text = "%+d" % mod
	$VBCWisdom/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*wis_data.proficient)
	$VBCWisdom/HBoxContainer/CheckBoxProf.button_pressed = wis_data.proficient > 0
	var cha_data = data.system.abilities.cha; mod = int(cha_data.value)/2 -5
	$VBCCharisma/LabelValue.text = str(cha_data.value)
	$VBCCharisma/LabelMod.text = "%+d" % mod
	$VBCCharisma/HBoxContainer/LabelSave.text = "%+d" % (mod+pb*cha_data.proficient)
	$VBCCharisma/HBoxContainer/CheckBoxProf.button_pressed = cha_data.proficient > 0


func _on_str_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var str_data = source_data.system.abilities.str; var mod = int(str_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCStrength/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
		
func _on_dex_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var dex_data = source_data.system.abilities.dex; var mod = int(dex_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCDexterity/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
		
func _on_con_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var con_data = source_data.system.abilities.con; var mod = int(con_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCConstitution/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
		
func _on_int_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var int_data = source_data.system.abilities.int; var mod = int(int_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCIntelligence/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
		
func _on_wis_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var wis_data = source_data.system.abilities.wis; var mod = int(wis_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCWisdom/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
		
func _on_cha_prof_toggled(toggled_on: bool) -> void:
	var source_data = GlobalControl.source_data
	var derived_data = GlobalControl.derived_data
	if !source_data.is_empty() and !derived_data.is_empty():
		var cha_data = source_data.system.abilities.cha; var mod = int(cha_data.value)/2 -5
		var pb = derived_data.pb * int(toggled_on)
		$VBCCharisma/HBoxContainer/LabelSave.text = "%+d" % (mod+pb)
