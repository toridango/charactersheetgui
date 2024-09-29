extends GridContainer

var attr : Dictionary
var attr_mod : Dictionary
@export var prof_textures : Dictionary = {"0": "res://assets/noproficiency2.png"}

func populate_skills(source_data, derived_data):
	var attributes = source_data.system.skills
	var skills = source_data.system.skills
	var pb = derived_data.pb
	calculate_mods(source_data)
	populate_acrobatics(skills.acr.value, pb)
	populate_animal_handling(skills.ani.value, pb)
	populate_arcana(skills.arc.value, pb)
	populate_athletics(skills.ath.value, pb)
	populate_deception(skills.dec.value, pb)
	populate_history(skills.his.value, pb)
	populate_insight(skills.ins.value, pb)
	populate_intimidation(skills.itm.value, pb)
	populate_investigation(skills.inv.value, pb)
	populate_medicine(skills.med.value, pb)
	populate_nature(skills.nat.value, pb)
	populate_perception(skills.prc.value, pb)
	populate_performance(skills.prf.value, pb)
	populate_persuasion(skills.per.value, pb)
	populate_religion(skills.rel.value, pb)
	populate_sleightofhand(skills.slt.value, pb)
	populate_stealth(skills.ste.value, pb)
	populate_survival(skills.sur.value, pb)

func calculate_mods(data):
	var str = data.system.abilities.str.value
	attr["str"] = int(str)
	attr_mod["str"] = int(str)/2 -5
	var dex = data.system.abilities.dex.value
	attr["dex"] = int(dex)
	attr_mod["dex"] = int(dex)/2 -5
	var con = data.system.abilities.con.value
	attr["con"] = int(con)
	attr_mod["con"] = int(con)/2 -5
	var inte = data.system.abilities.int.value
	attr["int"] = int(inte)
	attr_mod["int"] = int(inte)/2 -5
	var wis = data.system.abilities.wis.value
	attr["wis"] = int(wis)
	attr_mod["wis"] = int(wis)/2 -5
	var cha = data.system.abilities.cha.value
	attr["cha"] = int(cha)
	attr_mod["cha"] = int(cha)/2 -5

func populate_acrobatics(proficiency, pb):
	$MCAcrTex/AcrTex.texture = load(prof_textures[str(proficiency)])
	$AcrBonus.text = "%+d" % (attr_mod.dex + pb * proficiency)
func populate_animal_handling(proficiency, pb):
	$MCAniTex/AniTex.texture = load(prof_textures[str(proficiency)])
	$AniBonus.text = "%+d" % (attr_mod.wis + pb * proficiency)
func populate_arcana(proficiency, pb):
	$MCArcTex/ArcTex.texture = load(prof_textures[str(proficiency)])
	$ArcBonus.text = "%+d" % (attr_mod.int + pb * proficiency)
func populate_athletics(proficiency, pb):
	$MCAthTex/AthTex.texture = load(prof_textures[str(proficiency)])
	$AthBonus.text = "%+d" % (attr_mod.str + pb * proficiency)
func populate_deception(proficiency, pb):
	$MCDecTex/DecTex.texture = load(prof_textures[str(proficiency)])
	$DecBonus.text = "%+d" % (attr_mod.cha + pb * proficiency)
func populate_history(proficiency, pb):
	$MCHisTex/HisTex.texture = load(prof_textures[str(proficiency)])
	$HisBonus.text = "%+d" % (attr_mod.int + pb * proficiency)
func populate_insight(proficiency, pb):
	$MCInsTex/InsTex.texture = load(prof_textures[str(proficiency)])
	$InsBonus.text = "%+d" % (attr_mod.wis + pb * proficiency)
func populate_intimidation(proficiency, pb):
	$MCItmTex/ItmTex.texture = load(prof_textures[str(proficiency)])
	$ItmBonus.text = "%+d" % (attr_mod.cha + pb * proficiency)
func populate_investigation(proficiency, pb):
	$MCInvTex/InvTex.texture = load(prof_textures[str(proficiency)])
	$InvBonus.text = "%+d" % (attr_mod.int + pb * proficiency)
func populate_medicine(proficiency, pb):
	$MCMedTex/MedTex.texture = load(prof_textures[str(proficiency)])
	$MedBonus.text = "%+d" % (attr_mod.wis + pb * proficiency)
func populate_nature(proficiency, pb):
	$MCNatTex/NatTex.texture = load(prof_textures[str(proficiency)])
	$NatBonus.text = "%+d" % (attr_mod.int + pb * proficiency)
func populate_perception(proficiency, pb):
	$MCPrcTex/PrcTex.texture = load(prof_textures[str(proficiency)])
	$PrcBonus.text = "%+d" % (attr_mod.wis + pb * proficiency)
func populate_performance(proficiency, pb):
	$MCPrfTex/PrfTex.texture = load(prof_textures[str(proficiency)])
	$PrfBonus.text = "%+d" % (attr_mod.cha + pb * proficiency)
func populate_persuasion(proficiency, pb):
	$MCPerTex/PerTex.texture = load(prof_textures[str(proficiency)])
	$PerBonus.text = "%+d" % (attr_mod.cha + pb * proficiency)
func populate_religion(proficiency, pb):
	$MCRelTex/RelTex.texture = load(prof_textures[str(proficiency)])
	$RelBonus.text = "%+d" % (attr_mod.int + pb * proficiency)
func populate_sleightofhand(proficiency, pb):
	$MCSltTex/SltTex.texture = load(prof_textures[str(proficiency)])
	$SltBonus.text = "%+d" % (attr_mod.dex + pb * proficiency)
func populate_stealth(proficiency, pb):
	$MCSteTex/SteTex.texture = load(prof_textures[str(proficiency)])
	$SteBonus.text = "%+d" % (attr_mod.dex + pb * proficiency)
func populate_survival(proficiency, pb):
	$MCSurTex/SurTex.texture = load(prof_textures[str(proficiency)])
	$SurBonus.text = "%+d" % (attr_mod.wis + pb * proficiency)
