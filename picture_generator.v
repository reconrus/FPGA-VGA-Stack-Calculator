//http://www.fpga4fun.com/PongGame.html

module picture_generator(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B);

//input reset;
input clk;
output vga_h_sync, vga_v_sync;
output [3:0] vga_R;
output [3:0] vga_G;
output [3:0] vga_B;

wire in_display_area;
wire [9:0] h;
wire [9:0] v;

VGA_sync sync_gen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
						.in_display_area(in_display_area));
			

reg [18:0] x ;	
	
////Coordinates generator
always@(posedge clk)
begin
  
  if (in_display_area==1'b1)
     x<=x+1;
	  else
	    x<=19'd0;
end	
		
reg [11:0] rgb_data;

parameter VIDEO_W	= 640;
parameter VIDEO_H	= 480;

always@(posedge clk)
begin
//rgb_data <= {4'hf, 4'h0, 4'h0};
    begin
      if (0<x && x <= VIDEO_W/3)
					rgb_data <= {4'h0, 4'h0, 4'hf}; 
				else if (x > VIDEO_W/3 && x <= VIDEO_W*2/3)
					rgb_data <= {4'hf,4'hf, 4'hf};  
				else if(x > VIDEO_W*2/3 && x <=VIDEO_W)
					rgb_data <= {4'hf, 4'h0, 4'h0}; 
				else rgb_data <= 12'h000; 
 
    end
end

assign vga_R=rgb_data[11:8];
assign vga_G=rgb_data[7:4];
assign vga_B=rgb_data[3:0]; 

//assign vga_R = 4'hf;
//assign vga_G = 4'h0;
//assign vga_B = 4'h0;

endmodule