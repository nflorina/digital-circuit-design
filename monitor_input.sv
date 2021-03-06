class monitor_input;
  virtual int_in interfata_monitor;
  input_chanel chanel_i;
  
  function new( virtual int_in input_i, input_chanel chanel);
    interfata_monitor = input_i;
    chanel_i = chanel;
  endfunction
  
  task main();
    input_dut pack;
    forever
      begin
        @(interfata_monitor.reset, interfata_monitor.load, interfata_monitor.startstop);
        pack = new();
        
        pack.increment = interfata_monitor.increment;
        pack.value = interfata_monitor.value;
        pack.digit_i = interfata_monitor.digit_i;
        pack.reset = interfata_monitor.reset;
        pack.load = interfata_monitor.load;
        pack.startstop = interfata_monitor.startstop;
        
        chanel_i.put(pack);
        $display("Monitor intrare", pack);
      end
  endtask  
endclass