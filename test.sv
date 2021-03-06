
import pkg_compilare::*;

module test;

	// declare the mailbox channels for generator to driver, monitor to scoreboard;
    command_chanel mbox_gen_driver;
	  input_chanel mbox_gen_monitor_input;
	  output_chanel mbox_gen_monitor_output;
	   
    
    // declare a generator instance
    generator my_generator;
    
    // declare a driver instance
    driver my_driver;
    
    // declare the monitor instances
    monitor_input my_monitor_input;
    monitor_output my_monitor_output;
    
    
    // declare a scoreboard instance
    
    
    // verilog initial block, generate all objects;
	initial begin
		init();        
        	run_test();
	end
	
	task init();
	
		// build the mailbox components;
        mbox_gen_driver = new();
        mbox_gen_monitor_input = new();
        mbox_gen_monitor_output = new();

		// build the object classes;
        my_generator = new(mbox_gen_driver, 10);
        my_driver = new(mbox_gen_driver, top_tb.intrare);
        my_monitor_input = new(top_tb.intrare, mbox_gen_monitor_input);
        my_monitor_output = new(top_tb.iesire, mbox_gen_monitor_output);
	
	endtask : init
	
	task run_test();
	
		fork // run all tasks in parallel;
	    	begin 
	       		my_generator.main();
	       	end
	    	begin 
	       		my_driver.main(); 
	       	end
	     begin
	         my_monitor_input.main();
	         end
	     begin
	         my_monitor_output.main();
	         end
	    join_none // exit the fork with all task running in background;
	    
	    // how much time needed to run the simulation (ex. for nr_of_packets = 16 ~ 13ms)
	    #(100ms);
		
	endtask : run_test
	
endmodule : test