#!/bin/bash

gpu=$(vcgencmd measure_temp)
gt=${gpu#*=}
cpu=$(</sys/class/thermal/thermal_zone0/temp)

arm_clock=$(vcgencmd measure_clock arm)
ac=${arm_clock#*=}
vccore_clock=$(vcgencmd measure_clock core)
vc=${vccore_clock#*=}
isp_clock=$(vcgencmd measure_clock isp)
ic=${isp_clock#*=}
emmc_clock=$(vcgencmd measure_clock emmc)
ec=${emmc_clock#*=}

core_volts=$(vcgencmd measure_volts core)
cv=${core_volts#*=}
ram_volts=$(vcgencmd measure_volts sdram_c)
rv=${ram_volts#*=}

printf "\n"
printf "$(date) @ $(hostname)\n"
printf -- "-------------------------------------------\n"
printf "Temperatures\n"
#GPU Temp
printf "GPU => $gt\n"
#CPU Temp
printf "CPU => "
printf %.2f "$((cpu))e-3"
printf "'C\n"
printf -- "-------------------------------------------\n"
printf "Clock Speeds\n"
#ARM core clock
printf "ARM => "
printf %.2f "$((ac))e-6"
printf " MHz\n"
#VC core clock
printf "VC => "
printf %.2f "$((vc))e-6"
printf " MHz\n"
#isp core clock
printf "isp => "
printf %.2f "$((ic))e-6"
printf " MHz\n"
#eMMC core clock
printf "eMMC => "
printf %.2f "$((ec))e-6"
printf " MHz\n"
##echo ""
printf -- "-------------------------------------------\n"
#core voltage
printf "Voltages\n"
printf "core => $cv\n"
#RAM voltage
printf "Ram => $rv\n"
