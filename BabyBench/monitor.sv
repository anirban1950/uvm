class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  uvm_analysis_port #(packet) monPort;
  virtual dut_intf intf;

  function new(string name="monitor", uvm_component parent);
    super.new(name,parent);
    monPort = new("monPort",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    uvm_config_db #(virtual dut_intf)::get(this,"","dut_intf",intf);
  endfunction

  virtual task run_phase(uvm_phase phase);
    packet pkt;
    forever begin
      @intf.monitorCB;
      if(intf.monitorCB.VLD == 1'b1) begin
      pkt = packet::type_id::create("pkt",this);
      //pkt.op = OPCODE_e'(intf.monitorCB.OP);
      //pkt.in1 = intf.monitorCB.A;
      //pkt.in2 = intf.monitorCB.B;
        
        pkt.op = OPCODE_e'(intf.monitor.monitorCB.OP);
      pkt.in1 = intf.monitor.monitorCB.A;
      pkt.in2 = intf.monitor.monitorCB.B;
      `uvm_info(get_full_name(),$psprintf("%s",pkt.conver2string()),UVM_LOW);
        monPort.write(pkt);
      end
    end
  endtask
endclass
