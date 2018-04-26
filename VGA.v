
module VGA(MAX10_CLK1_50, image, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);

input MAX10_CLK1_50;
input image;
output VGA_HS;
output VGA_VS;
output [3:0] VGA_R;
output [3:0] VGA_G;
output [3:0] VGA_B;

wire clk_25;

pll p(.inclk0(MAX10_CLK1_50), .c0(clk_25));

reg [59:0] numbers;

always@* numbers <= {4'he, 4'hd, 4'hc, 4'hb, 4'ha, 4'h9, 4'h8, 4'h7, 4'h6, 4'h5, 4'h4, 4'h3, 4'h2, 4'h1, 4'h0};//384'h190419041904190419041904190419041904190419041904190419041904190419041904190419041904190419041904;

VGAController controller(
							 .numbers(numbers),
							 .image(image),
							 .clk(clk_25),
							 .vga_h_sync(VGA_HS), 
							 .vga_v_sync(VGA_VS), 
							 .vga_R(VGA_R), 
							 .vga_G(VGA_G),
							 .vga_B(VGA_B));


endmodule