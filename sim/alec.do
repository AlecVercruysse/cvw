wave cursor time -time 675785ns
wave seecursor

add wave -position insertpoint  \
sim:/testbench/dut/core/mdu/mdu/*
add wave -position insertpoint  \
sim:/testbench/dut/core/ieu/dp/RegWriteW
add wave -position insertpoint  \
sim:/testbench/dut/core/ieu/dp/MDUResultW
add wave -position insertpoint  \
sim:/testbench/dut/core/ieu/dp/ResultW
add wave -position insertpoint  \
sim:/testbench/dut/core/ieu/c/RegWriteW
add wave -position insertpoint  \
sim:/testbench/dut/core/mdu/mdu/mul/PP1E \
sim:/testbench/dut/core/mdu/mdu/mul/PP2E \
sim:/testbench/dut/core/mdu/mdu/mul/PP3E \
sim:/testbench/dut/core/mdu/mdu/mul/PP4E \
sim:/testbench/dut/core/mdu/mdu/mul/PP1M \
sim:/testbench/dut/core/mdu/mdu/mul/PP2M \
sim:/testbench/dut/core/mdu/mdu/mul/PP3M \
sim:/testbench/dut/core/mdu/mdu/mul/PP4M \
sim:/testbench/dut/core/mdu/mdu/mul/U \
sim:/testbench/dut/core/mdu/mdu/mul/SU \
sim:/testbench/dut/core/mdu/mdu/mul/S \
sim:/testbench/dut/core/mdu/mdu/mul/Am \
sim:/testbench/dut/core/mdu/mdu/mul/Bm \
sim:/testbench/dut/core/mdu/mdu/mul/Pm \
sim:/testbench/dut/core/mdu/mdu/mul/Aprime \
sim:/testbench/dut/core/mdu/mdu/mul/Bprime \
sim:/testbench/dut/core/mdu/mdu/mul/PA \
sim:/testbench/dut/core/mdu/mdu/mul/PB \
sim:/testbench/dut/core/mdu/mdu/mul/Pprime

examine -time [wave cursor time] sim:/testbench/dut/core/mdu/mdu/mul/PP*E