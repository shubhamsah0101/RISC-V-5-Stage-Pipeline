`timescale 1ns / 1ps

module pipeline_tb();

    reg clk = 0;
    reg rst;
    
    always #50 clk = ~clk;
    
    initial begin
        // Active-HIGH reset (matches your modules: rst=0 = reset)
        rst = 1'b0;      // Start in reset
        
        #100;            // Hold reset for 100ns
        rst = 1'b1;      // Release reset (processor starts)
        
        #2000;
        $finish;
    end
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, pipeline_tb);
        $display("Simulation started - Active HIGH reset (rst=0=reset, rst=1=run)");
    end
    
    Pipeline_top dut (.clk(clk), .rst(rst));

endmodule