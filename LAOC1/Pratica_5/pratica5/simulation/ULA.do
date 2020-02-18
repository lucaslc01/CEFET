onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entradas
add wave -noupdate -label p_A /ULA/p_A
add wave -noupdate -label p_B /ULA/p_B
add wave -noupdate -divider Controle
add wave -noupdate -label p_Ctrl /ULA/p_Ctrl
add wave -noupdate -divider Saida
add wave -noupdate -label p_Output /ULA/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {72 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
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
WaveRestoreZoom {0 ps} {266 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern random -initialvalue 0000000000000000 -period 50ps -random_type Uniform -seed 5 -range 15 0 -starttime 0ps -endtime 500ps p_A 
wave create -driver freeze -pattern random -initialvalue 0000000000000000 -period 50ps -random_type Uniform -seed 6 -range 15 0 -starttime 0ps -endtime 500ps sim:/ULA/p_B 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00 -endvalue 11 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 1 0 -starttime 0ps -endtime 500ps p_Ctrl 
WaveCollapseAll -1
wave clipboard restore
