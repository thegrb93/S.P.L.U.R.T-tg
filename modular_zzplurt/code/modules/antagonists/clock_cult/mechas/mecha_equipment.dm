//should never be outside a mech without an admin
/obj/item/mecha_parts/mecha_equipment/weapon/clock
	name = "clock mech weapon"
	color = rgb(190, 135, 0)
	icon_state = "mecha_laser"
	detachable = FALSE
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/clock/bow_single_shot
	name = "Energy Concentrator"
	desc = "A strange device that concentrates energy into \"arrows\"."
	projectile = /obj/projectile/energy/clockbolt
	equip_cooldown = 1 SECONDS
	energy_drain = 5

/obj/item/mecha_parts/mecha_equipment/repair_droid/clock
	name = "Clockwork Repair Droid"
	desc = "A small device that constantly re-adjusts any out of place gears in a mech."
	color = rgb(190, 135, 0)
	energy_drain = 0 //we will see if an energy drain is needed
	detachable = FALSE
	health_boost = 1 //should really just buff the normal repair droid up to this, its really bad right now
	repairable_damage = list(MECHA_INT_FIRE, MECHA_INT_CONTROL_LOST)

/obj/item/mecha_parts/mecha_equipment/armor/clock
	name = "Clockwork Armor Booster"
	desc = "A large clump of gears that somehow help protect a mech against all forms of attack."
	color = rgb(190, 135, 0)
	detachable = FALSE
	icon_state = "mecha_abooster_proj"
	armor_mod = /datum/armor/mecha_equipment_mixed_boost

/datum/armor/mecha_equipment_mixed_boost
	bullet = 10
	laser = 10
	melee = 15
