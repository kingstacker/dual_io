//************************************************
//  Filename      : dual_io.v                             
//  Author        : kingstacker                  
//  Company       : School                       
//  Email         : kingstacker_work@163.com     
//  Device        : Altera cyclone4 ep4ce6f17c8  
//  Description   : dual io,wwidth can be change;                             
//************************************************
module  dual_io #(parameter WIDTH = 8)(
/*i*/   input    wire                  clk          ,
        input    wire                  rst_n        ,
        input    wire                  en           ,
        input    wire   [WIDTH-1:0]    din          ,
        inout    wire   [WIDTH-1:0]    dinout       ,
/*o*/   output   wire   [WIDTH-1:0]    dout              
);
reg [WIDTH-1:0] din_reg;
reg [WIDTH-1:0] dout_reg;
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        din_reg <= 0;
        dout_reg <= 0;
    end //if
    else begin
        if (~en) begin
        	din_reg <= din;
        end    
        else begin
        	dout_reg <= dinout;
        end
    end //else
end //always
assign dinout = (~en) ? din_reg : 8'hzz;
assign dout = dout_reg;
endmodule