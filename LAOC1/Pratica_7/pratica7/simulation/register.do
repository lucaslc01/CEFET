onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controller
add wave -noupdate -label p_Clock /Register/p_Clock
add wave -noupdate -label p_EnableWrite /Register/p_EnableWrite
add wave -noupdate -divider {Data In}
add wave -noupdate -label p_DataIn -radix hexadecimal /Register/p_DataIn
add wave -noupdate -divider Output
add wave -noupdate -label p_Output -radix hexadecimal /Register/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 216
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
WaveRestoreZoom {0 ps} {743 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 700ps sim:/Register/p_Clock 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Uniform -seed 5 -range 15 0 -starttime 0ps -endtime 700ps sim:/Register/p_DataIn 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Uniform -seed 5 -starttime 0ps -endtime 700ps sim:/Register/p_EnableWrite 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Uniform -seed 7 -starttime 0ps -endtime 700ps sim:/Register/p_EnableWrite 
wave create -driver freeze -pattern random -initialvalue 1 -period 50ps -random_type Normal -seed 8 -starttime 0ps -endtime 700ps sim:/Register/p_EnableWrite 
WaveCollapseAll -1
wave clipboard restore
