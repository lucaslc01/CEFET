onerror {resume}
quietly virtual signal -install /serial {/serial/start  } go
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entradas
add wave -noupdate -radix unsigned /serial/A
add wave -noupdate -radix unsigned /serial/B
add wave -noupdate /serial/resetn
add wave -noupdate /serial/go
add wave -noupdate /serial/clock
add wave -noupdate -divider Estado
add wave -noupdate /serial/my_control/current_state
add wave -noupdate -divider Saida
add wave -noupdate -radix unsigned /serial/sum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {154 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 265
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
WaveRestoreZoom {0 ps} {1800 ps}
