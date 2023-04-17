

module stim_Gen_ver(
                      req1_cmd_in, req1_data_in, req1_tag_in,
                      req2_cmd_in, req2_data_in, req2_tag_in, 
                      req3_cmd_in, req3_data_in, req3_tag_in, 
                      req4_cmd_in, req4_data_in, req4_tag_in
					  );
 
 output  [3:0]   req1_cmd_in;
 output  [31:0]  req1_data_in;
 output  [1:0]   req1_tag_in;
 
 output  [3:0]   req2_cmd_in;
 output  [31:0]  req2_data_in;
 output  [1:0]   req2_tag_in;
 
 output  [3:0]   req3_cmd_in;
 output  [31:0]  req3_data_in;
 output  [1:0]   req3_tag_in;
 
 output  [3:0]   req4_cmd_in;
 output  [31:0]  req4_data_in;
 output  [1:0]   req4_tag_in;  
 
 reg  [3:0]    req1_cmd_in;
 reg  [31:0]   req1_data_in;
 reg  [1:0]    req1_tag_in;
 
 reg  [3:0]    req2_cmd_in;
 reg  [31:0]   req2_data_in;
 reg  [1:0]    req2_tag_in;
 
 reg  [3:0]    req3_cmd_in;
 reg  [31:0]   req3_data_in;
 reg  [1:0]    req3_tag_in;
 
 reg  [3:0]    req4_cmd_in;
 reg  [31:0]   req4_data_in;
 reg  [1:0]    req4_tag_in;
 
  reg  [31:0]   rand_1_data;
  reg  [31:0]   rand_2_data;
  reg  [31:0]   rand_3_data;
  reg  [31:0]   rand_4_data;
  
  reg  [31:0]   test;
  reg  [31:0]   seed; 
  
  reg  [31:0]   b;
  int i;
  
  reg         a_clk, b_clk, c_clk, reset, scan_in;
  
  
  
  initial 
     begin
	  a_clk = 0;
      b_clk = 0;
      c_clk = 0;
      scan_in = 0;
     forever #5 c_clk= ~c_clk;
   end 	
   
   
   initial
     begin

	reset = 1;
	#30 @(posedge c_clk);
    reset  = 0;
	end

	
	initial begin
test =  32'b11010010111010101010000001011110;
seed =  32'b11000100111010101010011111011110;
end




always 
begin
#5 test  = $random(seed);
#1 test =  test+1;
#1 test =  test+20;
#5 test  = $random(test);
#1 test =  test+50;
end 	
 

 
always 
begin
#6 seed  = $random(test);
#3 seed =  seed+80;
end

	
 initial 
   begin
      req1_cmd_in  =0;
      req1_data_in =0;
      req1_tag_in  =0;
      req2_cmd_in  =0;
      req2_data_in =0;
      req2_tag_in  =0;
      req3_cmd_in  =0;
      req3_data_in =0;
      req3_tag_in  =0;
      req4_cmd_in  =0;
      req4_data_in =0;  
      req4_tag_in  =0;
  end
 
 


initial 
     begin
   
     //--------------------- port 1 -------------------------
	 
     ///////////////////////////////////////////////////////////
     //----------------------test for simple add with tag=0
	 
	 #35  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=1

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=2

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for simple add with tag=3

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
	 #100;
	 
   	 //////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) add with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in = 4'b0001;
          req1_tag_in = 2'b00;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop)add with tag=1
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in = 4'b0001;
          req1_tag_in = 2'b01;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	  	 
	 //-------------------------- test for (for loop)add with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in = 4'b0001;
          req1_tag_in = 2'b10;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop)add with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in = 4'b0001;
          req1_tag_in = 2'b11;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
		  
	 //////////////////////////////////////////////////////////////	  
     //----------------------test for add without carry	with tag=0
	 
	 #10  req1_data_in = 32'b11111011111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000100000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=1

	 #10  req1_data_in = 32'b11111011111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000100000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=2

	 #10  req1_data_in = 32'b11111011111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000100000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for add without carry	with tag=3 
	 
	 #10  req1_data_in = 32'b11111011111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000100000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //////////////////////////////////////////////////////////////////////
     //----------------------test for add with carry(overflow)with tag=0 
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=1 
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=2 
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=3 
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
	 #50;
	 
     /////////////////////////////////////////////////////////////////
     //----------------------test for simple sub with tag=0
	 
	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=1

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=2

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for simple sub with tag=3

	 #10  req1_data_in = 32'b00000000000000000000000000011010;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000101;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
	 #100;
		  
	 //////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) sub with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0010;
          req1_tag_in = 2'b00;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop) sub with tag=1
		 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0010;
          req1_tag_in = 2'b01;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0010;
          req1_tag_in = 2'b10;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0010;
          req1_tag_in = 2'b11;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
	 //////////////////////////////////////////////////////////////
     //----------------------test for sub(equal numbers)with tag=0

	 #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for sub(equal numbers)with tag=1

	 #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=2

	 #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=3

	 #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b10000010000010000000100000100001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
	 //////////////////////////////////////////////////////////	  
     //----------------------test for sub(underflow)with tag=0
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for sub(underflow)with tag=1
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=2
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=3
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
	 #50;	
	 
	 ///////////////////////////////////////////////////////////////	 
     //----------------------test for one time shift left with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for one time shift left with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift left with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for zero time shift left with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift left with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
	 #100;
  
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift left with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0101;
          req1_tag_in = 2'b00;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0101;
          req1_tag_in = 2'b01;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0101;
          req1_tag_in = 2'b10;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0101;
          req1_tag_in = 2'b11;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift left with tag=0
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift left with tag=1
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=2
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=3
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
	 #50;	  

	 ///////////////////////////////////////////////////////////////	 
     //----------------------test one time shift right with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test one time shift right with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift right with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for zero time shift right with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000000;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  

     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift right with tag=0
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=1
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=2
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=3
	 
	 #10  req1_data_in = 32'b11011101111001110001110111101111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000011111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
	 #100;
	 
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift right with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0110;
          req1_tag_in = 2'b00;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0110;
          req1_tag_in = 2'b01;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0110;
          req1_tag_in = 2'b10;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in = 4'b0110;
          req1_tag_in = 2'b11;
          
     #10  req1_data_in = b;
          req1_cmd_in = 4'b0000;
          req1_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift right with tag=0
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift right with tag=1
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=2
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=3
	 
	 #10  req1_data_in = 32'b11111111111111111111111111111111;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00011000000001100000000000111111;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
	 
	 //----------------------test for invalid commands with tag=0
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0111;
          req1_tag_in  = 2'b00;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=1
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0111;
          req1_tag_in  = 2'b01;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=2
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0111;
          req1_tag_in  = 2'b10;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=3
	 
	 #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0111;
          req1_tag_in  = 2'b11;
     #10  req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;	
	// #2000 $stop;
	 end
	 
	 ///////////////////////////////////////////////////////////
	 initial
	 begin
	   ////////////////////////////////////////////////////////////////
	  //--------------------- port 2 -------------------------------//
	 ////////////////////////////////////////////////////////////////
	 
     //----------------------test for simple add with tag=0
	 
#20000     req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=1

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=2

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for simple add with tag=3

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
	 #100;
	 
   	 //////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) add with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in = 4'b0001;
          req2_tag_in = 2'b00;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop)add with tag=1
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in = 4'b0001;
          req2_tag_in = 2'b01;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	  	 
	 //-------------------------- test for (for loop)add with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in = 4'b0001;
          req2_tag_in = 2'b10;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop)add with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in = 4'b0001;
          req2_tag_in = 2'b11;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
		  
	 //////////////////////////////////////////////////////////////	  
     //----------------------test for add without carry	with tag=0
	 
	 #10  req2_data_in = 32'b11111011111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000100000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=1

	 #10  req2_data_in = 32'b11111011111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000100000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=2

	 #10  req2_data_in = 32'b11111011111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000100000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for add without carry	with tag=3 
	 
	 #10  req2_data_in = 32'b11111011111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000100000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //////////////////////////////////////////////////////////////////////
     //----------------------test for add with carry(overflow)with tag=0 
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=1 
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=2 
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=3 
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
	 #50;
	 
     /////////////////////////////////////////////////////////////////
     //----------------------test for simple sub with tag=0
	 
	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=1

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=2

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for simple sub with tag=3

	 #10  req2_data_in = 32'b00000000000000000000000000011010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000101;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
	 #100;
		  
	 //////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) sub with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0010;
          req2_tag_in = 2'b00;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop) sub with tag=1
		 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0010;
          req2_tag_in = 2'b01;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0010;
          req2_tag_in = 2'b10;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0010;
          req2_tag_in = 2'b11;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
	 //////////////////////////////////////////////////////////////
     //----------------------test for sub(equal numbers)with tag=0

	 #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for sub(equal numbers)with tag=1

	 #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=2

	 #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=3

	 #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b10000010000010000000100000100001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
	 //////////////////////////////////////////////////////////	  
     //----------------------test for sub(underflow)with tag=0
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for sub(underflow)with tag=1
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=2
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=3
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
	 #50;	
	 
	 ///////////////////////////////////////////////////////////////	 
     //----------------------test for one time shift left with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for one time shift left with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift left with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for zero time shift left with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift left with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
	 #100;
  
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift left with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0101;
          req2_tag_in = 2'b00;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0101;
          req2_tag_in = 2'b01;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0101;
          req2_tag_in = 2'b10;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req1_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0101;
          req2_tag_in = 2'b11;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift left with tag=0
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift left with tag=1
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=2
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=3
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
	 #50;	  

	 ///////////////////////////////////////////////////////////////	 
     //----------------------test one time shift right with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test one time shift right with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift right with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for zero time shift right with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000000;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  

     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift right with tag=0
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=1
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=2
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=3
	 
	 #10  req2_data_in = 32'b11011101111001110001110111101111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000011111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
	 #100;
	 
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift right with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0110;
          req2_tag_in = 2'b00;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0110;
          req2_tag_in = 2'b01;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0110;
          req2_tag_in = 2'b10;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in = 4'b0110;
          req2_tag_in = 2'b11;
          
     #10  req2_data_in = b;
          req2_cmd_in = 4'b0000;
          req2_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift right with tag=0
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift right with tag=1
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=2
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=3
	 
	 #10  req2_data_in = 32'b11111111111111111111111111111111;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00011000000001100000000000111111;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
	 //----------------------test for invalid commands with tag=0
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0111;
          req2_tag_in  = 2'b00;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=1
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0111;
          req2_tag_in  = 2'b01;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=2
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0111;
          req2_tag_in  = 2'b10;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=3
	 
	 #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0111;
          req2_tag_in  = 2'b11;
     #10  req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;	
	// #2000 $stop;
	 end
	
	 
	 ///////////////////////////////////////////////////////////
	 initial
	 begin
       ////////////////////////////////////////////////////////////////
      //--------------------- port 3 -------------------------------//
	 ////////////////////////////////////////////////////////////////

     //----------------------test for simple add with tag=0
	 
 #40000    req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=1

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=2

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for simple add with tag=3

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
	 #100;
	 
   	 //////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) add with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in = 4'b0001;
          req3_tag_in = 2'b00;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop)add with tag=1
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in = 4'b0001;
          req3_tag_in = 2'b01;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	  	 
	 //-------------------------- test for (for loop)add with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in = 4'b0001;
          req3_tag_in = 2'b10;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop)add with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in = 4'b0001;
          req3_tag_in = 2'b11;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
		  
	 //////////////////////////////////////////////////////////////	  
     //----------------------test for add without carry	with tag=0
	 
	 #10  req3_data_in = 32'b11111011111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000100000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=1

	 #10  req3_data_in = 32'b11111011111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000100000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=2

	 #10  req3_data_in = 32'b11111011111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000100000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for add without carry	with tag=3 
	 
	 #10  req3_data_in = 32'b11111011111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000100000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //////////////////////////////////////////////////////////////////////
     //----------------------test for add with carry(overflow)with tag=0 
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=1 
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=2 
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=3 
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
	 #50;
	 
     /////////////////////////////////////////////////////////////////
     //----------------------test for simple sub with tag=0
	 
	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=1

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=2

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for simple sub with tag=3

	 #10  req3_data_in = 32'b00000000000000000000000000011010;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000101;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
	 #100;
		  
	 //////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) sub with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0010;
          req3_tag_in = 2'b00;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop) sub with tag=1
		 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0010;
          req3_tag_in = 2'b01;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0010;
          req3_tag_in = 2'b10;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0010;
          req3_tag_in = 2'b11;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
	 //////////////////////////////////////////////////////////////
     //----------------------test for sub(equal numbers)with tag=0

	 #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for sub(equal numbers)with tag=1

	 #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=2

	 #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=3

	 #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b10000010000010000000100000100001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
	 //////////////////////////////////////////////////////////	  
     //----------------------test for sub(underflow)with tag=0
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for sub(underflow)with tag=1
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=2
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=3
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
	 #50;	
	 
	 ///////////////////////////////////////////////////////////////	 
     //----------------------test for one time shift left with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for one time shift left with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift left with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for zero time shift left with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift left with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
	 #100;
  
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift left with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0101;
          req3_tag_in = 2'b00;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0101;
          req3_tag_in = 2'b01;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0101;
          req3_tag_in = 2'b10;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0101;
          req3_tag_in = 2'b11;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift left with tag=0
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift left with tag=1
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=2
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=3
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
	 #50;	  

	 ///////////////////////////////////////////////////////////////	 
     //----------------------test one time shift right with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test one time shift right with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift right with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for zero time shift right with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000000;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  

     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift right with tag=0
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=1
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=2
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=3
	 
	 #10  req3_data_in = 32'b11011101111001110001110111101111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000011111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
	 #100;
	 
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift right with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0110;
          req3_tag_in = 2'b00;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0110;
          req3_tag_in = 2'b01;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0110;
          req3_tag_in = 2'b10;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in = 4'b0110;
          req3_tag_in = 2'b11;
          
     #10  req3_data_in = b;
          req3_cmd_in = 4'b0000;
          req3_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift right with tag=0
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift right with tag=1
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=2
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=3
	 
	 #10  req3_data_in = 32'b11111111111111111111111111111111;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00011000000001100000000000111111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
	 //----------------------test for invalid commands with tag=0
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0111;
          req3_tag_in  = 2'b00;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=1
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0111;
          req3_tag_in  = 2'b01;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=2
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0111;
          req3_tag_in  = 2'b10;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=3
	 
	 #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0111;
          req3_tag_in  = 2'b11;
     #10  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;	
	// #2000 $stop;
	 end
	 
	 
	 ////////////////////////////////////////////////////////
	 initial
	 begin
       ////////////////////////////////////////////////////////////////	 
	  //--------------------- port 4 -------------------------------//
	 ////////////////////////////////////////////////////////////////

     //----------------------test for simple add with tag=0
	 
#60000     req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=1

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for simple add with tag=2

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for simple add with tag=3

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 #100;
	 
   	 //////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) add with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in = 4'b0001;
          req4_tag_in = 2'b00;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop)add with tag=1
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in = 4'b0001;
          req4_tag_in = 2'b01;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	  	 
	 //-------------------------- test for (for loop)add with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in = 4'b0001;
          req4_tag_in = 2'b10;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop)add with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in = 4'b0001;
          req4_tag_in = 2'b11;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
		  
	 //////////////////////////////////////////////////////////////	  
     //----------------------test for add without carry	with tag=0
	 
	 #10  req4_data_in = 32'b11111011111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000100000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=1

	 #10  req4_data_in = 32'b11111011111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000100000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for add without carry	with tag=2

	 #10  req4_data_in = 32'b11111011111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000100000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for add without carry	with tag=3 
	 
	 #10  req4_data_in = 32'b11111011111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000100000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //////////////////////////////////////////////////////////////////////
     //----------------------test for add with carry(overflow)with tag=0 
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=1 
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=2 
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for add with carry(overflow)with tag=3 
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	 #50;
	 
     /////////////////////////////////////////////////////////////////
     //----------------------test for simple sub with tag=0
	 
	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=1

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for simple sub with tag=2

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for simple sub with tag=3

	 #10  req4_data_in = 32'b00000000000000000000000000011010;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000101;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	 #100;
		  
	 //////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) sub with tag=0
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0010;
          req4_tag_in = 2'b00;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
	 //-------------------------- test for (for loop) sub with tag=1
		 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0010;
          req4_tag_in = 2'b01;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=2
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0010;
          req4_tag_in = 2'b10;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) sub with tag=3
	 
        for (i= 0, b = 0 ;i < 5 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0010;
          req4_tag_in = 2'b11;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
	 //////////////////////////////////////////////////////////////
     //----------------------test for sub(equal numbers)with tag=0

	 #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for sub(equal numbers)with tag=1

	 #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=2

	 #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for sub(equal numbers)with tag=3

	 #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b10000010000010000000100000100001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
	 //////////////////////////////////////////////////////////	  
     //----------------------test for sub(underflow)with tag=0
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for sub(underflow)with tag=1
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=2
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
	 //----------------------test for sub(underflow)with tag=3
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 #50;	
	 
	 ///////////////////////////////////////////////////////////////	 
     //----------------------test for one time shift left with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for one time shift left with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for one time shift left with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift left with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for zero time shift left with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift left with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift left with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift left with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 #100;
  
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift left with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0101;
          req4_tag_in = 2'b00;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0101;
          req4_tag_in = 2'b01;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0101;
          req4_tag_in = 2'b10;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift left with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0101;
          req4_tag_in = 2'b11;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift left with tag=0
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift left with tag=1
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=2
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift left with tag=3
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	 #50;	  

	 ///////////////////////////////////////////////////////////////	 
     //----------------------test one time shift right with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test one time shift right with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test one time shift right with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     /////////////////////////////////////////////////////////////////
     //----------------------test for zero time shift right with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for zero time shift right with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for zero time shift right with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000000;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  

     /////////////////////////////////////////////////////////////////		  
     //----------------------test for 31 times shift right with tag=0
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=1
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=2
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
     //----------------------test for 31 times shift right with tag=3
	 
	 #10  req4_data_in = 32'b11011101111001110001110111101111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 #100;
	 
     //////////////////////////////////////////////////////////////////////
     //-------------------------- test for (for loop) shift right with tag=0	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0110;
          req4_tag_in = 2'b00;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=1	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0110;
          req4_tag_in = 2'b01;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=2 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0110;
          req4_tag_in = 2'b10;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;
	 
     //-------------------------- test for (for loop) shift right with tag=3	 
	 
	    for (i= 0, b = 0 ;i < 32 ;i++, b++) begin
     #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in = 4'b0110;
          req4_tag_in = 2'b11;
          
     #10  req4_data_in = b;
          req4_cmd_in = 4'b0000;
          req4_tag_in = 2'b00;    
        end
     #100;	 
	 
     //////////////////////////////////////////////////////////////////////
     //----------------------test for big than 31 times shift right with tag=0
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 

     //----------------------test for big than 31 times shift right with tag=1
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=2
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
     //----------------------test for big than 31 times shift right with tag=3
	 
	 #10  req4_data_in = 32'b11111111111111111111111111111111;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00011000000001100000000000111111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	 //----------------------test for invalid commands with tag=0
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0111;
          req4_tag_in  = 2'b00;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=1
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0111;
          req4_tag_in  = 2'b01;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=2
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0111;
          req4_tag_in  = 2'b10;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
		  
	 //----------------------test for invalid commands with tag=3
	 
	 #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0111;
          req4_tag_in  = 2'b11;
     #10  req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	// #2000 $stop;
	 end
	 
	 
	 
	 initial
	 begin
	 	  ///////////////////////////////////////////////////////////////			
     //--------------------- concurrently -----------------------///
	///////////////////////////////////////////////////////////////


     //----------------------test for 4 add concurrently with tag=0
	 
#80000    req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b00;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  

	 
     //----------------------test for 4 add concurrently with tag=1
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b01;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b01;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b01;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b01;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 	 
     //----------------------test for 4 add concurrently with tag=2
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b10;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b10;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b10;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b10;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;

     //----------------------test for 4 add concurrently with tag=3
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0001;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	
	 
	

     //----------------------test for 4 sub concurrently  with tag=0
	 
     #1000 req1_data_in = 32'b00000000000000000000000000000011;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000111;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000001111;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b00;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 
     //----------------------test for 4 sub concurrently with tag=1
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000011;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b01;
          req2_data_in = 32'b00000000000000000000000000000111;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b01;
		  req3_data_in = 32'b00000000000000000000000000001111;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b01;
          req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b01;
 	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 	 
     //----------------------test for 4 sub concurrently with tag=2
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000011;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b10;
          req2_data_in = 32'b00000000000000000000000000000111;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b10;
		  req3_data_in = 32'b00000000000000000000000000001111;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b10;
          req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b10;
  	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;

     //----------------------test for 4 sub concurrently with tag=3
	 
	 #300 req1_data_in = 32'b00000000000000000000000000000011;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000111;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b00000000000000000000000000001111;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000000000000000000011111;
          req4_cmd_in  = 4'b0010;
          req4_tag_in  = 2'b11;
  	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000011;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000111;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000001111;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  

	 
     //----------------------test for 4 shift right concurrently  with tag=0
	 
    #1000 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b00;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 
	 
     //----------------------test for 4 shift right concurrently with tag=1
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b01;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b01;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b01;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b01;
 	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 	 
	 
     //----------------------test for 4 shift right concurrently with tag=2
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b10;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b10;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b10;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b10;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;

	 
     //----------------------test for 4 shift right concurrently with tag=3
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0110;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0110;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0110;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;	
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
		  
    //----------------------test for 4 shift left concurrently  with tag=0
	 
     #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b00;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 
	 
     //----------------------test for 4 shift left concurrently with tag=1
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b01;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b01;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b01;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b01;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;
	 	 
	 
     //----------------------test for 4 shift left concurrently with tag=2
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b10;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b10;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b10;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b10;
 	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;

	 
     //----------------------test for 4 shift left concurrently with tag=3
	 
	 #300 req1_data_in = 32'b11011101111001110001110111101110;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b11011101111001110001110111101110;
          req2_cmd_in  = 4'b0101;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b11011101111001110001110111101110;
          req3_cmd_in  = 4'b0101;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b11011101111001110001110111101110;
          req4_cmd_in  = 4'b0101;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;		  
		  

        //----------------------test for add/sub concurrently with tag=0
	 
    #1000 req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b00;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;			  
	 
     //----------------------test for add/sub concurrently with tag=1
	 
    #300 req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b01;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b01;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b01;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b01;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	
	 	 
     //----------------------test for add/sub concurrently with tag=2
	 
    #300 req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b10;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b10;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b10;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b10;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	

     //----------------------test for add/sub concurrently with tag=3
	 
    #300 req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0010;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0001;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0010;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0001;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00; 

     //----------------------test for all command simultaneously with tag=0
	 
    #1000 req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;

     //----------------------test for all command simultaneously with tag=1
	 
    #300  req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 
	 
     //----------------------test for all command simultaneously with tag=2
	 
    #300  req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;	 
	 
     //----------------------test for all command simultaneously with tag=3 
	 
    #300  req1_data_in = 32'b00000000000000000000000000000111;
          req1_cmd_in  = 4'b0101;
          req1_tag_in  = 2'b11;
          req2_data_in = 32'b00000000000000000000000000000010;
          req2_cmd_in  = 4'b0010;
          req2_tag_in  = 2'b11;
		  req3_data_in = 32'b10000000000000000000000000000000;
          req3_cmd_in  = 4'b0001;
          req3_tag_in  = 2'b11;
          req4_data_in = 32'b00000000000011000000000000000000;
          req4_cmd_in  = 4'b0110;
          req4_tag_in  = 2'b11;
	 #300
	      req1_data_in = 32'b00000000000000000000000000000001;
          req1_cmd_in  = 4'b0000;
          req1_tag_in  = 2'b00;
          req2_data_in = 32'b00000000000000000000000000000001;
          req2_cmd_in  = 4'b0000;
          req2_tag_in  = 2'b00;
		  req3_data_in = 32'b00000000000000000000000000000001;
          req3_cmd_in  = 4'b0000;
          req3_tag_in  = 2'b00;
          req4_data_in = 32'b00000000000000000000000000000001;
          req4_cmd_in  = 4'b0000;
          req4_tag_in  = 2'b00;		  
 		  	  		  
		  
end  


initial begin

      //--------------------- port 1 -------------------------
      //----------------------test for add randomly with tag=1
	  
     #100000   req1_cmd_in   = 4'b0001 ;
               rand_1_data   = $random(seed);
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b01;  
     #10       req1_cmd_in   = 4'b0000 ;
               rand_1_data   = $random(seed);
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=2
	 
     #10       req1_cmd_in   = 4'b0001 ;
               rand_1_data   = $random(seed);
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b10;
     #10       req1_cmd_in   = 4'b0000 ;
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b00;
		 
	 //----------------------test for add randomly with tag=3
			  
     #10       req1_cmd_in   = 4'b0001 ;
               rand_1_data   = $random(seed);
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b11;
     #10       req1_cmd_in   = 4'b0000 ;
               rand_1_data   = $random(seed);
               req1_data_in  = rand_2_data ;
               req1_tag_in   = 2'b00;
		
     //----------------------test for add randomly with tag=0
	 
     #10      req1_cmd_in   = 4'b0001 ;
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b00;
     #10      req1_cmd_in   = 4'b0000 ;
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=1
	 
     #300     req1_cmd_in   = 4'b0010 ;                                                      
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b01;  
     #10      req1_cmd_in   = 4'b0000 ;
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=2
	 
     #10      req1_cmd_in   = 4'b0010 ;
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b10;
     #10      req1_cmd_in   = 4'b0000 ;
              rand_1_data   = $random(seed);
              req1_data_in  = rand_2_data ;
              req1_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=3
	 
     #10     req1_cmd_in   = 4'b0010 ;
             rand_1_data   = $random(seed);
             req1_data_in  = rand_2_data ;
             req1_tag_in   = 2'b11;
     #10     req1_cmd_in   = 4'b0000 ;
             rand_1_data   = $random(seed);
             req1_data_in  = rand_2_data ;
             req1_tag_in   = 2'b00;  
		 
     //----------------------test for sub randomly with tag=0
	 
     #10    req1_cmd_in   = 4'b0010 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;
     #10    req1_cmd_in   = 4'b0000 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;     
		 
     //----------------------test for shift left randomly with tag=1
	 
     #300   req1_cmd_in   = 4'b0101 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b01;  
     #10    req1_cmd_in   = 4'b0000 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10   req1_cmd_in   = 4'b0101 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b10;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00; 
		 
     //----------------------test for shift left randomly with tag=3
	 
     #10   req1_cmd_in   = 4'b0101 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b11;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=0
	 
     #10   req1_cmd_in   = 4'b0101 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;        
		 
     //----------------------test for shift right randomly with tag=1
	 
     #300   req1_cmd_in   = 4'b0110 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b01;  
     #10    req1_cmd_in   = 4'b0000 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;   
		 
     //----------------------test for shift right randomly with tag=2
	 
     #10   req1_cmd_in   = 4'b0110 ;
           rand_1_data   = $random(seed);
           req1_data_in  =  rand_2_data ;
           req1_tag_in   = 2'b10;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req1_cmd_in   = 4'b0110 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b11;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=0
	 
     #10   req1_cmd_in   = 4'b0110 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=1
	 
     #300   req1_cmd_in   = 4'b0001 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b01;  
     #10    req1_cmd_in   = 4'b0000 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;        
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10    req1_cmd_in   = 4'b0101 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b10;
     #10    req1_cmd_in   = 4'b0000 ;
            rand_1_data   = $random(seed);
            req1_data_in  = rand_2_data ;
            req1_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req1_cmd_in   = 4'b0110 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b11;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=0
	 
     #10   req1_cmd_in   = 4'b0010 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;
     #10   req1_cmd_in   = 4'b0000 ;
           rand_1_data   = $random(seed);
           req1_data_in  = rand_2_data ;
           req1_tag_in   = 2'b00;  
		   
		   
		   
     //--------------------- port 2 ------------------------- 
	 
      //----------------------test for add randomly with tag=1
	  
     #800      req2_cmd_in   = 4'b0001 ;
               rand_2_data   = $random(seed);
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b01;  
     #10       req2_cmd_in   = 4'b0000 ;
               rand_2_data   = $random(seed);
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=2
	 
     #10       req2_cmd_in   = 4'b0001 ;
               rand_2_data   = $random(seed);
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b10;
     #10       req2_cmd_in   = 4'b0000 ;
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b00;
		 
	 //----------------------test for add randomly with tag=3
			  
     #10       req2_cmd_in   = 4'b0001 ;
               rand_2_data   = $random(seed);
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b11;
     #10       req2_cmd_in   = 4'b0000 ;
               rand_2_data   = $random(seed);
               req2_data_in  = rand_2_data ;
               req2_tag_in   = 2'b00;
		
     //----------------------test for add randomly with tag=0
	 
     #10      req2_cmd_in   = 4'b0001 ;
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b00;
     #10      req2_cmd_in   = 4'b0000 ;
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=1
	 
     #300     req2_cmd_in   = 4'b0010 ;                                                      
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b01;  
     #10      req2_cmd_in   = 4'b0000 ;
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=2
	 
     #10      req2_cmd_in   = 4'b0010 ;
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b10;
     #10      req2_cmd_in   = 4'b0000 ;
              rand_2_data   = $random(seed);
              req2_data_in  = rand_2_data ;
              req2_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=3
	 
     #10     req2_cmd_in   = 4'b0010 ;
             rand_2_data   = $random(seed);
             req2_data_in  = rand_2_data ;
             req2_tag_in   = 2'b11;
     #10     req2_cmd_in   = 4'b0000 ;
             rand_2_data   = $random(seed);
             req2_data_in  = rand_2_data ;
             req2_tag_in   = 2'b00;  
		 
     //----------------------test for sub randomly with tag=0
	 
     #10    req2_cmd_in   = 4'b0010 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;
     #10    req2_cmd_in   = 4'b0000 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;     
		 
     //----------------------test for shift left randomly with tag=1
	 
     #300   req2_cmd_in   = 4'b0101 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b01;  
     #10    req2_cmd_in   = 4'b0000 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10   req2_cmd_in   = 4'b0101 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b10;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00; 
		 
     //----------------------test for shift left randomly with tag=3
	 
     #10   req2_cmd_in   = 4'b0101 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b11;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=0
	 
     #10   req2_cmd_in   = 4'b0101 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;        
		 
     //----------------------test for shift right randomly with tag=1
	 
     #220   req2_cmd_in   = 4'b0110 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b01;  
     #10    req2_cmd_in   = 4'b0000 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;   
		 
     //----------------------test for shift right randomly with tag=2
	 
     #10   req2_cmd_in   = 4'b0110 ;
           rand_2_data   = $random(seed);
           req2_data_in  =  rand_2_data ;
           req2_tag_in   = 2'b10;
      #10  req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req2_cmd_in   = 4'b0110 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b11;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=0
	 
     #10   req2_cmd_in   = 4'b0110 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=1
	 
     #440   req2_cmd_in   = 4'b0001 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b01;  
     #10    req2_cmd_in   = 4'b0000 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;        
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10    req2_cmd_in   = 4'b0101 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b10;
     #10    req2_cmd_in   = 4'b0000 ;
            rand_2_data   = $random(seed);
            req2_data_in  = rand_2_data ;
            req2_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req2_cmd_in   = 4'b0110 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b11;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=0
	 
     #10   req2_cmd_in   = 4'b0010 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;
     #10   req2_cmd_in   = 4'b0000 ;
           rand_2_data   = $random(seed);
           req2_data_in  = rand_2_data ;
           req2_tag_in   = 2'b00;


		   
     //--------------------- port 3 ------------------------- 
	 
      //----------------------test for add randomly with tag=1
	  
     #800      req3_cmd_in   = 4'b0001 ;
               rand_3_data   = $random(seed);
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b01;  
     #10       req3_cmd_in   = 4'b0000 ;
               rand_3_data   = $random(seed);
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=2
	 
     #10       req3_cmd_in   = 4'b0001 ;
               rand_3_data   = $random(seed);
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b10;
     #10       req3_cmd_in   = 4'b0000 ;
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b00;
		 
	 //----------------------test for add randomly with tag=3
			  
     #10       req3_cmd_in   = 4'b0001 ;
               rand_3_data   = $random(seed);
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b11;
     #10       req3_cmd_in   = 4'b0000 ;
               rand_3_data   = $random(seed);
               req3_data_in  = rand_2_data ;
               req3_tag_in   = 2'b00;
		
     //----------------------test for add randomly with tag=0
	 
     #10      req3_cmd_in   = 4'b0001 ;
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b00;
     #10      req3_cmd_in   = 4'b0000 ;
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=1
	 
     #300     req3_cmd_in   = 4'b0010 ;                                                      
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b01;  
     #10      req3_cmd_in   = 4'b0000 ;
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=2
	 
     #10      req3_cmd_in   = 4'b0010 ;
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b10;
     #10      req3_cmd_in   = 4'b0000 ;
              rand_3_data   = $random(seed);
              req3_data_in  = rand_2_data ;
              req3_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=3
	 
     #10     req3_cmd_in   = 4'b0010 ;
             rand_3_data   = $random(seed);
             req3_data_in  = rand_2_data ;
             req3_tag_in   = 2'b11;
     #10     req3_cmd_in   = 4'b0000 ;
             rand_3_data   = $random(seed);
             req3_data_in  = rand_2_data ;
             req3_tag_in   = 2'b00;  
		 
     //----------------------test for sub randomly with tag=0
	 
     #10    req3_cmd_in   = 4'b0010 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;
     #10    req3_cmd_in   = 4'b0000 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;     
		 
     //----------------------test for shift left randomly with tag=1
	 
     #300   req3_cmd_in   = 4'b0101 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b01;  
     #10    req3_cmd_in   = 4'b0000 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10   req3_cmd_in   = 4'b0101 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b10;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00; 
		 
     //----------------------test for shift left randomly with tag=3
	 
     #10   req3_cmd_in   = 4'b0101 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b11;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=0
	 
     #10   req3_cmd_in   = 4'b0101 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;        
		 
     //----------------------test for shift right randomly with tag=1
	 
     #300   req3_cmd_in   = 4'b0110 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b01;  
     #10    req3_cmd_in   = 4'b0000 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;   
		 
     //----------------------test for shift right randomly with tag=2
	 
     #10   req3_cmd_in   = 4'b0110 ;
           rand_3_data   = $random(seed);
           req3_data_in  =  rand_2_data ;
           req3_tag_in   = 2'b10;
      #10  req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req3_cmd_in   = 4'b0110 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b11;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=0
	 
     #10   req3_cmd_in   = 4'b0110 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=1
	 
     #300   req3_cmd_in   = 4'b0001 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b01;  
     #10    req3_cmd_in   = 4'b0000 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;        
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10    req3_cmd_in   = 4'b0101 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b10;
     #10    req3_cmd_in   = 4'b0000 ;
            rand_3_data   = $random(seed);
            req3_data_in  = rand_2_data ;
            req3_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req3_cmd_in   = 4'b0110 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b11;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=0
	 
     #10   req3_cmd_in   = 4'b0010 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;
     #10   req3_cmd_in   = 4'b0000 ;
           rand_3_data   = $random(seed);
           req3_data_in  = rand_2_data ;
           req3_tag_in   = 2'b00;

     //--------------------- port 4 ------------------------- 
	 
      //----------------------test for add randomly with tag=1
	  
     #800      req4_cmd_in   = 4'b0001 ;
               rand_4_data   = $random(seed);
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b01;  
     #10       req4_cmd_in   = 4'b0000 ;
               rand_4_data   = $random(seed);
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=2
	 
     #10       req4_cmd_in   = 4'b0001 ;
               rand_4_data   = $random(seed);
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b10;
     #10       req4_cmd_in   = 4'b0000 ;
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b00;
		 
	 //----------------------test for add randomly with tag=3
			  
     #10       req4_cmd_in   = 4'b0001 ;
               rand_4_data   = $random(seed);
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b11;
     #10       req4_cmd_in   = 4'b0000 ;
               rand_4_data   = $random(seed);
               req4_data_in  = rand_2_data ;
               req4_tag_in   = 2'b00;
		
     //----------------------test for add randomly with tag=0
	 
     #10      req4_cmd_in   = 4'b0001 ;
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b00;
     #10      req4_cmd_in   = 4'b0000 ;
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=1
	 
     #300     req4_cmd_in   = 4'b0010 ;                                                      
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b01;  
     #10      req4_cmd_in   = 4'b0000 ;
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=2
	 
     #10      req4_cmd_in   = 4'b0010 ;
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b10;
     #10      req4_cmd_in   = 4'b0000 ;
              rand_4_data   = $random(seed);
              req4_data_in  = rand_2_data ;
              req4_tag_in   = 2'b00; 
			  
     //----------------------test for sub randomly with tag=3
	 
     #10     req4_cmd_in   = 4'b0010 ;
             rand_4_data   = $random(seed);
             req4_data_in  = rand_2_data ;
             req4_tag_in   = 2'b11;
     #10     req4_cmd_in   = 4'b0000 ;
             rand_4_data   = $random(seed);
             req4_data_in  = rand_2_data ;
             req4_tag_in   = 2'b00;  
		 
     //----------------------test for sub randomly with tag=0
	 
     #10    req4_cmd_in   = 4'b0010 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;
     #10    req4_cmd_in   = 4'b0000 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;     
		 
     //----------------------test for shift left randomly with tag=1
	 
     #300   req4_cmd_in   = 4'b0101 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b01;  
     #10    req4_cmd_in   = 4'b0000 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10   req4_cmd_in   = 4'b0101 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b10;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00; 
		 
     //----------------------test for shift left randomly with tag=3
	 
     #10   req4_cmd_in   = 4'b0101 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b11;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;      
		 
     //----------------------test for shift left randomly with tag=0
	 
     #10   req4_cmd_in   = 4'b0101 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;        
		 
     //----------------------test for shift right randomly with tag=1
	 
     #220   req4_cmd_in   = 4'b0110 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b01;  
     #10    req4_cmd_in   = 4'b0000 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;   
		 
     //----------------------test for shift right randomly with tag=2
	 
     #10   req4_cmd_in   = 4'b0110 ;
           rand_4_data   = $random(seed);
           req4_data_in  =  rand_2_data ;
           req4_tag_in   = 2'b10;
      #10  req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req4_cmd_in   = 4'b0110 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b11;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=0
	 
     #10   req4_cmd_in   = 4'b0110 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
		 
     //----------------------test for add randomly with tag=1
	 
     #440   req4_cmd_in   = 4'b0001 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b01;  
     #10    req4_cmd_in   = 4'b0000 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;        
		 
     //----------------------test for shift left randomly with tag=2
	 
     #10    req4_cmd_in   = 4'b0101 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b10;
     #10    req4_cmd_in   = 4'b0000 ;
            rand_4_data   = $random(seed);
            req4_data_in  = rand_2_data ;
            req4_tag_in   = 2'b00;
		 
     //----------------------test for shift right randomly with tag=3
	 
     #10   req4_cmd_in   = 4'b0110 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b11;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
		 
     //----------------------test for sub randomly with tag=0
	 
     #10   req4_cmd_in   = 4'b0010 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00;
     #10   req4_cmd_in   = 4'b0000 ;
           rand_4_data   = $random(seed);
           req4_data_in  = rand_2_data ;
           req4_tag_in   = 2'b00; 		   
		 
		 end
		 
		 
 
 
 
 
endmodule




