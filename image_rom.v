module image_rom(
   input wire [4:0] row,
   output [479:0] rgb);
	
reg [479:0] data; 

always @*
      case (row)
         0: data <= 479'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; 
			1: data <= 479'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
			2: data <= {96'hffffffffffffffffffffffff, {8'h0, 4'hf}, 12'h000, 240'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 12'h000, {8'h0, 4'hf}, 96'hffffffffffffffffffffffff};
			3: data <= {84'hfffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 12'h000, 204'hfffffffffffffffffffffffffffffffffffffffffffffffffff, 12'h000, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 84'hfffffffffffffffffffff};
			4: data <= {84'hfffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 12'h000, 96'hffffffffffffffffffffffff, 12'h000, 12'hfff, 24'h000, 60'hfffffffffffffff, 12'h000, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 84'hfffffffffffffffffffff};
			5: data <= {96'hffffffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 12'h000, 72'hffffffffffffffffff, 12'h000, {8'h0, 4'hf}, 12'h000, {8'h0, 4'hf}, 12'h000, 48'hffffffffffff, 12'h000, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 84'hfffffffffffffffffffff};
			6: data <= {84'hfffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 12'h000, 48'hffffffffffff, 12'h000, 12'h000, {8'h0, 4'hf}, 12'h000, {8'h0, 4'hf}, 12'h000, 12'h000, 48'hffffffffffff, 12'h000, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 84'hfffffffffffffffffffff};
			7: data <= {84'hfffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 24'hffffff, 12'h000, 12'h000, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, 12'h000, 12'h000, 24'hffffff, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 96'hffffffffffffffffffffffff};
			8: data <= {84'hfffffffffffffffffffff, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {8'h0, 4'hf}, 12'hfff, 12'h000, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, {8'h0, 4'hf}, 12'h000, 12'hfff, {8'h0, 4'hf}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, {4'hf, 4'hb, 4'hc}, 84'hfffffffffffffffffffff};
			9: data <= 0;
			10: data <= 0;
			11: data <= 0;
			12: data <= 0;
			13: data <= 0;
			14: data <= 0;
			15: data <= 0;
			16: data <= 0;
			17: data <= 0;
			18: data <= 0;
			19: data <= 0; 
			20: data <= 0;
			21: data <= 0;
			22: data <= 0;
			23: data <= 0;
			24: data <= 0;
			25: data <= 0;
			26: data <= 0;
			27: data <= 0;
			28: data <= 0;
			29: data <= 479'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
			
 endcase  
 
assign rgb = data;
 
 endmodule