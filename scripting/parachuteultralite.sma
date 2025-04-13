#include <amxmodx>
#include <reapi>

public plugin_init() {
	register_plugin("Parachute UltraLite", "1.0", "Enobraed");
	RegisterHookChain(RG_PM_AirMove, "PM_AirMove");
}

public PM_AirMove(const id) {
	if (!(get_entvar(id, var_button) & IN_USE) || get_entvar(id, var_waterlevel) > 0) {
		return;
	}

	static Float:vel[3];
	get_entvar(id, var_velocity, vel);

	if (vel[2] < 0.0) {
		vel[2] = (vel[2] + 40.0 < -100.0) ? vel[2] + 40.0 : -100.0;
		set_entvar(id, var_sequence, ACT_WALK);
		set_entvar(id, var_gaitsequence, ACT_IDLE);
		set_pmove(pm_velocity, vel);
		set_movevar(mv_gravity, 80.0);
	}
}