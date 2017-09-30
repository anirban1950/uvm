class test_base extends uvm_test;
  `uvm_component_utils(test_base);
  env env1;
  function new (string name = "test_base", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env1 = env::type_id::create("env",this);
  uvm_config_db#(uvm_object_wrapper)::set(this, "env.agt.sqr.main_phase", "default_sequence", base_seq::type_id::get());
  endfunction

endclass
