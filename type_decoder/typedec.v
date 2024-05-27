module top (
    input wire clk,  
    output reg [3:0] led
);

reg [3:0]c;
reg [31:0] counter;
reg [3:0] state;

localparam R_TYPE =     7'b0110011;
localparam I_TYPE =     7'b0010011;
localparam STORE  =     7'b0100011;
localparam LOAD   =     7'b0000011;
localparam BRANCH =     7'b1100011;
localparam JAL    =     7'b1101111;
localparam JALR   =     7'b1100111;
localparam LUI    =     7'b0110111;
localparam AUIPC  =     7'b0010111;

localparam DELAY_COUNT = 50_000_000;

initial begin
    led = 4'b1111; 
    counter = 0;
    state = 4'b0000;
end

always @(posedge clk) begin
    if (counter < DELAY_COUNT) begin
        counter <= counter + 1;
    end else begin
        counter <= 0;
        state <= state + 1;
    end
end

always @(*) begin
    case (state)
        4'b0000: begin
            c = (R_TYPE) ? 4'b0000 : 0;   
            led[3:0] = ~c[3:0];
        end
        4'b0001: begin
            c = (I_TYPE) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        4'b0010: begin
            c = (STORE) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        0011: begin
            c = (LOAD) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        0100: begin
            c = (BRANCH) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        0101: begin
            c = (JAL) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        0110: begin
            c = (JALR) ? 4'b0000 : 0;   
            led[3:0] = ~c[3:0];
        end
        0111: begin
            c = (LUI) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        1000: begin     
            c = (AUIPC) ? 4'b0000 : 0;  
            led[3:0] = ~c[3:0];
        end
        default: begin
            led = 4'b1111; // Default state
        end
    endcase
end

endmodule
