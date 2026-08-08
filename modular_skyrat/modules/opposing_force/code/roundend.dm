/datum/controller/subsystem/ticker/proc/opfor_report()
	var/list/result = list()

	result += "<span class='header'>Opposing Force Report - Approved: [LAZYLEN(SSopposing_force.approved_applications)], Submitted: [LAZYLEN(SSopposing_force.submitted_applications)]</span><br>" // SPLURT EDIT - Add info about number of applications

	if(!SSopposing_force.approved_applications.len)
		result += span_red("No applications were approved.")
	else
		for(var/datum/opposing_force/opfor in SSopposing_force.approved_applications)
			result += opfor.roundend_report()

	return "<div class='panel stationborder'>[result.Join()]</div>"
