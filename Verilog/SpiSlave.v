module SPI_Slave (
	//interface
	input  wire CLK,
	input  wire CS,
	input  wire MOSI,
	output reg  MISO,
	
	//inner control
	output wire [7:0] RX_BYTE,
	output wire       RX_DONE,
	input  wire [7:0] TX_BYTE,
	input  wire       WE,
	input  wire       INNER_CLK
);
	reg [2:0] rx_bits_count;

	always @(posedge CLK)
	begin
		if (CS)
		begin
			MISO          <= {MISO[6:0], MOSI};
			rx_bits_count <= rx_bits_count + 1;
		end
	end

	always @(posedge INNER_CLK)
	begin
		if (WE)
		begin
			MISO <= TX_BYTE;
			rx_bits_count <= 0;
		end
	end

	assign RX_DONE = (rx_bits_count == 8) ? 1'b1 : 1'b0;
	assign RX_BYTE = MISO;
endmodule