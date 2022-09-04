module SUM (
	//numbers
	input  wire [7:0] IN1,
	input  wire [7:0] IN2,
	output wire [7:0] OUTPUT,
);
	assign OUTPUT = IN1 + IN2;
endmodule