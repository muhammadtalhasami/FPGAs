module top (
    input wire clk,  
    output reg [2:0] led
);

reg [2:0] a, b, c;
reg [31:0] counter;
reg [3:0] state;

localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam AND = 4'b0010;
localparam OR  = 4'b0011;
localparam SLL = 4'b0100;
localparam XOR = 4'b0101;
localparam SRL = 4'b0110;
localparam SLT= 4'b0111;
localparam SLTU= 4'b0111;
localparam DELAY_COUNT = 50_000_000;

initial begin
    led = 3'b111; 
    counter = 0;
    state = ADD;
    a = 3'b101;   //2
    b = 3'b001;   //1  
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
        ADD: begin
            c = a + b;   // 3
            led[2:0] = ~c[2:0];
        end
        SUB: begin
            c = a - b; // 1
            led[2:0] = ~c[2:0];
        end
        AND: begin
            c = a & b; //1
            led[2:0] = ~c[2:0];
        end
        OR: begin
            c = a | b; //5
            led[2:0] = ~c[2:0];
        end
        SLL: begin
            c = a << b;
            led[2:0] = ~c[2:0];
        end
        XOR: begin
            c = a ^ b;
            led[2:0] = ~c[2:0];
        end
        SRL: begin
            c = a >> b; //shift right logical
            led[2:0] = ~c[2:0];
        end
        SLT: begin
            c = ($signed(a) < $signed(b))? 1: 0; //set less then signed 4 
            led[2:0] = ~c[2:0];
        end
        SLTU: begin      //set less then unsigned 4 
         c = (a < b)? 1: 0;
            led[2:0] = ~c[2:0];
        end
        default: begin
            led = 3'b111; // Default state
        end
    endcase
end

endmodule
