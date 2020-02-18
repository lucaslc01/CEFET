onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controller
add wave -noupdate -label p_Clock /PC/p_Clock
add wave -noupdate -label p_IncPC /PC/p_IncPC
add wave -noupdate -label p_Load /PC/p_Load
add wave -noupdate -divider Input
add wave -noupdate -label p_DataIn -radix hexadecimal /PC/p_DataIn
add wave -noupdate -divider Output
add wave -noupdate -label p_Output -radix hexadecimal /PC/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {752 ps} 0}
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
WaveRestoreZoom {0 ps} {768 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 700ps sim:/PC/p_Clock 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Normal -seed 5 -starttime 0ps -endtime 700ps sim:/PC/p_Load 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 50ps -sequence { 0 1 1 1 1 0 0 1 1 1 0 0  } -repeat forever -starttime 0ps -endtime 700ps sim:/PC/p_IncPC 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Uniform -seed 6 -range 15 0 -starttime 0ps -endtime 700ps sim:/PC/p_DataIn 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
