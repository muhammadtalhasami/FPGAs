module top (
    input wire btn1, 
    input wire btn2,
    output reg [2:0] led
);

reg [3:0]a,b,c;

initial begin
    led[0] = 1;
    led[1] = 1;
    led[2] = 1;
end

assign a = 3'b010;
assign b = 3'b011;

always @(*) 
begin
    if (~btn1 && ~btn2)begin
        c = a + b;
        led[0]= ~ c[0];
        led[1]= ~ c[1];
        led[2]= ~ c[2];
    end
    else if (~btn1 && btn2) begin
        c = a - b;
        led[0]= ~ c[0];
        led[1]= ~ c[1];
        led[2]= ~ c[2];
    end
    else if (btn1 && ~btn2) begin
        c = a & b;
        led[0]= ~ c[0];
        led[1]= ~ c[1];
        led[2]= ~ c[2];
    end
    else begin
        c = a | b;
        led[0]= ~ c[0];
        led[1]= ~ c[1];
        led[2]= ~ c[2];
    end

end
endmodule