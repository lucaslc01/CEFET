onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label Clock /system/Clock
add wave -noupdate -label Reset /system/Reset
add wave -noupdate -divider MEM
add wave -noupdate -label DataIn -radix hexadecimal /system/proc1/DataIn
add wave -noupdate -divider Instruction
add wave -noupdate -label Instruction -radix hexadecimal /system/proc1/instruction
add wave -noupdate -label Step -radix hexadecimal /system/proc1/Step
add wave -noupdate -label writeEnableRegInstruction /system/proc1/writeEnableRegInstruction
add wave -noupdate -divider ALU
add wave -noupdate -label {Operador A} -radix hexadecimal /system/proc1/alu1/opA
add wave -noupdate -label {Operador B} -radix hexadecimal /system/proc1/alu1/opB
add wave -noupdate -label {ALU Out Reg} -radix hexadecimal /system/proc1/DataOutRegAlu
add wave -noupdate -divider RF
add wave -noupdate -label {Read Address 1} -radix unsigned /system/proc1/ReadAddressRF1
add wave -noupdate -label {RF 1} -radix hexadecimal /system/proc1/dataRFOut1
add wave -noupdate -label {Read Address 2} -radix hexadecimal /system/proc1/ReadAddressRF2
add wave -noupdate -label {RF 2} -radix hexadecimal /system/proc1/dataRFOut2
add wave -noupdate -label {Write on Reg} -radix hexadecimal /system/proc1/WriteReg
add wave -noupdate -divider MUX
add wave -noupdate -label {MUX Control} -radix hexadecimal /system/proc1/controlMux
add wave -noupdate -label {MUX Out} -radix hexadecimal /system/proc1/DataOutMux
add wave -noupdate -divider Registers
add wave -noupdate -label PC -radix hexadecimal {/system/proc1/rf/register[15]}
add wave -noupdate -label {Reg 1} -radix hexadecimal {/system/proc1/rf/register[1]}
add wave -noupdate -label {Reg 0} -radix hexadecimal {/system/proc1/rf/register[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1359 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2820 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps sim:/system/Clock 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/system/Reset 
wave modify -driver freeze -pattern clock -initialvalue St0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 3000ps Edit:/system/Clock 
wave modify -driver freeze -pattern clock -initialvalue St0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps Edit:/system/Clock 
wave modify -driver freeze -pattern clock -initialvalue St0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps Edit:/system/Clock 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps sim:/system/Reset 
wave modify -driver freeze -pattern repeater -initialvalue (no value) -period 100ps -sequence { 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  } -repeat forever -starttime 0ps -endtime 2000ps Edit:/system/Reset 
WaveCollapseAll -1
wave clipboard restore
