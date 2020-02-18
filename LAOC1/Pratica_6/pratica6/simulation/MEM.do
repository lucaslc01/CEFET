onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label Clock -radix unsigned /MEM/p_Clock
add wave -noupdate -label Enable -radix unsigned /MEM/p_Enable
add wave -noupdate -label Address -radix unsigned /MEM/p_Addr
add wave -noupdate -label In -radix unsigned /MEM/p_In
add wave -noupdate -divider Output
add wave -noupdate -label Output -radix unsigned /MEM/p_Output
add wave -noupdate -divider Memory
add wave -noupdate -label Memory -radix unsigned -childformat {{{/MEM/v_Mem[0]} -radix unsigned} {{/MEM/v_Mem[1]} -radix unsigned} {{/MEM/v_Mem[2]} -radix unsigned} {{/MEM/v_Mem[3]} -radix unsigned} {{/MEM/v_Mem[4]} -radix unsigned} {{/MEM/v_Mem[5]} -radix unsigned} {{/MEM/v_Mem[6]} -radix unsigned} {{/MEM/v_Mem[7]} -radix unsigned} {{/MEM/v_Mem[8]} -radix unsigned} {{/MEM/v_Mem[9]} -radix unsigned} {{/MEM/v_Mem[10]} -radix unsigned} {{/MEM/v_Mem[11]} -radix unsigned} {{/MEM/v_Mem[12]} -radix unsigned} {{/MEM/v_Mem[13]} -radix unsigned} {{/MEM/v_Mem[14]} -radix unsigned} {{/MEM/v_Mem[15]} -radix unsigned} {{/MEM/v_Mem[16]} -radix unsigned} {{/MEM/v_Mem[17]} -radix unsigned} {{/MEM/v_Mem[18]} -radix unsigned} {{/MEM/v_Mem[19]} -radix unsigned} {{/MEM/v_Mem[20]} -radix unsigned} {{/MEM/v_Mem[21]} -radix unsigned} {{/MEM/v_Mem[22]} -radix unsigned} {{/MEM/v_Mem[23]} -radix unsigned} {{/MEM/v_Mem[24]} -radix unsigned} {{/MEM/v_Mem[25]} -radix unsigned} {{/MEM/v_Mem[26]} -radix unsigned} {{/MEM/v_Mem[27]} -radix unsigned} {{/MEM/v_Mem[28]} -radix unsigned} {{/MEM/v_Mem[29]} -radix unsigned} {{/MEM/v_Mem[30]} -radix unsigned} {{/MEM/v_Mem[31]} -radix unsigned}} -expand -subitemconfig {{/MEM/v_Mem[0]} {-height 15 -radix unsigned} {/MEM/v_Mem[1]} {-height 15 -radix unsigned} {/MEM/v_Mem[2]} {-height 15 -radix unsigned} {/MEM/v_Mem[3]} {-height 15 -radix unsigned} {/MEM/v_Mem[4]} {-height 15 -radix unsigned} {/MEM/v_Mem[5]} {-height 15 -radix unsigned} {/MEM/v_Mem[6]} {-height 15 -radix unsigned} {/MEM/v_Mem[7]} {-height 15 -radix unsigned} {/MEM/v_Mem[8]} {-height 15 -radix unsigned} {/MEM/v_Mem[9]} {-height 15 -radix unsigned} {/MEM/v_Mem[10]} {-height 15 -radix unsigned} {/MEM/v_Mem[11]} {-height 15 -radix unsigned} {/MEM/v_Mem[12]} {-height 15 -radix unsigned} {/MEM/v_Mem[13]} {-height 15 -radix unsigned} {/MEM/v_Mem[14]} {-height 15 -radix unsigned} {/MEM/v_Mem[15]} {-height 15 -radix unsigned} {/MEM/v_Mem[16]} {-height 15 -radix unsigned} {/MEM/v_Mem[17]} {-height 15 -radix unsigned} {/MEM/v_Mem[18]} {-height 15 -radix unsigned} {/MEM/v_Mem[19]} {-height 15 -radix unsigned} {/MEM/v_Mem[20]} {-height 15 -radix unsigned} {/MEM/v_Mem[21]} {-height 15 -radix unsigned} {/MEM/v_Mem[22]} {-height 15 -radix unsigned} {/MEM/v_Mem[23]} {-height 15 -radix unsigned} {/MEM/v_Mem[24]} {-height 15 -radix unsigned} {/MEM/v_Mem[25]} {-height 15 -radix unsigned} {/MEM/v_Mem[26]} {-height 15 -radix unsigned} {/MEM/v_Mem[27]} {-height 15 -radix unsigned} {/MEM/v_Mem[28]} {-height 15 -radix unsigned} {/MEM/v_Mem[29]} {-height 15 -radix unsigned} {/MEM/v_Mem[30]} {-height 15 -radix unsigned} {/MEM/v_Mem[31]} {-height 15 -radix unsigned}} /MEM/v_Mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ps} 0}
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
WaveRestoreZoom {0 ps} {900 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 700ps sim:/MEM/p_Clock 
wave create -driver freeze -pattern repeater -initialvalue 0 -period 50ps -sequence { 0 1 1 1 0 0 1 0 0  } -repeat forever -starttime 0ps -endtime 700ps sim:/MEM/p_Enable 
wave create -driver freeze -pattern repeater -initialvalue 5'd5 -period 50ps -sequence { 5'd5 5'd10 5'd15 5'd5 5'd15 5'd5 5'd5 5'd10  } -repeat forever -range 4 0 -starttime 0ps -endtime 700ps sim:/MEM/p_Addr 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 16'd20 -period 50ps -sequence { 16'd20 16'd111 16'd222 16'd0 16'd0 16'd3 16'd0 16'd101  } -repeat forever -range 15 0 -starttime 0ps -endtime 700ps sim:/MEM/p_In 
WaveExpandAll -1
wave modify -driver freeze -pattern repeater -initialvalue 00101 -period 100ps -sequence { 00101 01010 01111 00101 01111 00101 00101 01010  } -repeat forever -range 4 0 -starttime 0ps -endtime 700ps Edit:/MEM/p_Addr 
wave modify -driver freeze -pattern repeater -initialvalue 0000000000010100 -period 100ps -sequence { 0000000000010100 0000000001101111 0000000011011110 0000000000000000 0000000000000000 0000000000000011 0000000000000000 0000000001100101  } -repeat forever -range 15 0 -starttime 0ps -endtime 700ps Edit:/MEM/p_In 
WaveCollapseAll -1
wave clipboard restore
