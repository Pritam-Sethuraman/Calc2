	
vlib work
vlog -sv -cover bces -reportprogress 300 -work work mux_out.v 
vlog -sv -cover bces -reportprogress 300 -work work holdreg.v 
vlog -sv -cover bces -reportprogress 300 -work work alu_input_stage.v 
vlog -sv -cover bces -reportprogress 300 -work work alu_output_stage.v
vlog -sv -cover bces -reportprogress 300 -work work compriority.v 
vlog -sv -cover bces -reportprogress 300 -work work shifter.v 
vlog -sv -cover bces -reportprogress 300 -work work adder.v 
vlog -sv -cover bces -reportprogress 300 -work work calc2_top.v 
vlog -sv -cover bces -reportprogress 300 -work work stimulus_generator.sv
vlog -sv -cover bces -reportprogress 300 -work work calc2_test.sv 

vsim  -coverage -novopt calc2_test 


add wave -color red sim:/calc2_test/c_clk
add wave -color red sim:/calc2_test/reset

add wave -color green sim:/calc2_test/req1_cmd_in
add wave -color green sim:/calc2_test/req1_tag_in
add wave -color green -unsigned sim:/calc2_test/req1_data_in
add wave -color green sim:/calc2_test/out_resp1
add wave -color green sim:/calc2_test/out_tag1
add wave -color green -unsigned sim:/calc2_test/out_data1

add wave -color yellow sim:/calc2_test/req2_cmd_in
add wave -color yellow sim:/calc2_test/req2_tag_in
add wave -color yellow -unsigned sim:/calc2_test/req2_data_in
add wave -color yellow sim:/calc2_test/out_resp2
add wave -color yellow sim:/calc2_test/out_tag2
add wave -color yellow -unsigned sim:/calc2_test/out_data2

add wave -color blue sim:/calc2_test/req3_cmd_in
add wave -color blue sim:/calc2_test/req3_tag_in
add wave -color blue -unsigned sim:/calc2_test/req3_data_in
add wave -color blue sim:/calc2_test/out_resp3
add wave -color blue sim:/calc2_test/out_tag3
add wave -color blue -unsigned sim:/calc2_test/out_data3

add wave -color white sim:/calc2_test/req4_cmd_in
add wave -color white sim:/calc2_test/req4_tag_in
add wave -color white -unsigned sim:/calc2_test/req4_data_in
add wave -color white sim:/calc2_test/out_resp4
add wave -color white sim:/calc2_test/out_tag4
add wave -color white -unsigned sim:/calc2_test/out_data4

run 120000	

coverage report -file CovReport.txt -select {s b e}