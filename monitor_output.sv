class monitor_output;
  virtual int_out interfata_monitor;
  output_chanel chanel_o;
  
  function new( virtual int_out output_o, output_chanel chanel);
    interfata_monitor = output_o;
    chanel_o = chanel;
  endfunction
  
  task main();
    output_dut pack;
    forever
      begin
        @(interfata_monitor.cifra0, interfata_monitor.cifra1, interfata_monitor.cifra2, interfata_monitor.cifra3);
        pack = new();
        
        pack.cifra0 = interfata_monitor.cifra0;
        pack.cifra1 = interfata_monitor.cifra1;
        pack.cifra2 = interfata_monitor.cifra2;
        pack.cifra3 = interfata_monitor.cifra3;
        
        chanel_o.put(pack);
        $display("Monitor iesire", pack);
        
        if(cifra_ok(pack) == 0)
          $display("Cifra ERONATA");
        else 
          $display("Cifra BUNA");
      end
    
  endtask
  
  function cifra_ok(output_dut pack);
      bit rezultat_final = 1;

      if(pack.cifra0 inside {[0:9]}) rezultat_final = rezultat_final & 1;
        else rezultat_final = rezultat_final & 0;
          
      if(pack.cifra1 inside {[0:9]}) rezultat_final = rezultat_final & 1;
        else rezultat_final = rezultat_final & 0;
          
      if(pack.cifra2 inside {[0:9]}) rezultat_final = rezultat_final & 1;
        else rezultat_final = rezultat_final & 0;
          
      if(pack.cifra3 inside {[0:9]}) rezultat_final = rezultat_final & 1;
        else rezultat_final = rezultat_final & 0;
        
      if(rezultat_final == 1)
        return 1;
        
      if(rezultat_final == 0)
        return 0;

  endfunction
  
endclass