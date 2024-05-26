module top (
    input wire btn1, 
    input wire btn2,
    output reg led
);

reg [2:0]a,b,result;

initial begin
    led = 1;
end

always @(*) 
begin
    if (~btn1 && ~btn2)begin        // BRANCH EQUALLS TO
        a = 5;
        b = 5;
        result = (a == b) ? 1 : 0 ;
        led= ~ result;
    end
    else if (~btn1 && btn2) begin   // BRANCH NOT EQUALLS TO
        a = 1;
        b = 5;
        result = (a != b) ? 1 : 0 ;
        led= ~ result;
    end
    else if (btn1 && ~btn2) begin   // BRANCH LESS THAN
        a = 3;
        b = 5;
        result = (a < b) ? 1 : 0 ;
        led= ~ result;
    end
    else begin                      // BRANCH GREATER EQUALLS TO
        a = 4;
        b = 5;
        result = (a >= b) ? 1 : 0 ;
        led= ~ result;
    end

end
endmodule
