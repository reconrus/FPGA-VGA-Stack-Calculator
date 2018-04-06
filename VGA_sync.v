//http://www.fpga4fun.com/PongGame.html

module VGA_sync(clk, vga_h_sync, vga_v_sync, in_display_area);
input clk;
output reg vga_h_sync;
output reg vga_v_sync;
output reg in_display_area;

reg [9:0] h;
reg [9:0] v;

parameter h_line  = 800;                           
parameter h_back  = 144;
parameter h_front = 16;
parameter v_line  = 525;
parameter v_back  = 35;
parameter v_front = 10;
parameter H_sync_cycle = 96;
parameter V_sync_cycle = 2;

always @(negedge clk)
begin
//	if(reset)
//		begin
//			h <= 10'd0;
//			v <= 10'd0;
//	end
//	else
		begin
			if(h == h_line - 1)
				begin
					h <= 10'd0;
					if(v == v_line - 1)
						v <= 10'd0;
					else
						v <= v + 1;
				end
			else 
				h <= h + 1; 
		end
end

	
wire	vga_HS, vga_VS;

assign vga_HS = (h < H_sync_cycle)?1'b0:1'b1;
assign vga_VS = (v < V_sync_cycle)?1'b0:1'b1;


wire on_display;
assign on_display = (h < (h_line - h_front) && h >= h_back) && (v < (v_line - v_front) && v>=v_back);


always@(negedge clk)
begin
	vga_h_sync <= vga_HS;
	vga_v_sync <= vga_VS;
	in_display_area <= on_display;
end

endmodule