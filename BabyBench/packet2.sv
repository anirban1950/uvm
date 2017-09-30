class packet2 extends packet;
  `uvm_object_utils(packet2)

  constraint addr { op inside {MUL,DIV};}
   function new (string name = "packet2");
    super.new(name);
  endfunction
virtual function string conver2string();
    conver2string = $psprintf("packet2 IN1:%x IN2:%x OP:%s",in1,in2,op);
  endfunction
endclass
