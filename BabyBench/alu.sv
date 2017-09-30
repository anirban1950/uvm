//module ALU (
//  input        [1:0] OP ,
//  input              CLK,
//  input        [7:0] A,
//  input        [7:0] B,
//  inout        in_vld;
//  output reg   [15:0] OUT,
//  output reg   out_vld;
//);
module ALU (dut_intf.dut intf);
  //input        [1:0] OP ,
  //input              CLK,
  //input        [7:0] A,
  //input        [7:0] B,
  //inout        in_vld;
  //output reg   [15:0] OUT,
  //output reg   out_vld;
  //);

reg [15:0] TMP_OUT;

always@(*) begin
  case(intf.OP)
    2'b00: TMP_OUT = intf.A + intf.B;
    2'b00: TMP_OUT = intf.A - intf.B;
    2'b00: TMP_OUT = intf.A * intf.B;
    2'b11: TMP_OUT = intf.A & intf.B;
  endcase
end

always@(posedge intf.CLK)
begin
  if(intf.VLD) begin
    intf.OUT <= TMP_OUT;
    intf.OV <= intf.VLD;
  end  
end
endmodule
