onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /somador/p_Controle
add wave -noupdate /somador/p_A
add wave -noupdate /somador/p_B
add wave -noupdate -divider Output
add wave -noupdate /somador/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 202
configure wave -valuecolwidth 130
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
WaveRestoreZoom {0 ps} {1204 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0 -endvalue 1 -type Range -direction Up -period 500ps -step 1 -repeat forever -starttime 0ps -endtime 1000ps sim:/somador/p_Controle 
wave create -driver freeze -pattern constant -value 0000000000000001 -range 15 0 -starttime 0ps -endtime 1000ps sim:/somador/p_A 
wave create -driver freeze -pattern constant -value 0000000000000001 -range 15 0 -starttime 0ps -endtime 1000ps sim:/somador/p_B 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 16'b1 -period 250ps -sequence { 16'b1 16'b10 16'b11  } -repeat forever -range 15 0 -starttime 0ps -endtime 1000ps sim:/somador/p_A 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
