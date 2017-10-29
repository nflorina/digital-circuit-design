class driver;
  command_chanel command_mbox;
  virtual int_in intrare;

function new(command_chanel a, virtual int_in b);
    command_mbox = a;
    intrare = b;    
endfunction

task main();
  command getcomand;
  initializare();
  forever begin
  command_mbox.get(getcomand); driving(getcomand); end
endtask;


task driving(command command_drive);
  //command_chanel command_drive;
  command_mbox.put(command_drive);
  
  case(command_drive.command_type)
    start: begin
            intrare.increment = command_drive.inc_dec; //setare directie
            intrare.startstop = 0;
            #1ms;
            intrare.startstop = 1;
            #(command_drive.delay * 1ms);
            intrare.startstop = 0;
            #1ms;
            intrare.startstop = 1;
          end
           
    
    load: begin
          for( int i = 0; i<=3; i++)
            begin
              //setare valoare pentru fiecare cifra
              intrare.value = command_drive.init_value[i]; 
              intrare.digit_i = i;
              intrare.load = 1;
              #1ms;
              intrare.load = 0;
              #1ms;
            end
          end
    
    reset: begin 
            intrare.reset = 0;
            #1ms;
            intrare.reset = 1;
          end        
  endcase
  
endtask

task initializare();
  intrare.startstop = 1;
  intrare.load = 1;
  intrare.reset = 1;
  intrare.digit_i = 0;
  intrare.value = 0;
  intrare.increment = 0;
  
endtask

endclass



