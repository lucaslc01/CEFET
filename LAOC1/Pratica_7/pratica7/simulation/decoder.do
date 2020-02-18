onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -label p_Input -radix unsigned /Decoder/p_Input
add wave -noupdate -divider Output
add wave -noupdate -label p_Output -radix binary /Decoder/p_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {152 ps} 0}
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
WaveRestoreZoom {0 ps} {434 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern random -initialvalue 000 -period 50ps -random_type Uniform -seed 5 -range 2 0 -starttime 0ps -endtime 700ps sim:/Decoder/p_Input 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
