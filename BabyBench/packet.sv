typedef enum bit[1:0] {ADD,SUB,MUL,DIV} OPCODE_e;
class packet extends uvm_sequence_item;
  `uvm_object_utils(packet)
  rand OPCODE_e op;
  rand bit[7:0] in1;
  rand bit[7:0] in2;

  function new(string name="inst_packer");
    super.new(name);
  endfunction
  
  function void do_copy(uvm_object rhs);
    packet pkt;
    super.do_copy(rhs);
    if(rhs == null) 
      `uvm_error("ERROR",$sformatf("rhs object not found"));
    if(!$cast(pkt,rhs))
      `uvm_error("ERROR",$sformatf("casting error rhs object of not type packet"));
    this.op = pkt.op;
    this.in1 = pkt.in1;
    this.in2 = pkt.in2;
  endfunction
  
  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    packet pkt;
    bit result = 1'b1;
    
    result &= super.do_compare(rhs,comparer);
    
    $cast(pkt, rhs);
    result &= (op == pkt.op);
    result &= (in1 == pkt.in1);
    result &= (in2 == pkt.in2);
    
    return result;
    
  endfunction
  
  virtual function string conver2string();
    conver2string = $psprintf("IN1:%x IN2:%x OP:%s",in1,in2,op);
  endfunction 
endclass
