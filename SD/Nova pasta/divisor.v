module divisor(clock,saida,reset,preset);

input reset,preset,clock;
reg [23:0] q;
output saida;

	initial
	begin
	q = 24'b0;
	end
	
	always@ (posedge clock or posedge reset or posedge preset)
	begin
		if(reset == 1'b1)
		begin
		q = 24'b0;
		end
		
		else if(preset == 1'b1)
		begin
		q = 24'b111111111111111111111111;
		end
		
		else begin
		q = q + 1;
		end
	end
	
assign saida = q[23];

endmodule
