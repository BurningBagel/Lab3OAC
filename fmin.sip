set_global_assignment -entity "fmin" -library "lib_fmin" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fmin" -library "lib_fmin" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "fmin" -library "lib_fmin" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fmin" -name SPD_FILE [file join $::quartus(sip_path) "fmin.spd"]

set_global_assignment -library "lib_fmin" -name MISC_FILE [file join $::quartus(sip_path) "fmin_sim/fmin.vo"]
