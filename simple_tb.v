module simple_tb(); 
 
    reg clk = 0; 
    always #10 clk = ~clk; 
 
    initial begin 
        $dumpfile("test.vcd"); 
        $dumpvars(0, simple_tb); 
        #100; 
        $finish; 
    end 
 
    initial begin 
        $display("Test simulation running..."); 
    end 
 
endmodule 
