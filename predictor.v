module predictor(input wire request, result, clk, taken, output reg prediction);

    reg[1:0] Counter;
    initial begin
        Counter = 0;
        prediction = 0;
    end

    always @(posedge clk) begin
        if(request == 1) begin
            prediction = Counter[1];
        end
        if(result == 1) begin
            if(taken == 1) begin
                if(Counter != 2'b11) begin
                    Counter += 1;
                end
            end 
            else begin
                if(Counter != 2'b00) begin
                    Counter -= 1;
                end 
            end
        end
    end

    /*reg[1:0] BHT [255:0];
    reg[7:0] BRH = 8'b0;

    integer i;
    initial begin    
        for(i = 0; i < 256;i = i + 1) begin
            BHT[i] = 0;
        end

        prediction = 0;
    end

    always @(posedge clk) begin
        if(request == 1) begin
            prediction = BHT[BRH][1];
        end
        if(result == 1) begin
            if(taken) begin
                if(BHT[BRH] != 2'b11) begin
                    BHT[BRH] += 1;
                end
            end 
            else begin
                if(BHT[BRH] != 2'b00) begin
                    BHT[BRH] -= 1;
                end 
            end
            BRH = BRH << 1;
            BRH[0] = taken;
        end
    end
    */
endmodule