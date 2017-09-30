class driver extends uvm_driver#(packet);
  `uvm_component_utils(driver)
  virtual dut_intf intf;

  function new(string name="drv",uvm_component parent);
    super.new(name,parent);
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(!uvm_config_db #(virtual dut_intf)::get(this,"","dut_intf",intf))
      `uvm_fatal(get_full_name(),$sformatf("dut_intf not found"));
  endfunction

 virtual task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      @intf.driverCB;
      intf.driverCB.VLD <= 1'b1;
      intf.driverCB.OP <= req.op;
      intf.driverCB.A  <= req.in1;
      intf.driverCB.B  <= req.in2;
      seq_item_port.item_done();
    end
  endtask
endclass  

