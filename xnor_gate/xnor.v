module top (
    input wire btn1, 
    input wire btn2,
    output reg [5:0] led
);

initial begin
    led[0] = 1;
    led[1] = 1;
    led[2] = 1;
    led[3] = 1;
    led[4] = 1;
    led[5] = 1;

end

always @(*) 
begin
    if (~btn1 && ~btn2) 
        led[0] = 0;
    else if (~btn1 && btn2) 
        led[0] = 1;
    else if (btn1 && ~btn2) 
        led[0] = 1;
    else 
      led[0] = 0;

end
endmodule