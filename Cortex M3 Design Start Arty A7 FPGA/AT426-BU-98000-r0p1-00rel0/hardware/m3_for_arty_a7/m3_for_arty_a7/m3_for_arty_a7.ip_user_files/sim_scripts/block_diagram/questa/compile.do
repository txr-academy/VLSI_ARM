vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/util_vector_logic_v2_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_28
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_26
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/axi_data_fifo_v2_1_25
vlib questa_lib/msim/axi_crossbar_v2_1_27
vlib questa_lib/msim/axi_protocol_converter_v2_1_26
vlib questa_lib/msim/dist_mem_gen_v8_0_13
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/lib_fifo_v1_0_16
vlib questa_lib/msim/axi_quad_spi_v3_2_25
vlib questa_lib/msim/axi_bram_ctrl_v4_1_6
vlib questa_lib/msim/axi_uartlite_v2_0_30
vlib questa_lib/msim/blk_mem_gen_v8_4_5
vlib questa_lib/msim/xlconcat_v2_1_4

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap util_vector_logic_v2_0_2 questa_lib/msim/util_vector_logic_v2_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_28 questa_lib/msim/axi_gpio_v2_0_28
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_26 questa_lib/msim/axi_register_slice_v2_1_26
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_25 questa_lib/msim/axi_data_fifo_v2_1_25
vmap axi_crossbar_v2_1_27 questa_lib/msim/axi_crossbar_v2_1_27
vmap axi_protocol_converter_v2_1_26 questa_lib/msim/axi_protocol_converter_v2_1_26
vmap dist_mem_gen_v8_0_13 questa_lib/msim/dist_mem_gen_v8_0_13
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_fifo_v1_0_16 questa_lib/msim/lib_fifo_v1_0_16
vmap axi_quad_spi_v3_2_25 questa_lib/msim/axi_quad_spi_v3_2_25
vmap axi_bram_ctrl_v4_1_6 questa_lib/msim/axi_bram_ctrl_v4_1_6
vmap axi_uartlite_v2_0_30 questa_lib/msim/axi_uartlite_v2_0_30
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4

vlog -work xpm -64 -incr -mfcu -sv "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"/home/arjun/tool/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/arjun/tool/Vivado/2022.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/arjun/tool/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/arjun/tool/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_clk_wiz_0_0/m3_for_arty_a7_clk_wiz_0_0_clk_wiz.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_clk_wiz_0_0/m3_for_arty_a7_clk_wiz_0_0.v" \

vlog -work util_vector_logic_v2_0_2 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/3d84/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_i_interconnect_aresetn_0/sim/m3_for_arty_a7_i_interconnect_aresetn_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_i_inv_dbgresetn_0/sim/m3_for_arty_a7_i_inv_dbgresetn_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_i_inv_sysresetn1_0/sim/m3_for_arty_a7_i_inv_sysresetn1_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_i_peripheral_aresetn1_0/sim/m3_for_arty_a7_i_peripheral_aresetn1_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_i_sysresetn_or_0/sim/m3_for_arty_a7_i_sysresetn_or_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../../block_diagram/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../../block_diagram/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_proc_sys_reset_DAPLink_0/sim/m3_for_arty_a7_proc_sys_reset_DAPLink_0.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_proc_sys_reset_base_0/sim/m3_for_arty_a7_proc_sys_reset_base_0.vhd" \

vlog -work xlconstant_v1_1_7 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xlconstant_1_0/sim/m3_for_arty_a7_xlconstant_1_0.v" \
"../../../../../block_diagram/ipshared/5fe9/DAPLink_to_Arty_shield.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_DAPLink_to_Arty_shield_0_0/sim/m3_for_arty_a7_DAPLink_to_Arty_shield_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../../block_diagram/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../../block_diagram/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_28 -64 -93 \
"../../../../../block_diagram/ipshared/3ed9/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_gpio_0_1/sim/m3_for_arty_a7_axi_gpio_0_1.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_26 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93 \
"../../../../../block_diagram/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_25 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_27 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/3fa0/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xbar_4/sim/m3_for_arty_a7_xbar_4.v" \

vlog -work axi_protocol_converter_v2_1_26 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_protocol_convert_0_0/sim/m3_for_arty_a7_axi_protocol_convert_0_0.v" \

vlog -work dist_mem_gen_v8_0_13 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/0bf5/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../../block_diagram/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../../block_diagram/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_16 -64 -93 \
"../../../../../block_diagram/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_25 -64 -93 \
"../../../../../block_diagram/ipshared/67dc/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_quad_spi_0_1/sim/m3_for_arty_a7_axi_quad_spi_0_1.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_single_spi_0_0/sim/m3_for_arty_a7_axi_single_spi_0_0.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_xip_quad_spi_0_0/sim/m3_for_arty_a7_axi_xip_quad_spi_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_dap_ahb_ap.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_wic.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_nvic.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_dwt.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/AhbToAxi.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_mpu.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_bus_matrix.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/models.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cmsdk.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_tpiu.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/dapswjdp.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_fpb.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_dpu.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_itm.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cm3_etm.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cortexm3.v" \
"../../../../../block_diagram/ipshared/ea75/rtl/cortexm3_integration.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_Cortex_M3_0_0/sim/m3_for_arty_a7_Cortex_M3_0_0.v" \

vcom -work axi_bram_ctrl_v4_1_6 -64 -93 \
"../../../../../block_diagram/ipshared/3c31/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_bram_ctrl_0_0/sim/m3_for_arty_a7_axi_bram_ctrl_0_0.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_bram_ctrl_1_0/sim/m3_for_arty_a7_axi_bram_ctrl_1_0.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_gpio_0_0/sim/m3_for_arty_a7_axi_gpio_0_0.vhd" \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_gpio_1_0/sim/m3_for_arty_a7_axi_gpio_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xbar_3/sim/m3_for_arty_a7_xbar_3.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xbar_5/sim/m3_for_arty_a7_xbar_5.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_quad_spi_0_0/sim/m3_for_arty_a7_axi_quad_spi_0_0.vhd" \

vcom -work axi_uartlite_v2_0_30 -64 -93 \
"../../../../../block_diagram/ipshared/5d2b/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../../block_diagram/ip/m3_for_arty_a7_axi_uartlite_0_0/sim/m3_for_arty_a7_axi_uartlite_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_blk_mem_gen_0_0/sim/m3_for_arty_a7_blk_mem_gen_0_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_tri_io_buf_0_0/sim/m3_for_arty_a7_tri_io_buf_0_0.v" \

vlog -work xlconcat_v2_1_4 -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../../block_diagram/ipshared/4e49" "+incdir+../../../../../block_diagram/ipshared/ec67/hdl" "+incdir+../../../../../block_diagram/ipshared/ea75/rtl" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xlconcat_0_0/sim/m3_for_arty_a7_xlconcat_0_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xlconcat_1_0/sim/m3_for_arty_a7_xlconcat_1_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_xlconstant_1_1/sim/m3_for_arty_a7_xlconstant_1_1.v" \
"../../../../../block_diagram/sim/m3_for_arty_a7.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_auto_pc_0/sim/m3_for_arty_a7_auto_pc_0.v" \
"../../../../../block_diagram/ip/m3_for_arty_a7_auto_pc_1/sim/m3_for_arty_a7_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

