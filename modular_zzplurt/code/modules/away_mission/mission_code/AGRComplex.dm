#define ROLE_COMPLEX "Complex Survivors"

/obj/effect/mapping_helpers/ztrait_injector/complex
	traits_to_add = list(ZTRAIT_SNOWSTORM = TRUE, ZTRAIT_BASETURF = /turf/open/misc/asteroid/snow/complex)

/datum/weather/snow_storm/New()
	. = ..()
	protected_areas += list(
		/area/awaymission/complex/cave,
		/area/awaymission/complex/secfacility,
		/area/awaymission/complex/mainfacility
	)

/turf/open/chasm/icemoon/complex
	icon = 'icons/turf/floors/icechasms.dmi'
	initial_gas_mix = COLD_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/chasm/icemoon/complex
	light_power = 0

/turf/open/misc/asteroid/snow/complex
	initial_gas_mix = COLD_ATMOS
	baseturfs = /turf/open/misc/asteroid/snow/complex
	light_range = 1
	light_power = 0.075
	light_color = "#89959a"

/turf/open/misc/asteroid/snow/complex/dug //When you want one of these to be already dug.
	has_floor_variance = FALSE
	dug = TRUE
	base_icon_state = "snow_dug"
	icon_state = "snow_dug"

/turf/open/misc/asteroid/snow/ice/complex
	initial_gas_mix = COLD_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/ice/complex
	initial_gas_mix = COLD_ATMOS
	planetary_atmos = TRUE

/turf/open/floor/plating/snowed/complex
	initial_gas_mix = COLD_ATMOS

/turf/open/floor/plating/snowed/smoothed/complex
	initial_gas_mix = COLD_ATMOS

/turf/open/floor/stone/complex
	initial_gas_mix = COLD_ATMOS

/turf/open/floor/plating/complex
	initial_gas_mix = COLD_ATMOS

/turf/closed/mineral/random/snow/high_chance/complex
	initial_gas_mix = COLD_ATMOS
	turf_type = /turf/open/misc/asteroid/snow/complex
	baseturfs = /turf/open/misc/asteroid/snow/complex

/turf/closed/mineral/plasma/ice/complex
	initial_gas_mix = COLD_ATMOS
	turf_type = /turf/open/misc/asteroid/snow/complex
	baseturfs = /turf/open/misc/asteroid/snow/complex

/turf/closed/mineral/snowmountain/cavern/complex
	initial_gas_mix = COLD_ATMOS
	baseturfs = /turf/open/misc/asteroid/snow/complex
	turf_type = /turf/open/misc/asteroid/snow/complex

/obj/structure/closet/supplypod/complexpod
	name = "Syndicate Assault Pod"
	desc = "A specialised, blood-red styled pod for delivering operatives into mission areas."
	specialised = TRUE
	style = /datum/pod_style/syndicate
	bluespace = TRUE
	explosionSize = list(0,0,1,2)
	delays = list(POD_TRANSIT = 25, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	stay_after_drop = TRUE

/obj/item/paper/fluff/awaymissions/complex/syndicate_briefing
	name = "mission briefing"
	default_raw_text = {"<b>Mission Details</b>:
	<br>
	<br>You have been assigned to a newly constructed listening post constructed right next to a AGR Nanotrasen Facility to monitor their xenoarcheology operations.
	<br>Accurate intel is crucial to the success of our operatives, do not fail us.
	<br>
	<br>You may view intelligence reports from your predecessors in the filing cabinet in your office.
	"}

/obj/item/ammo_casing/c10mm/spent
	projectile_type = null

/obj/item/ammo_casing/c9mm/spent
	projectile_type = null

/obj/item/ammo_casing/c46x30mm/spent
	projectile_type = null

/obj/item/ammo_casing/a50ae/spent
	projectile_type = null

/obj/item/ammo_casing/c9mm/security/spent
	projectile_type = null

/obj/machinery/camera/autoname/complex
	name = "Complex Camera"
	desc = "A heavily frosted camera. Perhaps you should smile and wave to it."
	network = list("Complex")
	use_power = NO_POWER_USE
	start_active = TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/camera/autoname/complex, 0)

/obj/machinery/camera/preset/complex
	name = "Complex Camera"
	desc = "A heavily frosted camera. Perhaps you should smile and wave to it."
	network = list("Complex")
	use_power = NO_POWER_USE
	start_active = TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/camera/preset/complex, 0)

/obj/machinery/computer/security/complex
	name = "facility monitoring console"
	desc = "A camera console used to monitor the various facilities of the A.G.R. Complex."
	network = list("complex")
	circuit = null

/obj/item/storage/belt/security/redsec/full/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/melee/baton/security/loaded(src)
	update_appearance()

/obj/structure/closet/secure_closet/complex_security
	name = "security officer's locker"
	icon = 'icons/obj/storage/closet.dmi'
	icon_state = "sec"
	req_access = list(ACCESS_BRIG)

/obj/structure/closet/secure_closet/complex_security/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/vest/alt/sec/redsec(src)
	new /obj/item/clothing/head/helmet/sec/redsec(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/radio/headset/headset_sec/alt(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/redsec(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/gloves/tackler(src)
	new /obj/item/storage/belt/security/redsec/full

/obj/item/circuitboard/machine/rdserver/complex
	name = "Complex R&D Server"
	build_path = /obj/machinery/rnd/server/complex

/obj/machinery/rnd/server/complex
	name = "\improper Complex R&D Server"
	circuit = /obj/item/circuitboard/machine/rdserver/complex
	req_access = list(ACCESS_SCIENCE)

/datum/techweb/complex
	id = "COMPLEX"
	organization = "Nanotrasen A.G.R. Complex"
	should_generate_points = TRUE

/datum/techweb/complex/New()
	. = ..()
	research_node_id("oldstation_surgery", TRUE, TRUE, FALSE)

/obj/machinery/rnd/server/complex/Initialize(mapload)
	var/datum/techweb/complex_web = locate(/datum/techweb/complex) in SSresearch.techwebs
	stored_research = complex_web
	return ..()

/obj/machinery/rnd/server/complex/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(held_item && istype(held_item, /obj/item/research_notes))
		context[SCREENTIP_CONTEXT_LMB] = "Generate research points"
		return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/rnd/server/complex/examine(mob/user)
	. = ..()

	if(!in_range(user, src) && !isobserver(user))
		return

	. += span_notice("Insert [EXAMINE_HINT("Research Notes")] to generate points.")

/obj/machinery/rnd/server/complex/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(attacking_item, /obj/item/research_notes) && stored_research)
		var/obj/item/research_notes/research_notes = attacking_item
		stored_research.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = research_notes.value))
		playsound(src, 'sound/machines/copier.ogg', 50, TRUE)
		qdel(research_notes)
		return
	return ..()

/obj/effect/light_emitter/complex
	set_luminosity = 8
	set_cap = 2.5
	light_color = "#060606"

/obj/effect/mob_spawn/corpse/human/complex
	name = "Complex Assistant"
	outfit = /datum/outfit/job/assistant/complex

/datum/id_trim/job/assistant/complex
	assignment = "Assistant"
	department_color = COLOR_ASSISTANT_GRAY
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/assistant/complex
	name = "Complex Assistant"
	id_trim = /datum/id_trim/job/assistant/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/coatless
	name = "Coatless - Complex Assistant"
	outfit = /datum/outfit/job/assistant/complex/coatless

/datum/outfit/job/assistant/complex/coatless
	name = "Coatless - Complex Assistant"
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/captain
	name = "Complex Site Manager"
	outfit = /datum/outfit/job/captain/complex

/datum/id_trim/job/captain/complex
	assignment = "Site Manager"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/captain/complex
	name = "Complex Site Manager"
	id_trim = /datum/id_trim/job/captain/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/captain
	head = null
	mask = /obj/item/clothing/mask/gas/atmos/captain
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/head_of_personnel
	name = "Complex Human Resources Officer"
	outfit = /datum/outfit/job/hop/complex

/datum/id_trim/job/head_of_personnel/complex
	assignment = "Human Resources Officer"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/hop/complex
	name = "Complex Human Resources Officer"
	id_trim = /datum/id_trim/job/head_of_personnel/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/hop
	gloves = /obj/item/clothing/gloves/color/black
	head = null
	mask = /obj/item/clothing/mask/gas/alt
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/nanotrasen_consultant
	name = "Complex Nanotrasen Representative"
	outfit = /datum/outfit/job/nanotrasen_consultant/complex

/datum/id_trim/job/nanotrasen_consultant/complex
	assignment = "Nanotrasen Representative"
	department_color = COLOR_CENTCOM_BLUE
	subdepartment_color = COLOR_TEAL

/datum/outfit/job/nanotrasen_consultant/complex
	name = "Complex Nanotrasen Representative"
	id_trim = /datum/id_trim/job/nanotrasen_consultant/complex
	uniform = /obj/item/clothing/under/rank/nanotrasen/commander
	suit = /obj/item/clothing/suit/hooded/wintercoat/nanotrasen/gold
	head = null
	mask = /obj/item/clothing/mask/gas/atmos/nanotrasen
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/bridge_assistant
	name = "Complex Administrative Officer"
	outfit = /datum/outfit/job/bridge_assistant/complex

/datum/id_trim/job/bridge_assistant/complex
	assignment = "Administrative Officer"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/bridge_assistant/complex
	name = "Complex Administrative Officer"
	id_trim = /datum/id_trim/job/bridge_assistant/complex
	uniform = /obj/item/clothing/under/rank/blueshield
	suit = /obj/item/clothing/suit/armor/vest/bridge
	gloves = /obj/item/clothing/gloves/color/black
	head = null
	mask = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/security
	name = "Complex Security Guard"
	outfit = /datum/outfit/job/security/complex

/datum/id_trim/job/security/complex
	assignment = "Security Guard"
	trim_state = "trim_securityofficer"
	department_color = "#DE3A3A"
	subdepartment_color = COLOR_CARGO_BROWN
	sechud_icon_state = SECHUD_SECURITY_OFFICER
	minimal_access = list(
		ACCESS_BRIG,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COURT,
		ACCESS_MECH_SECURITY,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
		)
	extra_access = list(
		ACCESS_DETECTIVE,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MORGUE,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOS,
		)
	job = /datum/job/security_officer

/datum/outfit/job/security/complex
	name = "Complex Security Guard"
	head = null
	id_trim = /datum/id_trim/job/security/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/redsec
	uniform = /obj/item/clothing/under/rank/security/officer/redsec
	suit_store = null
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/redsec
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	belt = /obj/item/storage/belt/security/redsec/full
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	backpack = /obj/item/storage/backpack/security/redsec

/obj/effect/mob_spawn/corpse/human/complex/security/armored
	name = "Complex Armored Security Guard"
	outfit = /datum/outfit/job/security/complex/armored

/datum/outfit/job/security/complex/armored
	name = "Complex Armored Security Guard"
	head = /obj/item/clothing/head/helmet/sec/redsec
	suit = /obj/item/clothing/suit/armor/vest/alt/sec/redsec
	shoes = /obj/item/clothing/shoes/jackboots/sec/redsec

/obj/effect/mob_spawn/corpse/human/complex/security/riot
	name = "Complex Riot Security Guard"
	outfit = /datum/outfit/job/security/complex/riot

/datum/outfit/job/security/complex/riot
	name = "Complex Riot Security Guard"
	head = /obj/item/clothing/head/helmet/toggleable/riot
	suit = /obj/item/clothing/suit/armor/riot
	shoes = /obj/item/clothing/shoes/jackboots/sec/redsec

/obj/effect/mob_spawn/corpse/human/complex/geneticist
	name = "Complex Mutation Researcher"
	outfit = /datum/outfit/job/geneticist/complex

/datum/id_trim/job/geneticist/complex
	assignment = "Mutation Researcher"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/geneticist/complex
	name = "Complex Mutation Researcher"
	id_trim = /datum/id_trim/job/geneticist/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/science/genetics
	uniform = /obj/item/clothing/under/rank/rnd/geneticist/tg
	mask = /obj/item/clothing/mask/gas
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/roboticist
	name = "Complex Robotics Technician"
	outfit = /datum/outfit/job/roboticist/complex

/datum/id_trim/job/roboticist/complex
	assignment = "Robotics Technician"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/roboticist/complex
	name = "Complex Robotics Technician"
	id_trim = /datum/id_trim/job/roboticist/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/science/robotics
	uniform = /obj/item/clothing/under/rank/rnd/roboticist/tg
	mask = /obj/item/clothing/mask/gas/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = /obj/item/storage/belt/utility/full/engi

/obj/effect/mob_spawn/corpse/human/complex/engineer
	name = "Complex Technician"
	outfit = /datum/outfit/job/engineer/complex

/datum/id_trim/job/station_engineer/complex
	assignment = "Technician"
	department_color = COLOR_ENGINEERING_ORANGE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/engineer/complex
	name = "Complex Technician"
	id_trim = /datum/id_trim/job/station_engineer/complex
	head = null
	suit = /obj/item/clothing/suit/hooded/wintercoat/engineering
	mask = /obj/item/clothing/mask/gas/atmos
	gloves = /obj/item/clothing/gloves/color/yellow
	shoes = /obj/item/clothing/shoes/winterboots
	l_pocket = null

/obj/effect/mob_spawn/corpse/human/complex/engineer/coatless
	name = "Coatless - Complex Technician"
	outfit = /datum/outfit/job/engineer/complex/coatless

/datum/outfit/job/engineer/complex/coatless
	name = "Coatless - Complex Technician"
	id_trim = /datum/id_trim/job/station_engineer/complex
	head = /obj/item/clothing/head/utility/hardhat/welding/up
	suit = /obj/item/clothing/suit/hazardvest
	mask = null
	shoes = /obj/item/clothing/shoes/workboots
	l_pocket = null

/obj/effect/mob_spawn/corpse/human/complex/doctor
	name = "Complex Medical Officer"
	outfit = /datum/outfit/job/doctor/complex

/datum/id_trim/job/medical_doctor/complex
	assignment = "Medical Officer"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/doctor/complex
	name = "Complex Medical Officer"
	id_trim = /datum/id_trim/job/medical_doctor/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/medical
	mask = /obj/item/clothing/mask/gas/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/chemist
	name = "Complex Pharmacist"
	outfit = /datum/outfit/job/chemist/complex

/datum/id_trim/job/chemist/complex
	assignment = "Pharmacist"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/chemist/complex
	name = "Complex Pharmacist"
	id_trim = /datum/id_trim/job/chemist/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/medical/chemistry
	mask = /obj/item/clothing/mask/gas/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/doctor/coatless
	name = "Coatless - Complex Medical Officer"
	outfit = /datum/outfit/job/doctor/complex/coatless

/datum/outfit/job/doctor/complex/coatless
	name = "Coatless - Complex Medical Officer"
	suit = null
	gloves = /obj/item/clothing/gloves/latex/nitrile
	mask = null
	shoes = /obj/item/clothing/shoes/laceup
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/chief_medical_officer
	name = "Complex Medical Director"
	outfit = /datum/outfit/job/cmo/complex

/datum/id_trim/job/chief_medical_officer/complex
	assignment = "Medical Director"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/cmo/complex
	name = "Complex Medical Director"
	id_trim = /datum/id_trim/job/chief_medical_officer/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/medical/cmo
	mask = /obj/item/clothing/mask/gas/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/laceup
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/prisoner
	name = "Complex Convict"
	outfit = /datum/outfit/job/prisoner/complex

/datum/id_trim/job/prisoner/complex
	assignment = "Convict"
	department_color = COLOR_PRISONER_BLACK
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/prisoner/complex
	name = "Complex Convict"
	id_trim = /datum/id_trim/job/prisoner/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat
	mask = /obj/item/clothing/mask/breath
	gloves = /obj/item/clothing/gloves/color/orange
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/prisoner/coatless
	name = "Coatless - Complex Convict"
	outfit = /datum/outfit/job/prisoner/complex/coatless

/datum/outfit/job/prisoner/complex/coatless
	name = "Coatless - Complex Convict"
	suit = null
	mask = null
	gloves = null

/obj/effect/mob_spawn/corpse/human/complex/botanist
	name = "Complex Hydroponicist"
	outfit = /datum/outfit/job/botanist/complex

/datum/id_trim/job/botanist/complex
	assignment = "Hydroponicist"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME

/datum/outfit/job/botanist/complex
	name = "Complex Hydroponicist"
	id_trim = /datum/id_trim/job/botanist/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/hydro
	mask = /obj/item/clothing/mask/gas/glass
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/botanist/coatless
	name = "Coatless - Complex Hydroponicist"
	outfit = /datum/outfit/job/cargo_tech/complex/coatless

/datum/outfit/job/botanist/complex/coatless
	name = "Coatless - Complex Hydroponicist"
	suit = /obj/item/clothing/suit/apron/overalls
	mask = null
	shoes = /obj/item/clothing/shoes/sneakers/black

/obj/effect/mob_spawn/corpse/human/complex/cargo_tech
	name = "Complex Logistics Specialist"
	outfit = /datum/outfit/job/cargo_tech/complex

/datum/id_trim/job/cargo_technician/complex
	assignment = "Logistics Specialist"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/cargo_tech/complex
	name = "Complex Logistics Specialist"
	id_trim = /datum/id_trim/job/cargo_technician/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/cargo
	mask = /obj/item/clothing/mask/gas/glass
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/cargo_tech/coatless
	name = "Coatless - Complex Logistics Specialist"
	outfit = /datum/outfit/job/cargo_tech/complex/coatless

/datum/outfit/job/cargo_tech/complex/coatless
	name = "Coatless - Complex Logistics Specialist"
	suit = null
	gloves = null
	mask = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/shaft_miner
	name = "Complex Mining Officer"
	outfit = /datum/outfit/job/miner/complex

/datum/id_trim/job/shaft_miner/complex
	assignment = "Mining Officer"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/miner/complex
	name = "Complex Mining Officer"
	id_trim = /datum/id_trim/job/shaft_miner/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/miner
	uniform = /obj/item/clothing/under/rank/cargo/miner
	mask = /obj/item/clothing/mask/gas/explorer
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/quartermaster
	name = "Complex Logistics Director"
	outfit = /datum/outfit/job/quartermaster/complex

/datum/id_trim/job/quartermaster/complex
	assignment = "Logistics Director"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/quartermaster/complex
	name = "Complex Logistics Director"
	id_trim = /datum/id_trim/job/quartermaster/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/cargo/qm
	mask = /obj/item/clothing/mask/gas/glass
	gloves = /obj/item/clothing/gloves/color/black
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = null

/obj/effect/mob_spawn/corpse/human/complex/scientist
	name = "Complex Research Officer"
	outfit = /datum/outfit/job/scientist/complex

/datum/id_trim/job/scientist/complex
	assignment = "Research Officer"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_CARGO_BROWN

/datum/outfit/job/scientist/complex
	name = "Complex Research Officer"
	id_trim = /datum/id_trim/job/scientist/complex
	suit = /obj/item/clothing/suit/hooded/wintercoat/science
	uniform = /obj/item/clothing/under/rank/rnd/scientist/tg
	mask = /obj/item/clothing/mask/gas
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/winterboots
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/scientist/coatless
	name = "Coatless - Complex Research Officer"
	outfit = /datum/outfit/job/scientist/complex/coatless

/datum/outfit/job/scientist/complex/coatless
	name = "Coatless - Complex Research Officer"
	suit = null
	mask = null
	gloves = /obj/item/clothing/gloves/latex
	shoes = /obj/item/clothing/shoes/laceup
	belt = null

/obj/effect/mob_spawn/corpse/human/complex/syndicate
	name = "Complex Syndicate"
	outfit = /datum/outfit/syndicatecomplexcorpse

/datum/id_trim/syndicate/complex
	assignment = "Syndicate Assault Operative"
	trim_state = "trim_syndicate"
	department_color = COLOR_SYNDIE_RED
	subdepartment_color = COLOR_SYNDIE_RED_HEAD
	sechud_icon_state = SECHUD_SYNDICATE

/datum/outfit/syndicatecomplexcorpse
	name = "Complex Syndicate Operative Corpse"
	uniform = /obj/item/clothing/under/syndicate/skyrat/tactical
	suit = /obj/item/clothing/suit/hooded/wintercoat/skyrat/syndicate
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	neck = /obj/item/clothing/neck/large_scarf/syndie
	glasses = /obj/item/clothing/glasses/cold
	gloves = /obj/item/clothing/gloves/combat
	ears =  /obj/item/radio/headset/syndicate/alt
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/storage/backpack/satchel/sec/redsec
	belt = /obj/item/storage/belt/military
	id = /obj/item/card/id/advanced/chameleon/black
	id_trim = /datum/id_trim/syndicate/complex

/obj/effect/mob_spawn/corpse/human/complex/syndicate/captain
	name = "Complex Syndicate Captain"
	outfit = /datum/outfit/syndicatecomplexcaptaincorpse

/datum/id_trim/syndicate/complex/captain
	assignment = "Syndicate Assault Captain"
	trim_state = "trim_captain"
	department_color = COLOR_SYNDIE_RED_HEAD
	subdepartment_color = COLOR_SYNDIE_RED_HEAD
	sechud_icon_state = SECHUD_SYNDICATE

/datum/outfit/syndicatecomplexcaptaincorpse
	name = "Complex Syndicate Captain Corpse"
	uniform = /obj/item/clothing/under/syndicate/skyrat/tactical
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/syndicate/winter
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	neck = /obj/item/clothing/neck/large_scarf/syndie
	glasses = /obj/item/clothing/glasses/cold
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/syndicate/alt/leader
	mask = /obj/item/clothing/mask/gas/syndicate
	head = /obj/item/clothing/head/hats/hos/cap/syndicate
	back = /obj/item/storage/backpack/satchel/sec/redsec
	id = /obj/item/card/id/advanced/chameleon/elite/black
	id_trim = /datum/id_trim/syndicate/complex/captain

/obj/effect/mob_spawn/corpse/human/complex/syndicate/comms
	name = "Complex Syndicate Comms"
	outfit = /datum/outfit/syndicatecomplexcommscorpse

/datum/id_trim/syndicate/complex/comms
	assignment = "Syndicate Communications Agent"
	trim_state = "trim_syndicate"
	department_color = COLOR_SYNDIE_RED
	subdepartment_color = COLOR_SOFT_RED
	sechud_icon_state = SECHUD_SYNDICATE

/datum/outfit/syndicatecomplexcommscorpse
	name = "Complex Syndicate Comms Agent Corpse"
	uniform = /obj/item/clothing/under/syndicate/coldres
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/combat/coldres
	neck = /obj/item/clothing/neck/large_scarf/syndie
	glasses = /obj/item/clothing/glasses/cold
	gloves = /obj/item/clothing/gloves/combat
	ears =  /obj/item/radio/headset/syndicate/alt
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/beret/sec/syndicate
	back = /obj/item/storage/backpack/satchel/sec/redsec
	belt = /obj/item/storage/belt/utility/syndicate
	id = /obj/item/card/id/advanced/chameleon/black
	id_trim = /datum/id_trim/syndicate/complex/comms

/// Syndicate winter troopers
/mob/living/basic/trooper/syndicate/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/melee/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	r_hand = /obj/item/knife/combat/survival
	loot = list(/obj/item/knife/combat/survival)
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/melee/sword/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	r_hand = /obj/item/melee/energy/sword/saber/red
	loot = list(/obj/item/melee/energy/sword/saber/red)
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/ranged/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	loot = list(/obj/item/gun/ballistic/automatic/pistol/clandestine)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/clandestine
	casingtype = /obj/item/ammo_casing/c10mm
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/ranged/smg/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	loot = list(/obj/item/gun/ballistic/automatic/c20r/unrestricted)
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	projectilesound = 'sound/items/weapons/gun/smg/shot.ogg'
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/ranged/shotgun/complex
	name = "Syndicate Winter Operative"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate
	loot = list(/obj/item/gun/ballistic/shotgun/bulldog/unrestricted)
	r_hand = /obj/item/gun/ballistic/shotgun/bulldog/unrestricted
	projectilesound = 'sound/items/weapons/gun/shotgun/shot_alt.ogg'
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/ranged/complex/comms
	name = "Syndicate Comms Agent"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate/comms
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate/comms
	loot = list(/obj/item/gun/ballistic/revolver/badass)
	r_hand = /obj/item/gun/ballistic/revolver/badass
	casingtype = /obj/item/ammo_casing/c357
	projectilesound = 'sound/items/weapons/gun/revolver/shot_alt.ogg'
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/syndicate/ranged/complex/captain
	name = "Syndicate Captain"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/syndicate/captain
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/syndicate/captain
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	r_hand = /obj/item/gun/ballistic/automatic/m90/unrestricted
	casingtype = /obj/item/ammo_casing/a223
	burst_shots = 4
	ranged_cooldown = 3 SECONDS
	projectilesound = 'sound/items/weapons/gun/smg/shot.ogg'
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/complex
	name = "Complex Survivor"
	desc = "An employee of Nanotrasen, apart of the AGR Complex staff who is fighting to survive against the cold, syndicates and the unknown cult."
	faction = list("Complex")
	corpse = /obj/effect/mob_spawn/corpse/human/complex
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex
	death_message = "seizes up and falls limp, their eyes dead and lifeless..."
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0

/mob/living/basic/trooper/complex/ranged
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911)
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged
	r_hand = /obj/item/gun/ballistic/automatic/pistol/m1911
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c45
	var/projectiletype = null
	/// Sound to play when firing weapon
	var/projectilesound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'
	/// number of burst shots
	var/burst_shots = 1
	/// Time between taking shots
	var/ranged_cooldown = 1 SECONDS

/mob/living/basic/trooper/complex/ranged/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_type = projectiletype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)

/mob/living/basic/trooper/complex/ranged/gp9
	loot = list(/obj/item/gun/ballistic/automatic/pistol/sec_glock)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/sec_glock
	casingtype = /obj/item/ammo_casing/c9mm
	projectilesound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'

/mob/living/basic/trooper/complex/ranged/ansem
	loot = list(/obj/item/gun/ballistic/automatic/pistol/clandestine)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/clandestine
	casingtype = /obj/item/ammo_casing/c10mm

/mob/living/basic/trooper/complex/ranged/chemist
	name = "Complex Chemist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/chemist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/chemist
	loot = list(/obj/item/gun/syringe)
	r_hand = /obj/item/gun/syringe
	casingtype = null
	projectiletype = /obj/projectile/bullet/dart/syringe/sulfonal
	projectilesound = 'sound/items/syringeproj.ogg'
	ranged_cooldown = 6 SECONDS

/obj/projectile/bullet/dart/syringe/sulfonal
	name = "sulfonal syringe"
	icon_state = "syringeproj"

/obj/projectile/bullet/dart/syringe/sulfonal/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/toxin/sulfonal, 15)

/mob/living/basic/trooper/complex/security
	name = "Complex Security"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security
	maxHealth = 150
	health = 150
	death_sound = 'sound/items/sec_hailer/sec_death.ogg'

/mob/living/basic/trooper/complex/security/survivor
	name = "Complex Security"
	desc = "An employee of Nanotrasen, apart of the AGR Complex staff, one of the only ones who actually made it out alive."

/mob/living/basic/trooper/complex/security/survivor/Initialize(mapload)
	. = ..()
	var/datum/callback/retaliate_callback = CALLBACK(src, PROC_REF(ai_retaliate_behaviour))
	AddComponent(/datum/component/ai_retaliate_advanced, retaliate_callback)

/mob/living/basic/trooper/complex/security/survivor/proc/ai_retaliate_behaviour(mob/living/attacker)
	if (!istype(attacker))
		return
	for (var/mob/living/basic/trooper/complex/security/survivor/potential_trooper in oview(src, 7))
		potential_trooper.ai_controller.insert_blackboard_key_lazylist(BB_BASIC_MOB_RETALIATE_LIST, attacker)

/mob/living/basic/trooper/complex/security/armored
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security/armored
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security/armored
	maxHealth = 175
	health = 175

/mob/living/basic/trooper/complex/security/riot
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security/riot
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security/riot
	maxHealth = 200
	health = 200

/mob/living/basic/trooper/complex/security/baton
	loot = list(/obj/item/melee/baton/security/loaded)
	attack_verb_continuous = "batons"
	attack_verb_simple = "stunned"
	attack_sound = 'sound/items/weapons/egloves.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baton/security/loaded
	melee_damage_lower = 30
	melee_damage_upper = 30
	melee_damage_type = STAMINA

/mob/living/basic/trooper/complex/security/armored/baton
	loot = list(/obj/item/melee/baton/security/loaded)
	attack_verb_continuous = "batons"
	attack_verb_simple = "stunned"
	attack_sound = 'sound/items/weapons/egloves.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baton/security/loaded
	melee_damage_lower = 30
	melee_damage_upper = 30
	melee_damage_type = STAMINA

/mob/living/basic/trooper/complex/security/riot/baton
	loot = list(/obj/item/shield/riot, /obj/item/melee/baton/security/loaded)
	attack_verb_continuous = "batons"
	attack_verb_simple = "stunned"
	attack_sound = 'sound/items/weapons/egloves.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baton/security/loaded
	l_hand = /obj/item/shield/riot
	melee_damage_lower = 30
	melee_damage_upper = 30
	var/projectile_deflect_chance = 50
	melee_damage_type = STAMINA

/mob/living/basic/trooper/complex/ranged/security
	name = "Complex Security"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security
	loot = list(/obj/item/gun/ballistic/automatic/pistol/sec_glock)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/sec_glock
	casingtype = /obj/item/ammo_casing/c9mm
	maxHealth = 150
	health = 150
	projectilesound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'
	death_sound = 'sound/items/sec_hailer/sec_death.ogg'

/mob/living/basic/trooper/complex/ranged/security/disabler
	loot = list(/obj/item/gun/energy/disabler)
	r_hand = /obj/item/gun/energy/disabler
	casingtype = null
	projectiletype = /obj/projectile/beam/disabler
	projectilesound = 'sound/items/weapons/taser2.ogg'
	ranged_cooldown = 1.5 SECONDS
	burst_shots = 2

/mob/living/basic/trooper/complex/ranged/security/smg
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	loot = list(/obj/item/gun/ballistic/automatic/wt550)
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	casingtype = /obj/item/ammo_casing/c46x30mm
	ranged_cooldown = 3 SECONDS
	burst_shots = 3
	projectilesound = 'sound/items/weapons/gun/smg/shot.ogg'

/mob/living/basic/trooper/complex/ranged/security/smg/disabler
	loot = list(/obj/item/gun/energy/disabler/smg)
	r_hand = /obj/item/gun/energy/disabler/smg
	casingtype = null
	projectiletype = /obj/projectile/beam/disabler/weak
	projectilesound = 'sound/items/weapons/taser3.ogg'
	ranged_cooldown = 6 SECONDS
	burst_shots = 12

/mob/living/basic/trooper/complex/ranged/security/shotgun
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/shotgunner
	loot = list(/obj/item/gun/ballistic/shotgun/lethal)
	r_hand = /obj/item/gun/ballistic/shotgun/lethal
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/items/weapons/gun/shotgun/shot.ogg'

/mob/living/basic/trooper/complex/ranged/security/armored
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security/armored
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security/armored
	loot = list(/obj/item/gun/ballistic/automatic/pistol/sec_glock)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/sec_glock
	casingtype = /obj/item/ammo_casing/c9mm
	maxHealth = 175
	health = 175
	projectilesound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'

/mob/living/basic/trooper/complex/ranged/security/armored/disabler
	loot = list(/obj/item/gun/energy/disabler)
	r_hand = /obj/item/gun/energy/disabler
	casingtype = null
	projectiletype = /obj/projectile/beam/disabler
	projectilesound = 'sound/items/weapons/taser2.ogg'
	ranged_cooldown = 1.5 SECONDS
	burst_shots = 2

/mob/living/basic/trooper/complex/ranged/security/armored/smg
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	loot = list(/obj/item/gun/ballistic/automatic/wt550)
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	casingtype = /obj/item/ammo_casing/c46x30mm
	ranged_cooldown = 3 SECONDS
	burst_shots = 3
	projectilesound = 'sound/items/weapons/gun/smg/shot.ogg'

/mob/living/basic/trooper/complex/ranged/security/armored/smg/disabler
	loot = list(/obj/item/gun/energy/disabler/smg)
	r_hand = /obj/item/gun/energy/disabler/smg
	casingtype = null
	projectiletype = /obj/projectile/beam/disabler/weak
	projectilesound = 'sound/items/weapons/taser3.ogg'
	ranged_cooldown = 6 SECONDS
	burst_shots = 12

/mob/living/basic/trooper/complex/ranged/security/armored/shotgun
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/shotgunner
	loot = list(/obj/item/gun/ballistic/shotgun/lethal)
	r_hand = /obj/item/gun/ballistic/shotgun/lethal
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/items/weapons/gun/shotgun/shot.ogg'

/mob/living/basic/trooper/complex/ranged/security/riot
	corpse = /obj/effect/mob_spawn/corpse/human/complex/security/riot
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/security/riot
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/shotgunner
	loot = list(/obj/item/gun/ballistic/shotgun/riot)
	r_hand = /obj/item/gun/ballistic/shotgun/riot
	casingtype = /obj/item/ammo_casing/shotgun/rubbershot
	maxHealth = 200
	health = 200
	projectilesound = 'sound/items/weapons/gun/shotgun/shot.ogg'

/mob/living/basic/trooper/complex/prisoner
	name = "Complex Convict"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/prisoner
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/prisoner
	faction = list("Complex_Prisoner")

/mob/living/basic/trooper/complex/prisoner/spear
	loot = list(/obj/item/spear)
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stabbed"
	melee_damage_lower = 18
	melee_damage_upper = 18
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/spear

/mob/living/basic/trooper/complex/prisoner/baseball_bat
	loot = list(/obj/item/melee/baseball_bat)
	attack_verb_continuous = "whacks"
	attack_verb_simple = "battered"
	melee_damage_lower = 12
	melee_damage_upper = 12
	attack_sound = 'sound/items/weapons/genhit1.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baseball_bat

/mob/living/basic/trooper/complex/prisoner/shield
	loot = list(/obj/item/shield/riot, /obj/item/melee/baton/security/loaded)
	attack_verb_continuous = "batons"
	attack_verb_simple = "stunned"
	attack_sound = 'sound/items/weapons/egloves.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baton/security/loaded
	l_hand = /obj/item/shield/riot
	melee_damage_lower = 30
	melee_damage_upper = 30
	var/projectile_deflect_chance = 25
	melee_damage_type = STAMINA

/mob/living/basic/trooper/complex/botanist
	name = "Complex Hydroponicist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/botanist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/botanist

/mob/living/basic/trooper/complex/botanist/hatchet
	loot = list(/obj/item/hatchet)
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stabbed"
	melee_damage_lower = 12
	melee_damage_upper = 12
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/hatchet

/mob/living/basic/trooper/complex/botanist/baseball_bat
	loot = list(/obj/item/melee/baseball_bat)
	attack_verb_continuous = "whacks"
	attack_verb_simple = "battered"
	melee_damage_lower = 12
	melee_damage_upper = 12
	attack_sound = 'sound/items/weapons/genhit1.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/melee/baseball_bat

/mob/living/basic/trooper/complex/cargotech
	name = "Complex Logistics Specialist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/cargo_tech
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/cargo_tech
	loot = list(/obj/item/knife/combat/survival)
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/knife/combat/survival

/mob/living/basic/trooper/complex/scientist
	name = "Complex Scientist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/scientist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/scientist
	loot = list(/obj/item/storage/toolbox/emergency)
	attack_verb_continuous = "robusts"
	attack_verb_simple = "hit"
	attack_sound = 'sound/items/weapons/smash.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/storage/toolbox/emergency

/mob/living/basic/trooper/complex/roboticist
	name = "Complex Roboticist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/roboticist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/roboticist
	loot = list(/obj/item/weldingtool/largetank)
	attack_verb_continuous = "burns"
	attack_verb_simple = "welded"
	attack_sound = 'sound/items/tools/welder.ogg'
	attack_vis_effect = ATTACK_EFFECT_SMASH
	r_hand = /obj/item/weldingtool/largetank

/mob/living/basic/trooper/complex/medical
	name = "Complex Doctor"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/doctor
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/doctor

/mob/living/basic/trooper/complex/medical/circular_saw
	loot = list(/obj/item/circular_saw)
	attack_verb_continuous = "saws"
	attack_verb_simple = "sawed"
	attack_sound = 'sound/items/weapons/circsawhit.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/circular_saw

/mob/living/basic/trooper/complex/medical/scalpel
	loot = list(/obj/item/scalpel)
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stabbed"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/scalpel

/mob/living/basic/trooper/complex/ranged/quartermaster
	name = "Complex Logistics Director"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/quartermaster
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/quartermaster
	maxHealth = 125
	health = 125

/mob/living/basic/trooper/complex/ranged/cargotech
	name = "Complex Logistics Specialist"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/cargo_tech
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/cargo_tech
	loot = list(/obj/item/gun/ballistic/shotgun/bulldog)
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot (up to 72.5 brute) fired in a two-round burst
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/shotgunner
	ranged_cooldown = 4 SECONDS
	burst_shots = 2
	r_hand = /obj/item/gun/ballistic/shotgun/bulldog
	projectilesound = 'sound/items/weapons/gun/shotgun/shot_alt.ogg'

/mob/living/basic/trooper/complex/ranged/captain
	name = "Complex Site Manager"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/captain
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/captain
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	loot = list(/obj/item/gun/ballistic/automatic/pistol/deagle/gold)
	r_hand = /obj/item/gun/ballistic/automatic/pistol/deagle/gold
	casingtype = /obj/item/ammo_casing/c460rowland
	maxHealth = 250
	health = 250
	projectilesound = 'modular_skyrat/modules/modular_weapons/sounds/pistol_heavy.ogg'

/mob/living/basic/trooper/complex/ranged/head_of_personnel
	name = "Complex Human Resources Officer"
	corpse = /obj/effect/mob_spawn/corpse/human/complex/head_of_personnel
	mob_spawner = /obj/effect/mob_spawn/corpse/human/complex/head_of_personnel
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	loot = list(/obj/item/gun/ballistic/automatic/c20r/unrestricted)
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	casingtype = /obj/item/ammo_casing/c45
	ranged_cooldown = 3 SECONDS
	burst_shots = 3
	maxHealth = 200
	health = 200
	projectilesound = 'sound/items/weapons/gun/smg/shot.ogg'

/obj/item/clothing/under/rank/rnd/scientist/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "science"

/obj/item/clothing/under/rank/rnd/scientist/skirt/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "science_skirt"

/obj/item/clothing/under/rank/rnd/roboticist/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "robotics"

/obj/item/clothing/under/rank/rnd/roboticist/skirt/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "robotics_skirt"

/obj/item/clothing/under/rank/rnd/geneticist/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "genetics"

/obj/item/clothing/under/rank/rnd/geneticist/skirt/tg // Putting these here because fuck Skyrat's icons.
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "genetics_skirt"

//Windoor
/obj/machinery/door/window/clockwork
	name = "brass windoor"
	desc = "A thin door with translucent brass paneling."
	icon_state = "clockwork"
	base_state = "clockwork"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/door/window/clockwork/left, 0)

/area/awaymission/complex
	name = "Complex"
	icon = 'icons/area/areas_station.dmi'
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 45

/area/awaymission/complex/exterior
	name = "Complex Tundra Plains"
	icon = 'icons/area/areas_away_missions.dmi'
	icon_state = "away"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	outdoors = TRUE

/area/awaymission/complex/exterior/atmospherics
	name = "Complex Atmos Yard"
	always_unpowered = FALSE
	power_environ = TRUE
	requires_power = FALSE
	outdoors = TRUE

/area/awaymission/complex/exterior/structure
	name = "Complex Structure"
	icon_state = "awaycontent1"
	outdoors = FALSE

/area/awaymission/complex/exterior/lights
	name = "Complex Exterior Lights"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "commons"
	always_unpowered = FALSE
	power_light = TRUE
	requires_power = FALSE
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/artillery
	name = "Security Facility Artillery Yard Lights"
	icon_state = "security"
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/prison
	name = "Security Facility Prison Yard Lights"
	icon_state = "sec_prison"
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/complex
	name = "Complex Path Lights"
	icon_state = "commons"
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/storage
	name = "Storage Station Exterior Lights"
	icon_state = "commons"
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/power
	name = "Power Station Exterior Lights"
	icon_state = "commons"
	outdoors = TRUE

/area/awaymission/complex/exterior/lights/outpost
	name = "Nanotrasen Outpost Exterior Lights"
	icon_state = "commons"
	outdoors = TRUE

/area/awaymission/complex/cave
	name = "Complex Caves"
	icon = 'icons/area/areas_away_missions.dmi'
	icon_state = "awaycontent15"
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/cave/botany
	name = "Complex Hydroponics Cave"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "hydro"
	always_unpowered = FALSE
	power_equip = TRUE
	requires_power = FALSE

/area/awaymission/complex/cave/mountain
	name = "Complex Mountains"
	icon_state = "awaycontent24"

/area/awaymission/complex/powerstation
	name = "Power Substation"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "engie_power"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/storagestation
	name = "Storage Substation"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "engine_storage"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/storagestation/garage
	name = "Storage Substation Garage"

/area/awaymission/complex/stronghold
	name = "Cult Stronghold"
	icon = 'icons/area/areas_away_missions.dmi'
	icon_state = "awaycontent8"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/cabin
	name = "Abandoned Cabin"
	icon_state = "commons"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/outpost
	name = "Nanotrasen Outpost"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "gateway"

/area/awaymission/complex/outpost/lounge
	name = "Outpost Lounge"
	icon_state = "lounge"

/area/awaymission/complex/outpost/supply
	name = "Outpost Storage"
	icon_state = "mining_storage"

/area/awaymission/complex/outpost/barracks
	name = "Outpost Barracks"
	icon_state = "dorms"

/area/awaymission/complex/outpost/power
	name = "Outpost Power Station"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "power_room"

/area/awaymission/complex/custodfacility
	name = "Custodial Facility"
	icon_state = "janitor"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/custodfacility/power
	name = "Custodial Facility Power Station"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "power_room"

/area/awaymission/complex/custodfacility
	name = "Custodial Facility"
	icon_state = "janitor"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/custodfacility/storage
	name = "Custodial Facility Storage"

/area/awaymission/complex/custodfacility/breakroom
	name = "Custodial Facility Break Room"

/area/awaymission/complex/custodfacility/hazardous
	name = "Custodial Facility Hazardous Disposal"

/area/awaymission/complex/custodfacility/disposal
	name = "Custodial Facility Waste Disposal"

/area/awaymission/complex/custodfacility/lights
	name = "Custodial Facility Exterior Lights"
	icon_state = "commons"
	always_unpowered = FALSE
	power_light = TRUE
	requires_power = FALSE

/area/awaymission/complex/hydrofacility
	name = "Hydroponics Facility"
	icon_state = "hydro"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/hydrofacility/power
	name = "Hydroponics Facility Power Station"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "power_room"

/area/awaymission/complex/hydrofacility/growroom
	name = "Hydroponics Facility Growroom 1"
	icon_state = "garden"

/area/awaymission/complex/hydrofacility/growroom2
	name = "Hydroponics Facility Growroom 2"
	icon_state = "garden"

/area/awaymission/complex/hydrofacility/breakroom
	name = "Hydroponics Facility Break Room"

/area/awaymission/complex/hydrofacility/equip
	name = "Hydroponics Facility Equipment Storage"

/area/awaymission/complex/hydrofacility/freezer
	name = "Hydroponics Facility Produce Freezer"

/area/awaymission/complex/engfacility
	name = "Engineering Facility Office"
	icon_state = "engie"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/engfacility/smes
	name = "Engineering Facility SMES Foyer"
	icon_state = "engine_smes"

/area/awaymission/complex/engfacility/breakroom
	name = "Engineering Facility Break Room"
	icon_state = "engine_break"

/area/awaymission/complex/engfacility/atmos
	name = "Engineering Facility Atmospherics"
	icon_state = "atmos"

/area/awaymission/complex/engfacility/solar
	name = "Engineering Facility Solar Control Room"
	icon_state = "panels"

/area/awaymission/complex/engfacility/security
	name = "Engineering Facility Security Post"
	icon_state = "checkpoint_engi"

/area/awaymission/complex/engfacility/telecomms
	name = "Engineering Facility Telecommunications Office"
	icon_state = "tcomsatcomp"

/area/awaymission/complex/engfacility/telecomms/server
	name = "Engineering Facility Telecommunications Server Room"
	icon_state = "tcomsatcham"

/area/awaymission/complex/engfacility/storage
	name = "Engineering Facility Equipment Storage"
	icon_state = "engine_storage_shared"

/area/awaymission/complex/engfacility/storage/secure
	name = "Engineering Facility Secure Storage"
	icon_state = "engine_storage"

/area/awaymission/complex/engfacility/storage/tech
	name = "Engineering Facility Tech Storage"
	icon_state = "tech_storage"

/area/awaymission/complex/engfacility/directoroffice
	name = "Engineering Facility Engineering Director's Office"
	icon_state = "ce_office"

/area/awaymission/complex/secfacility
	name = "Security Facility Hallway"
	icon_state = "brig"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/secfacility/lobby
	name = "Security Facility Lobby"
	icon_state = "brigentry"

/area/awaymission/complex/secfacility/power
	name = "Security Facility Power Station"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "power_room"

/area/awaymission/complex/secfacility/power/prison
	name = "Security Facility Prison Wing Power Station"

/area/awaymission/complex/secfacility/processing
	name = "Security Facility Processing Office"
	icon_state = "sec_labor_processing"

/area/awaymission/complex/secfacility/medical
	name = "Security Facility Medical Post"
	icon_state = "security_medical"

/area/awaymission/complex/secfacility/execution
	name = "Security Facility Transfer Center"
	icon_state = "execution_room"

/area/awaymission/complex/secfacility/office
	name = "Security Facility Main Office"
	icon_state = "security"

/area/awaymission/complex/secfacility/warden
	name = "Security Facility Control Office"
	icon_state = "warden"

/area/awaymission/complex/secfacility/breakroom
	name = "Security Facility Break Room"
	icon_state = "brig"

/area/awaymission/complex/secfacility/detective
	name = "Security Facility Detective's Office"
	icon_state = "detective"

/area/awaymission/complex/secfacility/evidence
	name = "Security Facility Evidence Lockup"
	icon_state = "evidence"

/area/awaymission/complex/secfacility/mechbay
	name = "Security Facility Mechbay"
	icon_state = "sec_mechbay"

/area/awaymission/complex/secfacility/artillery
	name = "Security Facility Artillery Control Room"
	icon_state = "brig"

/area/awaymission/complex/secfacility/garage
	name = "Security Facility Garage"
	icon_state = "brig"

/area/awaymission/complex/secfacility/armory
	name = "Security Facility Armory"
	icon_state = "armory"

/area/awaymission/complex/secfacility/directoroffice
	name = "Security Facility Security Director's Office"
	icon_state = "hos_office"

/area/awaymission/complex/secfacility/prison
	name = "Security Facility Prison Wing"
	icon_state = "sec_prison"

/area/awaymission/complex/secfacility/prison/laundry
	name = "Security Facility Prison Laundry Room"
	icon_state = "sec_prison"

/area/awaymission/complex/secfacility/prison/kitchen
	name = "Security Facility Prison Kitchen"
	icon_state = "prison_mess"

/area/awaymission/complex/secfacility/prison/hydroponics
	name = "Security Facility Prison Hydroponics"
	icon_state = "prison_garden"

/area/awaymission/complex/secfacility/prison/workshop
	name = "Security Facility Prison Workshop"
	icon_state = "prison_work"

/area/awaymission/complex/secfacility/prison/shower
	name = "Security Facility Prison Showers"
	icon_state = "prison_shower"

/area/awaymission/complex/mainfacility
	name = "Main Facility Hallway"
	icon_state = "commons"
	requires_power = TRUE
	static_lighting = TRUE
	base_lighting_alpha = 0

/area/awaymission/complex/mainfacility/tram
	name = "Main Facility Tram Station"
	icon_state = "halltramM"

/area/awaymission/complex/mainfacility/lounge
	name = "Main Facility Lounge"
	icon_state = "lounge"

/area/awaymission/complex/mainfacility/kitchen
	name = "Main Facility Kitchen"
	icon_state = "kitchen"

/area/awaymission/complex/mainfacility/dorms
	name = "Main Facility Dormitories"
	icon_state = "dorms"

/area/awaymission/complex/mainfacility/dorms/dorm1
	name = "Main Facility Barracks 1"
	icon_state = "room1"

/area/awaymission/complex/mainfacility/dorms/dorm2
	name = "Main Facility Barracks 2"
	icon_state = "room2"

/area/awaymission/complex/mainfacility/dorms/laundry
	name = "Main Facility Laundry Room"
	icon_state = "laundry_room"

/area/awaymission/complex/mainfacility/dorms/pool
	name = "Main Facility Pool Room"
	icon_state = "pool"

/area/awaymission/complex/mainfacility/security_west
	name = "Main Facility West Security Post"
	icon_state = "checkpoint"

/area/awaymission/complex/mainfacility/security_east
	name = "Main Facility East Security Post"
	icon_state = "checkpoint"

/area/awaymission/complex/mainfacility/admin
	name = "Main Facility Administration"
	icon_state = "command"

/area/awaymission/complex/mainfacility/admin/hop
	name = "Main Facility Human Resources Officer's Office"
	icon_state = "hop_office"

/area/awaymission/complex/mainfacility/admin/cap
	name = "Main Facility Site Manager's Office"
	icon_state = "captain"

/area/awaymission/complex/mainfacility/admin/office
	name = "Main Facility Administrative Office"

/area/awaymission/complex/mainfacility/admin/nt_rep
	name = "Main Facility Nanotrasen Representative's Office"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "nt_rep"

/area/awaymission/complex/mainfacility/power
	name = "Main Facility Power Station"
	icon = 'modular_skyrat/modules/mapping/icons/areas/areas_station.dmi'
	icon_state = "power_room"

/area/awaymission/complex/mainfacility/cargo
	name = "Main Facility Logistics Department"
	icon_state = "cargo_bay"

/area/awaymission/complex/mainfacility/cargo/lobby
	name = "Main Facility Logistics Department Lobby"
	icon_state = "cargo_lobby"

/area/awaymission/complex/mainfacility/cargo/office
	name = "Main Facility Logistics Office"
	icon_state = "cargo_office"

/area/awaymission/complex/mainfacility/cargo/warehouse
	name = "Main Facility Logistics Warehouse"
	icon_state = "cargo_warehouse"

/area/awaymission/complex/mainfacility/cargo/directoroffice
	name = "Main Facility Logistics Director's Office"
	icon_state = "qm_office"

/area/awaymission/complex/mainfacility/mining
	name = "Main Facility Mining Operations"
	icon_state = "mining_storage"

/area/awaymission/complex/mainfacility/mining/dorms
	name = "Main Facility Mining Lounge"
	icon_state = "mining_breakroom"

/area/awaymission/complex/mainfacility/research
	name = "Main Facility Research Department"
	icon_state = "science"

/area/awaymission/complex/mainfacility/research/rnd
	name = "Main Facility Research and Development"
	icon_state = "science"

/area/awaymission/complex/mainfacility/research/breakroom
	name = "Main Facility Research Breakroom"
	icon_state = "science_breakroom"

/area/awaymission/complex/mainfacility/research/xenoarcheology
	name = "Main Facility Xenoarcheology Lab"

/area/awaymission/complex/mainfacility/research/experiment
	name = "Main Facility Experimenting Lab"
	icon_state = "exp_lab"

/area/awaymission/complex/mainfacility/research/genetics
	name = "Main Facility Genetics Lab"
	icon_state = "geneticssci"

/area/awaymission/complex/mainfacility/research/robotics
	name = "Main Facility Robotics Lab"
	icon_state = "robotics"

/area/awaymission/complex/mainfacility/research/robotics/mechbay
	name = "Main Facility Robotics Lab Mechbay"
	icon_state = "mechbay"

/area/awaymission/complex/mainfacility/research/directoroffice
	name = "Main Facility Research Director's Office"
	icon_state = "rd_office"

/area/awaymission/complex/mainfacility/syndicate
	name = "Complex Syndicate Listening Station"
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "syndie-ship"

/area/awaymission/complex/mainfacility/medical
	name = "Main Facility Medical Department"
	icon_state = "medbay"

/area/awaymission/complex/mainfacility/medical/lobby
	name = "Main Facility Medical Department Lobby"
	icon_state = "med_lobby"

/area/awaymission/complex/mainfacility/medical/treatment
	name = "Main Facility Treatment Center"
	icon_state = "exam_room"

/area/awaymission/complex/mainfacility/medical/storage
	name = "Main Facility Medical Storage"
	icon_state = "med_storage"

/area/awaymission/complex/mainfacility/medical/cryogenics
	name = "Main Facility Medical Cryogenics"
	icon_state = "cryo"

/area/awaymission/complex/mainfacility/medical/office
	name = "Main Facility Medical Office"
	icon_state = "med_office"

/area/awaymission/complex/mainfacility/medical/surgery
	name = "Main Facility Medical Operating Room"
	icon_state = "surgery"

/area/awaymission/complex/mainfacility/medical/virology
	name = "Main Facility Virology Lab"
	icon_state = "virology"

/area/awaymission/complex/mainfacility/medical/practitioner
	name = "Main Facility General Practitioner's Office"
	icon_state = "psychology"

/area/awaymission/complex/mainfacility/medical/pharmacy
	name = "Main Facility Pharmacy Lab"
	icon_state = "pharmacy"

/area/awaymission/complex/mainfacility/medical/directoroffice
	name = "Main Facility Medical Director's Office"
	icon_state = "cmo_office"
