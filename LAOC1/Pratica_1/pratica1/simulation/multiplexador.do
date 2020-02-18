onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /multiplexador/p_Control
add wave -noupdate /multiplexador/p_A
add wave -noupdate /multiplexador/p_B
add wave -noupdate /multiplexador/p_C
add wave -noupdate /multiplexador/p_D
add wave -noupdate /multiplexador/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {107 ps} 0}
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
WaveRestoreZoom {0 ps} {442 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 00 -endvalue 11 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 1 0 -starttime 0ps -endtime 400ps sim:/multiplexador/p_Control 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0000000000000001 -range 15 0 -starttime 0ps -endtime 400ps sim:/multiplexador/p_A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 16'b10 -range 15 0 -starttime 0ps -endtime 400ps sim:/multiplexador/p_B 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 16'b11 -range 15 0 -starttime 0ps -endtime 400ps sim:/multiplexador/p_C 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 16'b100 -range 15 0 -starttime 0ps -endtime 400ps sim:/multiplexador/p_D 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
