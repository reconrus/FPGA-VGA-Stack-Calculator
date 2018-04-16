//http://www.fpga4fun.com/PongGame.html

module picture_generator(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B);

//input reset;
input clk;
//input char;
output vga_h_sync, vga_v_sync;
output [3:0] vga_R;
output [3:0] vga_G;
output [3:0] vga_B;

wire in_display_area;
wire [9:0] h;
wire [9:0] v;

reg [9:0] x;
reg [9:0] y;

VGA_sync sync_gen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
						.in_display_area(in_display_area), .x(h), .y(v));
		
//reg was_next_lined;
		
reg [11:0] rgb_data;

parameter VIDEO_W	= 640;
parameter VIDEO_H	= 480;

always@(*)
begin
	x <= h;
	y <= v;
end



////
////https://github.com/bogini/Pong/blob/master/font_test_gen.v#L22
//// signal declaration
//wire [10:0] rom_addr;
//wire [6:0] char_addr;
//wire [3:0] row_addr;
//wire [2:0] bit_addr;
//wire [7:0] font_word;
//wire font_bit, text_bit_on;
//
//// body
//// instantiate font ROM
//font_rom font_unit
//(.clk(clk), .addr(rom_addr), .data_reg(font_word));
//// font ROM interface
//assign char_addr = {y[5:4], x[7:3]};
//assign row_addr = y[3:0];
//assign rom_addr = {char_addr, row_addr};
//assign bit_addr = x[2:0];
//assign font_bit = font_word[~bit_addr];
//// "on" region limited to top-left corner
//assign text_bit_on = (x[9:6]==0 && y[9:6]==0) ?
//                      font_bit : 1'b0;
// // rgb multiplexing circuit
// always@(*)
//   if (~in_display_area)
//     rgb_data = 12'h000; // blank
//   else
//     if (text_bit_on)
//        rgb_data = 12'hfff;  // white
//     else
//        rgb_data = 12'h000;  // black
//
////


always@(posedge clk)
begin
    begin
			if (y > 0 && y <= VIDEO_H/3 && 0<x && x <= VIDEO_W)
					rgb_data <= {4'h0, 4'h0, 4'hf}; 
			else if (y > VIDEO_H/3 && y <= VIDEO_H*2/3 && 0<x && x <= VIDEO_W )
 					rgb_data <= {4'hf,4'hf, 4'hf};  
			else if(y > VIDEO_H*2/3 && y <=VIDEO_H && 0<x && x <= VIDEO_W)
 					rgb_data <= {4'hf, 4'h0, 4'h0}; 
 				else rgb_data <= 12'h000; 
	end
end

assign vga_R=rgb_data[11:8];
assign vga_G=rgb_data[7:4];
assign vga_B=rgb_data[3:0]; 


endmodule