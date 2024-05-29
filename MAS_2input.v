// 
// Designer: <Q36121244> 
//
module MAS_2input(
    input signed [4:0]Din1,
    input signed [4:0]Din2,
    input [1:0]Sel,
    input signed[4:0]Q,
    output reg[1:0]Tcmp,
    output reg signed [4:0]TDout,
    output reg signed [3:0]Dout
);
    
    reg signed [4:0]temp;
    
    always @(Din1 or Din2)
    begin
        case(Sel)//ALU 1
        2'b00: temp = Din1 + Din2;
        2'b01: temp = Din1;
        2'b10: temp = Din1;
        2'b11: temp = Din1 - Din2;
        endcase
        
        //Q Comparator
        Tcmp[0] = (temp >= 0) ? 1 : 0; 
        Tcmp[1] = (temp >= Q) ? 1 : 0;        
        TDout = temp;
        
        case(Tcmp)//ALU 2
        2'b00: Dout[3:0] = temp + Q;
        2'b01: Dout[3:0] = temp;
        2'b10: Dout[3:0] = temp;
        2'b11: Dout[3:0] = temp - Q;
        endcase
        
    end

endmodule