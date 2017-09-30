interface dut_intf(input logic CLK);
  logic RST;
  logic [1:0] OP;
  logic [7:0] A;
  logic [7:0] B;
  logic VLD;
  logic [15:0] OUT;
  logic OV;
  
  clocking driverCB @(posedge CLK);
  output VLD,OP,A,B,RST;
  endclocking

  clocking monitorCB @(posedge CLK);
  input VLD,OP,A,B,OUT,OV;
  endclocking

  //modport driver (clocking driverCB );
  modport dut (input VLD,OP,A,B,CLK,
               output OUT,OV);
  modport monitor (clocking monitorCB);

  
endinterface
