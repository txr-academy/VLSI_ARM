# === Vivado Bitstream & MMI Generation Tcl ===

# Trace / report setup
proc create_report { reportName command } {
    set status "."
    append status $reportName ".fail"
    if { [file exists $status] } {
        eval file delete [glob $status]
    }
    send_msg_id runtcl-4 info "Executing : $command"
    set retval [eval catch { $command } msg]
    if { $retval != 0 } {
        set fp [open $status w]
        close $fp
        send_msg_id runtcl-5 warning "$msg"
    }
}

namespace eval ::optrace {
    variable script "/home/arjun/Vivado_PROJECTS/ARM_XPM_03_sept_2025/AT426-BU-98000-r0p1-00rel0/hardware/m3_for_arty_a7/m3_for_arty_a7/m3_for_arty_a7.runs/impl_1/m3_for_arty_a7_wrapper.tcl"
    variable category "vivado_impl"
}

# Dispatch connection
if {![info exists ::dispatch::connected]} {
    namespace eval ::dispatch {
        variable connected false
        if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
            set result "true"
            if {[catch {
                if {[lsearch -exact [package names] DispatchTcl] < 0} {
                    set result [load librdi_cd_clienttcl[info sharedlibextension]] 
                }
                if {$result eq "false"} {
                    puts "WARNING: Could not load dispatch client library"
                }
                set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
                if { $connect_id eq "" } {
                    puts "WARNING: Could not initialize dispatch client"
                } else {
                    puts "INFO: Dispatch client connection id - $connect_id"
                    set connected true
                }
            } catch_res]} {
                puts "WARNING: failed to connect to dispatch server - $catch_res"
            }
        }
    }
}

# Dummy OPTRACE if dispatch not connected
if {$::dispatch::connected} {
    if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
        rename ::OPTRACE ""
    }
    proc ::OPTRACE { task action {tags {} } } {
        ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
    }
    ::vitis_log::connect_client
} else {
    if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
        proc ::OPTRACE {{arg1 "" } {arg2 ""} {arg3 "" } {arg4 ""} {arg5 ""} {arg6 ""}} {
            # Do nothing
        }
    }
}

# Step helpers
proc start_step { step } {
    set stopFile ".stop.rst"
    if {[file isfile .stop.rst]} {
        puts ""
        puts "*** Halting run - EA reset detected ***"
        puts ""
        return -code error
    }
    set beginFile ".$step.begin.rst"
    set platform "$::tcl_platform(platform)"
    set user "$::tcl_platform(user)"
    set pid [pid]
    set host ""
    if { [string equal $platform unix] } {
        if { [info exist ::env(HOSTNAME)] } {
            set host $::env(HOSTNAME)
        } elseif { [info exist ::env(HOST)] } {
            set host $::env(HOST)
        }
    } else {
        if { [info exist ::env(COMPUTERNAME)] } {
            set host $::env(COMPUTERNAME)
        }
    }
    set ch [open $beginFile w]
    puts $ch "<?xml version=\"1.0\"?>"
    puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
    puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
    puts $ch "    </Process>"
    puts $ch "</ProcessHandle>"
    close $ch
}

proc end_step { step } {
    set endFile ".$step.end.rst"
    set ch [open $endFile w]
    close $ch
}

proc step_failed { step } {
    set endFile ".$step.error.rst"
    set ch [open $endFile w]
    close $ch
    OPTRACE "impl_1" END { }
}

# Suppress unwanted messages
set_msg_config  -id {[BD 41-1306]}  -suppress 
set_msg_config  -id {[BD 41-1271]}  -suppress 

# === Implementation Trace Start ===
OPTRACE "impl_1" START { ROLLUP_1 }

# Phase: Write Bitstream
OPTRACE "Phase: Write Bitstream" START { ROLLUP_AUTO }
OPTRACE "write_bitstream setup" START { }
start_step write_bitstream
set ACTIVE_STEP write_bitstream

set rc [catch {
    create_msg_db write_bitstream.pb
    open_checkpoint m3_for_arty_a7_wrapper_routed.dcp
    set_property webtalk.parent_dir /home/arjun/Vivado_PROJECTS/ARM_XPM_03_sept_2025/AT426-BU-98000-r0p1-00rel0/hardware/m3_for_arty_a7/m3_for_arty_a7.cache/wt [current_project]
    set_property TOP m3_for_arty_a7_wrapper [current_fileset]
    set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]

    # --- MODIFY THIS LINE TO TARGET ITCM INSTANCE ---
    catch { write_mem_info -force -no_partial_mmi \
        -inst_name m3_for_arty_a7_i.Cortex_M3_0.inst.u_x_itcm \
        -memory_name ITCM \
        m3_for_arty_a7_wrapper.mmi }

OPTRACE "write_bitstream setup" END { }

# Write bitstream
OPTRACE "write_bitstream" START { }
write_bitstream -force m3_for_arty_a7_wrapper.bit 
OPTRACE "write_bitstream" END { }

# Misc post-processing
OPTRACE "write_bitstream misc" START { }
catch {write_debug_probes -quiet -force m3_for_arty_a7_wrapper}
catch {file copy -force m3_for_arty_a7_wrapper.ltx debug_nets.ltx}
close_msg_db -file write_bitstream.pb
} RESULT]

if {$rc} {
    step_failed write_bitstream
    return -code error $RESULT
} else {
    end_step write_bitstream
    unset ACTIVE_STEP 
}

OPTRACE "write_bitstream misc" END { }
OPTRACE "Phase: Write Bitstream" END { }
OPTRACE "impl_1" END { }

