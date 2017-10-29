class generator;
  
  rand command gen_command;
  int max_com_count;
  command_chanel com_mbox;
  
  
  function new(command_chanel b, int a); 
  
   max_com_count = a;
   com_mbox = b;
   
  endfunction
  
  
task main();
  for(int i = 0; i < max_com_count; i++)
  begin
    
    gen_command = new();
    //if(gen_command == 0)
    if(!gen_command)
    begin
      $display("Randomization error!");
    end
    else
      begin
        gen_command.id = i;
        generator_t();
        com_mbox.put(gen_command);
      end 
    
  end
endtask

task generator_t();
  gen_command.command_type = command_tk'($urandom_range(2,0));
  gen_command.inc_dec = $urandom_range(1,0);
  foreach (gen_command.init_value[i]) gen_command.init_value[i] = $urandom_range(9,0);  
  gen_command.delay = $urandom_range(15,10);
endtask

endclass


