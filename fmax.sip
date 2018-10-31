set_global_assignment -entity "fmax" -library "lib_fmax" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fmax" -library "lib_fmax" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "fmax" -library "lib_fmax" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fmax" -name SPD_FILE [file join $::quartus(sip_path) "fmax.spd"]

set_global_assignment -library "lib_fmax" -name MISC_FILE [file join $::quartus(sip_path) "fmax_sim/fmax.vo"]
