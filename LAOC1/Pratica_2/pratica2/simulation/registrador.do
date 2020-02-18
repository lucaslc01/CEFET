onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /registrador/p_Clock
add wave -noupdate /registrador/p_WriteOn
add wave -noupdate /registrador/p_Input
add wave -noupdate /registrador/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {363 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
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
WaveRestoreZoom {0 ps} {651 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/registrador/p_Clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/registrador/p_WriteOn 
wave create -driver freeze -pattern random -initialvalue 0000000000000000 -period 100ps -random_type Uniform -seed 5 -range 15 0 -starttime 0ps -endtime 1000ps sim:/registrador/p_Input 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
