class scoreboard;
  input_chanel input_chanel_scoreboard;
  output_chanel output_chanel_scoreboard;
  
    virtual int_in interfata_in_scoreboard;
    virtual int_out interfata_out_scoreboard;
    
      
  function new( input_chanel canal_intrare, output_chanel canal_iesire);
    input_chanel_scoreboard = canal_intrare;
    output_chanel_scoreboard = canal_iesire;
  endfunction
  
  task main();
        output_dut pack_iesire;
        input_dut pack_intrare;

        
        forever begin
         fork begin
            input_chanel_scoreboard.get(pack_intrare);
            expect_start(pack_intrare);
            expect_load(pack_iesire);
              end
              begin
            output_chanel_scoreboard.get(pack_iesire);
            expect_start(pack_iesire);
            expect_load(pack_iesire);
              
           
  endtask
  
    
    task expect_load(pack_intrare);
      if(pack_intrare.load) 
        begin
        pack_intrare.cifra0 = int_out interfata_out_scoreboard.cifra0;
        pack_intrare.cifra1 = int_out interfata_out_scoreboard.cifra1;
        pack_intrare.cifra2 = int_out interfata_out_scoreboard.cifra2;
        pack_intrare.cifra3 = int_out interfata_out_scoreboard.cifra3;
        end
    endtask
    
    task expect_start(pack_intrare);
      if(pack_intrare.incrment)
    endtask
    
    task verify(pack_iesire);
    endtask
  
endclass