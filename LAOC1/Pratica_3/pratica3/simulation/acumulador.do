view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 600ps sim:/acumulador/p_Clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 350ps -dutycycle 1 -starttime 0ps -endtime 600ps sim:/acumulador/p_Clear 
wave modify -driver freeze -pattern clock -initialvalue St0 -period 360ps -dutycycle 1 -starttime 0ps -endtime 600ps Edit:/acumulador/p_Clear 
wave create -driver freeze -pattern constant -value 8'd3 -range 7 0 -starttime 0ps -endtime 600ps sim:/acumulador/p_A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 16'd6 -range 7 0 -starttime 0ps -endtime 600ps sim:/acumulador/p_B 
WaveExpandAll -1
wave modify -driver freeze -pattern clock -initialvalue St0 -period 380ps -dutycycle 1 -starttime 0ps -endtime 600ps Edit:/acumulador/p_Clear 
WaveCollapseAll -1
wave clipboard restore
