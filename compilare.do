vlib ./

vmap lab_work ./work

vlog int_in.sv
vlog int_out.sv

vlog -sv -mfcu -work lab_work pkg_compilare.sv

vlog +incdir+, -work lab_work test.sv 
vlog +incdir+, -work lab_work top_tb.sv  

vsim lab_work.top_tb -novopt

log -r /*
run -a