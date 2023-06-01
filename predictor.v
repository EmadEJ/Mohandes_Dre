module predictor(input wire request, result, clk, taken, output reg prediction);

    reg[1:0] BHT [255:0];
    reg[7:0] BRH;
    always @(posedge clk) begin
        if(request == 1) begin
            prediction = BHT[BRH][1];
        end
        if(result == 1) begin
            if(taken) begin
                if(BHT[BRT] != 2'b11) begin
                    BHT[BRT] += 1;
                end
            end 
            else begin
                if(BHT[BRT] != 2'b00) begin
                    BHT[BRT] -= 1;
                end 
            end
            BRH = BRH << 1;
            BRH[0] = taken;
        end
    end
    
endmodule