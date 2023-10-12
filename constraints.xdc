# Timing constraints...
# Note: Xilinx IP core constraints will be applied automatically
# when the *.xcix file is added to the project

# define primary clocks...

#create_clock -name adn2814_clk  -period 16.000  [get_ports adn2814_data_p]
#create_clock -name sysclk       -period 10.000  [get_ports sysclk_p]
#create_clock -name gbe_refclk   -period 8.000   [get_ports gbe_refclk_p]
#create_clock -name daq_refclk   -period 8.317   [get_ports daq_refclk_p]

# rename the auto-generated clocks...

create_generated_clock -name local_clk62p5  [get_pins endpoint_inst/mmcm0_inst/CLKOUT0]
#create_generated_clock -name sclk200        [get_pins endpoint_inst/mmcm0_inst/CLKOUT1]
#create_generated_clock -name sclk100        [get_pins endpoint_inst/mmcm0_inst/CLKOUT2]
#create_generated_clock -name mmcm0_clkfbout [get_pins endpoint_inst/mmcm0_inst/CLKFBOUT]

create_generated_clock -name ep_clk62p5      [get_pins endpoint_inst/pdts_endpoint_inst/pdts_endpoint_inst/rxcdr/mmcm/CLKOUT0]
create_generated_clock -name ep_clk4x        [get_pins endpoint_inst/pdts_endpoint_inst/pdts_endpoint_inst/rxcdr/mmcm/CLKOUT1]
create_generated_clock -name ep_clk2x        [get_pins endpoint_inst/pdts_endpoint_inst/pdts_endpoint_inst/rxcdr/mmcm/CLKOUT1]
create_generated_clock -name ep_clkfbout     [get_pins endpoint_inst/pdts_endpoint_inst/pdts_endpoint_inst/rxcdr/mmcm/CLKFBOUT] 

create_generated_clock -name oeiclk [get_pins phy_inst/U0/core_clocking_i/mmcm_adv_inst/CLKOUT0] 
create_generated_clock -name oeihclk [get_pins phy_inst/U0/core_clocking_i/mmcm_adv_inst/CLKOUT1]
create_generated_clock -name oei_clkfbout [get_pins phy_inst/U0/core_clocking_i/mmcm_adv_inst/CLKFBOUT]

#create_generated_clock -name daqclk0      [get_pins core_inst/core_mgt4_inst/daq_quad_inst/U0/gt_usrclk_source/txoutclk_mmcm0_i/mmcm_adv_inst/CLKOUT0]
#create_generated_clock -name daqclk1      [get_pins core_inst/core_mgt4_inst/daq_quad_inst/U0/gt_usrclk_source/txoutclk_mmcm0_i/mmcm_adv_inst/CLKOUT1]
#create_generated_clock -name daq_clkfbout [get_pins core_inst/core_mgt4_inst/daq_quad_inst/U0/gt_usrclk_source/txoutclk_mmcm0_i/mmcm_adv_inst/CLKFBOUT]

create_generated_clock -name fclk0           -master_clock ep_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKOUT0]
create_generated_clock -name mclk0           -master_clock ep_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKOUT1]
create_generated_clock -name mmcm1_clkfbout0 -master_clock ep_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKFBOUT]
create_generated_clock -name fclk1           -master_clock local_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKOUT0]
create_generated_clock -name mclk1           -master_clock local_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKOUT1]
create_generated_clock -name mmcm1_clkfbout1 -master_clock local_clk62p5 [get_pins endpoint_inst/mmcm1_inst/CLKFBOUT]

set_clock_groups -name async_groups -asynchronous \
-group {sysclk sclk100 mmcm0_clkfbout} -group {sclk200} -group {local_clk62p5} \
-group {mclk0 fclk0 mmcm1_clkfbout0} -group {mclk1 fclk1 mmcm1_clkfbout1} \
#-group {oeiclk oeihclk oei_clkfbout} -group {daqclk0 daqclk1 daq_clkfbout} \
-group {ep_clk62p5 ep_clk4x ep_clk2x ep_clkfbout} -group {adn2814_clk} 

# tell vivado about places where signals cross clock domains so timing can be ignored here...

#set_false_path -from [get_pins fe_inst/gen_afe[*].afe_inst/auto_fsm_inst/done_reg_reg/C]      
#set_false_path -from [get_pins fe_inst/gen_afe[*].afe_inst/auto_fsm_inst/warn_reg_reg/C]      
#set_false_path -from [get_pins fe_inst/gen_afe[*].afe_inst/auto_fsm_inst/errcnt_reg_reg[*]/C] 
#set_false_path -from [get_pins trig_gbe*_reg_reg/C] -to [get_pins trig_sync_reg/D]
#set_false_path -to [get_pins led0_reg_reg[*]/C]
#set_false_path -from [get_pins test_reg_reg[*]/C]
#set_false_path -from [get_ports gbe_sfp_??s]
#set_false_path -from [get_ports cdr_sfp_??s]
#set_false_path -from [get_ports daq?_sfp_??s]
#set_false_path -from [get_pins st_enable_reg_reg[*]/C]
#set_false_path -from [get_pins outmode_reg_reg[*]/C]
#set_false_path -from [get_pins threshold_reg_reg[*]/C]
#set_false_path -from [get_pins daq_out_param_reg_reg[*]/C]
#set_false_path -from [get_pins core_inst/input_inst/*select_reg_reg*/C]




















set_property PACKAGE_PIN C3 [get_ports {sysclk_p}]  ;     
set_property PACKAGE_PIN C2 [get_ports {sysclk_n}]   ;    
set_property IOSTANDARD LVDS [get_ports {sysclk_p}];
set_property IOSTANDARD LVDS [get_ports {sysclk_n}];
set_property DIFF_TERM_ADV TERM_100 [get_ports {sysclk_p}];
set_property DIFF_TERM_ADV TERM_100 [get_ports {sysclk_n}];





set_property PACKAGE_PIN AD5 [get_ports {cdr_sfp_tx_p}];
set_property PACKAGE_PIN AD4 [get_ports {cdr_sfp_tx_n}];
set_property PACKAGE_PIN AE5 [get_ports {adn2814_data_p}];
set_property PACKAGE_PIN AF5 [get_ports {adn2814_data_n}];
set_property IOSTANDARD LVDS [get_ports {cdr_sfp_tx_p}];
set_property IOSTANDARD LVDS [get_ports {adn2814_data_p}];
set_property IOSTANDARD LVDS [get_ports {cdr_sfp_tx_n}];
set_property IOSTANDARD LVDS [get_ports {adn2814_data_n}];




set_property PACKAGE_PIN AF10 [get_ports {cdr_sfp_los}];
set_property PACKAGE_PIN AD12 [get_ports {cdr_sfp_tx_dis}];
set_property IOSTANDARD LVTTL [get_ports {cdr_sfp_tx_dis}];
set_property IOSTANDARD LVTTL [get_ports {cdr_sfp_los}];