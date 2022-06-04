module inv_mix_col(inp_matrix,out_matrix);
input [0:127]inp_matrix;
output [0:127]out_matrix;

assign out_matrix[0:7] = multi(inp_matrix[0:7],8'h0e)^multi(inp_matrix[8:15],8'h0b)^multi(inp_matrix[16:23],8'h0d)^multi(inp_matrix[24:31],8'h09);
assign out_matrix[8:15] = multi(inp_matrix[0:7],8'h09)^multi(inp_matrix[8:15],8'h0e)^multi(inp_matrix[16:23],8'h0b)^multi(inp_matrix[24:31],8'h0d);
assign out_matrix[16:23] = multi(inp_matrix[0:7],8'h0d)^multi(inp_matrix[8:15],8'h09)^multi(inp_matrix[16:23],8'h0e)^multi(inp_matrix[24:31],8'h0b);
assign out_matrix[24:31] = multi(inp_matrix[0:7],8'h0b)^multi(inp_matrix[8:15],8'h0d)^multi(inp_matrix[16:23],8'h09)^multi(inp_matrix[24:31],8'h0e);

assign out_matrix[32:39] = multi(inp_matrix[32:39],8'h0e)^multi(inp_matrix[40:47],8'h0b)^multi(inp_matrix[48:55],8'h0d)^multi(inp_matrix[56:63],8'h09);
assign out_matrix[40:47] = multi(inp_matrix[32:39],8'h09)^multi(inp_matrix[40:47],8'h0e)^multi(inp_matrix[48:55],8'h0b)^multi(inp_matrix[56:63],8'h0d);
assign out_matrix[48:55] = multi(inp_matrix[32:39],8'h0d)^multi(inp_matrix[40:47],8'h09)^multi(inp_matrix[48:55],8'h0e)^multi(inp_matrix[56:63],8'h0b);
assign out_matrix[56:63] = multi(inp_matrix[32:39],8'h0b)^multi(inp_matrix[40:47],8'h0d)^multi(inp_matrix[48:55],8'h09)^multi(inp_matrix[56:63],8'h0e);

assign out_matrix[64:71] = multi(inp_matrix[64:71],8'h0e)^multi(inp_matrix[72:79],8'h0b)^multi(inp_matrix[80:87],8'h0d)^multi(inp_matrix[88:95],8'h09);
assign out_matrix[72:79] = multi(inp_matrix[64:71],8'h09)^multi(inp_matrix[72:79],8'h0e)^multi(inp_matrix[80:87],8'h0b)^multi(inp_matrix[88:95],8'h0d);
assign out_matrix[80:87] = multi(inp_matrix[64:71],8'h0d)^multi(inp_matrix[72:79],8'h09)^multi(inp_matrix[80:87],8'h0e)^multi(inp_matrix[88:95],8'h0b);
assign out_matrix[88:95] = multi(inp_matrix[64:71],8'h0b)^multi(inp_matrix[72:79],8'h0d)^multi(inp_matrix[80:87],8'h09)^multi(inp_matrix[88:95],8'h0e);

assign out_matrix[96:103] = multi(inp_matrix[96:103],8'h0e)^multi(inp_matrix[104:111],8'h0b)^multi(inp_matrix[112:119],8'h0d)^multi(inp_matrix[120:127],8'h09);
assign out_matrix[104:111] = multi(inp_matrix[96:103],8'h09)^multi(inp_matrix[104:111],8'h0e)^multi(inp_matrix[112:119],8'h0b)^multi(inp_matrix[120:127],8'h0d);
assign out_matrix[112:119] = multi(inp_matrix[96:103],8'h0d)^multi(inp_matrix[104:111],8'h09)^multi(inp_matrix[112:119],8'h0e)^multi(inp_matrix[120:127],8'h0b);
assign out_matrix[120:127] = multi(inp_matrix[96:103],8'h0b)^multi(inp_matrix[104:111],8'h0d)^multi(inp_matrix[112:119],8'h09)^multi(inp_matrix[120:127],8'h0e);

function [7:0] multi;
input [7:0] mulltiplicand, multiplier;
begin
	multi = 0;
		while(multiplier!=0)
		begin
			if(multiplier[0])
				multi = mulltiplicand^multi;
			if(mulltiplicand[7])
				mulltiplicand = (mulltiplicand<<1)^8'h1b;
			else begin
				mulltiplicand = mulltiplicand<<1;
			end
			multiplier = multiplier>>1;
		end
end
endfunction
endmodule