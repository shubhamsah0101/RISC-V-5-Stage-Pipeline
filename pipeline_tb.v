`timescale 1ns / 1ps

module pipeline_tb();

    reg clk = 0;
    reg rst;
    
    always #50 clk = ~clk;
    
    initial begin
        rst = 1'b0;
        $display("Time=%0t: Reset ASSERTED (rst=0)", $time);
        #100;
        rst = 1'b1;
        $display("Time=%0t: Reset RELEASED (rst=1) - Processor starting", $time);
        #2000;
        $display("Time=%0t: Simulation finished", $time);
        $finish;
    end
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, pipeline_tb);
    end
    
    initial begin
        $monitor("Time=%0t: rst=%b, PCD=%h", $time, rst, dut.PCD);
    end
    
    Pipeline_top dut (.clk(clk), .rst(rst));

endmodule