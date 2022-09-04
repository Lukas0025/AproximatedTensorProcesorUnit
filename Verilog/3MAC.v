module MAC3 (
	//numbers
	input  wire [7:0] W1,
	input  wire [7:0] I1,
	input  wire [7:0] W2,
	input  wire [7:0] I2,
	input  wire [7:0] W3,
	input  wire [7:0] I3,
	output reg  [7:0] OUTPUT,

	//control
	input wire CLK,
	input wire EN,
	input wire RST
);

	wire mul1out;
	wire mul2out;
	wire mul3out;
	wire sum1out;
	wire sum2out;
	wire sum3out;

	MUL mul1(W1, I1, mul1out);
	MUL mul2(W2, I2, mul2out);
	MUL mul3(W3, I3, mul3out);
	SUM sum1(mul2out, mul1out, sum1out);
	SUM sum2(mul3out, OUTPUT,  sum2out);
	SUm sum3(sum1out, sum2out, sum3out);

	always @(posedge CLK)
	begin
		if (RST)
		begin
			OUTPUT <= 0;
		end
		else if (EN)
		begin
			OUTPUT <= sum3out;
		end
	end
endmodule