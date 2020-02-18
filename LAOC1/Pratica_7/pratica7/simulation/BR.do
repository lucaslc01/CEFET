onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controller
add wave -noupdate -label p_Clock /BR/p_Clock
add wave -noupdate -label p_EnableWrite /BR/p_EnableWrite
add wave -noupdate -label p_IncPC /BR/p_IncPC
add wave -noupdate -label p_WriteAddr -radix unsigned /BR/p_WriteAddr
add wave -noupdate -divider Input
add wave -noupdate -label p_DataIn -radix hexadecimal /BR/p_DataIn
add wave -noupdate -label p_ReadAddr1 -radix unsigned /BR/p_ReadAddr1
add wave -noupdate -label p_ReadAddr2 -radix unsigned /BR/p_ReadAddr2
add wave -noupdate -divider Output
add wave -noupdate -label p_DataOut1 -radix hexadecimal /BR/p_DataOut1
add wave -noupdate -label p_DataOut2 -radix hexadecimal /BR/p_DataOut2
add wave -noupdate -divider Registers
add wave -noupdate -label v_Register -radix hexadecimal -childformat {{{/BR/v_Register[7]} -radix hexadecimal} {{/BR/v_Register[6]} -radix hexadecimal} {{/BR/v_Register[5]} -radix hexadecimal} {{/BR/v_Register[4]} -radix hexadecimal} {{/BR/v_Register[3]} -radix hexadecimal} {{/BR/v_Register[2]} -radix hexadecimal} {{/BR/v_Register[1]} -radix hexadecimal} {{/BR/v_Register[0]} -radix hexadecimal}} -expand -subitemconfig {{/BR/v_Register[7]} {-height 15 -radix hexadecimal} {/BR/v_Register[6]} {-height 15 -radix hexadecimal} {/BR/v_Register[5]} {-height 15 -radix hexadecimal} {/BR/v_Register[4]} {-height 15 -radix hexadecimal} {/BR/v_Register[3]} {-height 15 -radix hexadecimal} {/BR/v_Register[2]} {-height 15 -radix hexadecimal} {/BR/v_Register[1]} {-height 15 -radix hexadecimal} {/BR/v_Register[0]} {-height 15 -radix hexadecimal}} /BR/v_Register
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {736 ps} 0}
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
WaveRestoreZoom {0 ps} {766 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 700ps sim:/BR/p_Clock 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 50ps -sequence { 0 0 1 1 1 1 1 0 0 1 1 1 1 0  } -repeat forever -starttime 0ps -endtime 700ps sim:/BR/p_IncPC 
wave modify -driver freeze -pattern repeater -initialvalue St0 -period 50ps -sequence { St0 St0 St0 St1 St1 St1 St1 St0 St0 St0 St1 St1 St1 St0  } -repeat forever -starttime 0ps -endtime 700ps Edit:/BR/p_IncPC 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Normal -seed 7 -range 15 0 -starttime 0ps -endtime 700ps sim:/BR/p_DataIn 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 111 -period 100ps -sequence { 111 000 001 100 111 010 110  } -repeat forever -range 2 0 -starttime 0ps -endtime 700ps sim:/BR/p_WriteAddr 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 000 -period 100ps -sequence { 000 111 000 111 001 100 010  } -repeat forever -range 2 0 -starttime 0ps -endtime 700ps sim:/BR/p_ReadAddr1 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 000 -period 50ps -sequence { 000 001 010 111 000 111 000 000 001 001 000 100 111 000  } -repeat forever -range 2 0 -starttime 0ps -endtime 700ps sim:/BR/p_ReadAddr2 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 0 -period 50ps -sequence { 0 1 0 1 1 1 0 0 1 1 1 0 0 1  } -repeat forever -starttime 0ps -endtime 700ps sim:/BR/p_EnableWrite 
wave modify -driver freeze -pattern repeater -initialvalue 111 -period 100ps -sequence { 111 000 001 100 111 010 000  } -repeat forever -range 2 0 -starttime 0ps -endtime 700ps Edit:/BR/p_WriteAddr 
WaveCollapseAll -1
wave clipboard restore
