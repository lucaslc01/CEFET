transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Desktop/2aaula/fluxo {C:/Users/Aluno/Desktop/2aaula/fluxo/porta_exor.v}

