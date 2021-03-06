
class simple_dpi_seq_driver_test extends simple_dpi_test_base;
	
	`uvm_component_utils(simple_dpi_seq_driver_test)
	
	/****************************************************************
	 * Data Fields
	 ****************************************************************/
	
	/****************************************************************
	 * new()
	 ****************************************************************/
	function new(string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction

	/****************************************************************
	 * build_phase()
	 ****************************************************************/
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	/****************************************************************
	 * connect_phase()
	 ****************************************************************/
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction

	/****************************************************************
	 * run_phase()
	 ****************************************************************/
	task run_phase(uvm_phase phase);
		sw_txn_seq seq = sw_txn_seq::type_id::create("seq");
		
		phase.raise_objection(this, "Run Phase");
		
		fork
		for (int i=0; i<5; i++) begin
			seq.txn.A = i;
			seq.txn.B = i+5;
		
			seq.start(m_env.m_sw_txn_seqr);
		end
		join_none
		
		test_main("*.m_sdv_connector");
		
		phase.drop_objection(this, "Run Phase");
	endtask
	
	/**
	 * Function: report_phase
	 *
	 * Override from class 
	 */
	virtual function void report_phase(input uvm_phase phase);
		uvm_report_server svr = get_report_server();
	endfunction

	
	
endclass



