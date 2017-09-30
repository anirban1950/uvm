`include "dut_intf.sv"
`include "alu.sv"
module top;
  import uvm_pkg::*;
  import agt_pkg::*;
  import test_pkg::*;
  reg CLK=0;
  dut_intf intf(.CLK(CLK));
  ALU alu (.intf(intf.dut));
  //svtb_top svtb_top();

  always 
  #5 CLK =~ CLK; 

  initial
  begin
    uvm_config_db #(virtual dut_intf)::set(uvm_root::get(),"*","dut_intf",intf);
    run_test();
  end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule
