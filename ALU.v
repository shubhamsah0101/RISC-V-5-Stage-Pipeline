module ALU(A,B,Result,ALUControl,OverFlow,Carry,Zero,Negative);

    input [31:0] A, B;
    input [2:0] ALUControl;
    output Carry, OverFlow, Zero, Negative;
    output [31:0] Result;

    reg [31:0] Result;
    reg Carry, OverFlow, Zero, Negative;
    reg [32:0] temp_result;

    always @(*) begin
        case (ALUControl)
            3'b000: begin // ADD
                temp_result = {1'b0, A + B};
                Result = temp_result[31:0];
                Carry = temp_result[32];
                OverFlow = ((A[31] == B[31]) && (Result[31] != A[31]));
                Zero = (Result == 32'b0);
                Negative = Result[31];
            end
            
            3'b001: begin // SUB
                temp_result = {1'b0, A - B};
                Result = temp_result[31:0];
                Carry = temp_result[32];
                OverFlow = ((A[31] != B[31]) && (Result[31] != A[31]));
                Zero = (Result == 32'b0);
                Negative = Result[31];
            end
            
            3'b010: begin // AND
                Result = A & B;
                Carry = 1'b0;
                OverFlow = 1'b0;
                Zero = (Result == 32'b0);
                Negative = Result[31];
            end
            
            3'b011: begin // OR
                Result = A | B;
                Carry = 1'b0;
                OverFlow = 1'b0;
                Zero = (Result == 32'b0);
                Negative = Result[31];
            end
            
            3'b101: begin // SLT
                Result = (A[31] != B[31]) ? {31'b0, A[31]} : 
                         (A < B) ? 32'b1 : 32'b0;
                Carry = 1'b0;
                OverFlow = 1'b0;
                Zero = (Result == 32'b0);
                Negative = Result[31];
            end
            
            default: begin
                Result = 32'b0;
                Carry = 1'b0;
                OverFlow = 1'b0;
                Zero = 1'b0;
                Negative = 1'b0;
            end
        endcase
    end

endmodule