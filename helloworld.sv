module helloworld(
  
);
  bit semnal1, semnal2;
  initial
   begin
    semnal1 = 0;
    semnal2 = 0;
    $display("Hello, world!");
    #100ms;
  end
  
  always
    begin
      #10 semnal1=~semnal1;
      
    end
    
endmodule