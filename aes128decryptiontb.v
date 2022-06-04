module testbench_aes128;

reg [0:127] cipher_key,en_msg;
wire [0:127] de_msg;

aes128_decryption m1(en_msg,cipher_key,de_msg);

initial
begin
	$monitor("%s",de_msg);
	ciphertext = {128'h3925841d02dc09fbdc118597196a0b32}
	key = {8'h2b,8'h7e,8'h15,8'h16,8'h28,8'hae,8'hd2,8'ha6,8'hab,8'hf7,8'h15,8'h88,8'h09,8'hcf,8'h4f,8'h3c};
	#100;
end
endmodule
