module top
(
    input btn1,
    input btn2,
    output [5:0] led
);
initial begin
    led[0] = 1;
    led[1] = 1;
    led[2] = 1;
    led[3] = 1;
    led[4] = 1;
    led[5] = 1;
end


always@(*) begin
   if (~btn1 && ~btn2)begin
        led[0] = 0;
   end
   else if (~btn1 && btn2)begin
        led[0] = 0;
   end
   else if (btn1 && ~btn2)begin
        led[0] = 0;
   end
    else begin
        led[0] = 1;
   end
end

endmodule