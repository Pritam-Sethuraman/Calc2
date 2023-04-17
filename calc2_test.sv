`include "calc2_top.v"

module calc2_test;

   wire [0:31] out_data1, out_data2, out_data3, out_data4;
   wire [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
   
   wire scan_out;

   reg 	 a_clk, b_clk, c_clk, reset, scan_in;
   

   
   reg [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
   reg [0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
   reg [0:31]    req1_data_in, req2_data_in, req3_data_in, req4_data_in;
    

   reg [0:31]   expec1    [0:3];
   reg [0:31]   expec2    [0:3];
   reg [0:31]   expec3    [0:3];
   reg [0:31]   expec4    [0:3];
   reg [0:31]   real1     [0:3];
   reg [0:31]   real2     [0:3];
   reg [0:31]   real3     [0:3];
   reg [0:31]   real4     [0:3];
   reg [0:3]    tag_in1   [0:3];
   reg [0:3]    tag_in2   [0:3];
   reg [0:3]    tag_in3   [0:3];
   reg [0:3]    tag_in4   [0:3];
   reg [0:3]    tag_out1  [0:3];
   reg [0:3]    tag_out2  [0:3];
   reg [0:3]    tag_out3  [0:3];
   reg [0:3]    tag_out4  [0:3];
   
   reg    A = 0;
   reg    B = 0;    
   reg    C = 0;
   reg    D = 0;  
   reg    expec_ready1  = 0;
   reg    expec_ready2  = 0;
   reg    expec_ready3  = 0;
   reg    expec_ready4  = 0;
   reg    calc_ready1 = 0;  
   reg    calc_ready2 = 0;  
   reg    calc_ready3 = 0;  
   reg    calc_ready4 = 0; 

   integer  count_A  = 0;  
   integer  count_B  = 0;  
   integer  count_C  = 0;  
   integer  count_D  = 0;  
   integer  counter1 = 0;
   integer  counter2 = 0;
   integer  counter3 = 0;
   integer  counter4 = 0;

   integer  wait_2in1 = 0;    
   integer  wait_2in2 = 0;   
   integer  wait_2in3 = 0;   
   integer  wait_2in4 = 0;   
   
   integer  data_in1_11,data_in1_12, data_in1_21, data_in1_22, data_in1_31, data_in1_32, data_in1_41, data_in1_42 = 0;
   integer  data_in2_11,data_in2_12, data_in2_21, data_in2_22, data_in2_31, data_in2_32, data_in2_41, data_in2_42 = 0;
   integer  data_in3_11,data_in3_12, data_in3_21, data_in3_22, data_in3_31, data_in3_32, data_in3_41, data_in3_42 = 0;
   integer  data_in4_11,data_in4_12, data_in4_21, data_in4_22, data_in4_31, data_in4_32, data_in4_41, data_in4_42 = 0;
   
   integer  cmd1 = 0;
   integer  cmd2 = 0;
   integer  cmd3 = 0;
   integer  cmd4 = 0;
  
   integer  add1 = 0;
   integer  add2 = 0;
   integer  add3 = 0;
   integer  add4 = 0;

   integer  A_out;
   integer  B_out;
   integer  C_out;
   integer  D_out;
        
   integer  i1,j1 = 0;
   integer  i2,j2 = 0;
   integer  i3,j3 = 0;
   integer  i4,j4 = 0;
   
   integer  calc_result1;
   integer  calc_result2;
   integer  calc_result3;
   integer  calc_result4;
 

  
   calc2_top calc2(out_data1, out_data2, out_data3, out_data4, 
                   out_resp1, out_resp2, out_resp3, out_resp4, 
				   out_tag1, out_tag2, out_tag3, out_tag4, 
				   scan_out, a_clk, b_clk, c_clk, 
				   req1_cmd_in, req1_data_in, req1_tag_in, 
				   req2_cmd_in, req2_data_in, req2_tag_in, 
				   req3_cmd_in, req3_data_in, req3_tag_in, 
				   req4_cmd_in, req4_data_in, req4_tag_in, 
				   reset, scan_in
				   );
				   
				   
   stim_Gen_ver stim_Gen_ver(
                             .req1_data_in(req1_data_in), .req2_data_in(req2_data_in),
                             .req3_data_in(req3_data_in), .req4_data_in(req4_data_in),
                             .req1_cmd_in (req1_cmd_in) , .req2_cmd_in (req2_cmd_in) ,
                             .req3_cmd_in (req3_cmd_in) , .req4_cmd_in (req4_cmd_in) ,
                             .req1_tag_in (req1_tag_in) , .req2_tag_in (req2_tag_in) ,
                             .req3_tag_in (req3_tag_in) , .req4_tag_in (req4_tag_in)
							 );

							 
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

	
	
initial
  begin
    calc_result1 = $fopen ("OUTPUT PORT 1.txt", "w");
  end
  
////////////////////////////////////SCOREBOARD///////////////////////////  
always  @ (posedge c_clk)
begin


if (A ==1) begin
if (count_A < 20) begin
count_A = count_A+1 ;
end else begin
A = 0;
expec1   =  {32'bz,32'bz,32'bz,32'bz};
tag_in1  =  {32'bz,32'bz,32'bz,32'bz};
count_A  =  0 ;
end 
end


if  (A == 0) begin

   if ((req1_cmd_in != 1)|(req1_cmd_in != 2)|(req1_cmd_in != 5)|(req1_cmd_in != 6)) 
    begin
    $fdisplay(calc_result1," invalid_command PORT 1 ********\n");
	$fdisplay(calc_result1,"time:%g",$time);     
	$fwrite(calc_result1,"%h\n",req1_cmd_in);
    end

	if ((req1_cmd_in == 1) | (req1_cmd_in == 2) | (req1_cmd_in == 5) | (req1_cmd_in == 6) | (wait_2in1 == 1)) 
	 begin

	 counter1 = counter1+1;
//


	 if    ((counter1 == 1) | (counter1 == 2))	
	  begin
		  expec_ready1 = 0;
		
			if   (counter1 == 1)    
			  begin
			   data_in1_11 = req1_data_in;
			   wait_2in1 = 1;
			   cmd1 = req1_cmd_in;
			   tag_in1[0] <= req1_tag_in;
             end                              
           else if(counter1 == 2)   
		          begin			
			        data_in1_12 = req1_data_in;                                                                                        
			      case (cmd1) 
				      1 :    expec1[0]    <= (data_in1_11  +  data_in1_12); 
				      2 :    expec1[0]    <= (data_in1_11   -  data_in1_12);       
				      5 :    begin 
				              data_in1_12 [31:27]  = 5'b0; 
				              expec1[0]    <= (data_in1_11  <<  data_in1_12);                
				          end
				      6 :    begin
				           data_in1_12 [31:27]  = 5'b0; 
				           expec1[0]    <= (data_in1_11  >>  data_in1_12);
				           end
         default :    expec1[0] <= 32'b00000000000000000000000000000000;                                                                     
			endcase 
      
            wait_2in1 = 0;
            end     
        end 

//		
     if    ((counter1 == 3) | (counter1 == 4)) begin
          if      (counter1 == 3) begin
          data_in1_21 = req1_data_in;
          wait_2in1 = 1;
          cmd1 = req1_cmd_in;
          tag_in1[1] <= req1_tag_in;
          end else if (counter1 == 4)  begin
          data_in1_22 = req1_data_in;
                                                                                        
          case (cmd1)
              1 :     expec1[1]  <= (data_in1_21  +  data_in1_22); 
              2 :     expec1[1]  <= (data_in1_21   -  data_in1_22);       
              5 :     begin
                      data_in1_22 [31:27]  = 5'b0; 
            	         expec1[1]  <= (data_in1_21  <<  data_in1_22);           
          	           end                                                             
              6 :     begin       
                      data_in1_22 [31:27]  = 5'b0; 
		               expec1[1]  <= (data_in1_21  >> data_in1_22);
		               end
          default:    expec1[1]  <=  32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in1 = 0;
          end      
  end  

//
  
     if    ((counter1 == 5) | (counter1 == 6)) begin
          if      (counter1 == 5) begin
          data_in1_31 = req1_data_in;
          wait_2in1 = 1;
          cmd1 = req1_cmd_in;
          tag_in1[2] <= req1_tag_in;
          end                                   
          else if (counter1 == 6) begin
          data_in1_32 = req1_data_in;
                                                                                        
          case (cmd1)
            1 :     expec1[2]  <= (data_in1_31  +  data_in1_32); 
            2 :     expec1[2]  <= (data_in1_31   -  data_in1_32);       
            5 :     begin
                    data_in1_32 [31:27]  = 5'b0; 
       			         expec1[2]  <= (data_in1_31 <<  data_in1_32);                                                                        
     			         end
            6 :    begin
                   data_in1_32 [31:27]  = 5'b0; 
			        expec1[2]  <= (data_in1_31  >>  data_in1_32);
			        end
     default:  expec1[2]  <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in1 = 0;
          end 
  end       
//


  if    ((counter1 == 7) | (counter1 == 8))  begin
          if      (counter1 == 7) begin
          data_in1_41 = req1_data_in;
          wait_2in1 = 1;
          cmd1 = req1_cmd_in;
          tag_in1[3] <= req1_tag_in;
         end                                  
          else if  (counter1 == 8) begin 
          data_in1_42 = req1_data_in;
                                                                                        
          case (cmd1) 
            1 :     expec1[3]  <= (data_in1_41  +  data_in1_42); 
            2 :     expec1[3]  <= (data_in1_41   -  data_in1_42);       
            5 :     begin
                    data_in1_42 [31:27]  = 5'b0; 
			         expec1[3]  <= (data_in1_41 <<  data_in1_42);                                                                        
			         end
            6 :    begin 
                   data_in1_42 [31:27]  = 5'b0; 
			        expec1[3]  <= (data_in1_41 >>  data_in1_42);
			        end
          default:          expec1[3] <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in1 = 0;
          counter1 = 0;
		  expec_ready1 = 1;
          A = 1;
          end
  end        
        
end
end
end



initial
begin
calc_result1 = $fopen ("OUTPUT PORT 1.txt", "w");
end
///////////////////////////////////////////////CHECKER//////////////////////////////////////////////////////////////////////////////////// 
always  @ (posedge c_clk)
begin 
 
	if  ((A == 0) | (A_out == 0)) begin
    A_out = 0;
	if (out_resp1 == 2) begin 
       $fdisplay(calc_result1,"*****overflow/underflow PORT 1 ******\n");
       $fdisplay(calc_result1,"time:%g",$time);     
       $fwrite  (calc_result1);
     end    

    if (out_resp1 == 3) begin 
        $fdisplay(calc_result1,"*****internal error(never happens) PORT 1 ******\n");
        $fdisplay(calc_result1,"time:%g",$time);     
        $fwrite  (calc_result1);
      end 
	  
	  if ((out_resp1 == 1) | (out_resp1 == 2)  | (out_resp1 == 3)) begin
 
      if (add1 <= 3)  begin
  
            if ((out_resp1 == 1) | (out_resp1 == 2)) begin  
            real1[add1] <= out_data1;
            tag_out1[add1]     <= out_tag1;
            add1 = add1+1;
            end      
                                               
            if ( add1 == 4) begin
            add1 = 0;
            calc_ready1 <= 1;
            A_out = 1;
            end else begin
            calc_ready1 <= 0; 
            end 
                    
        end 
     end  
end       
end    


initial
begin
calc_result1 = $fopen ("OUTPUT PORT 1.txt", "w");
end

//
always  @ (posedge c_clk)
begin 

if ((calc_ready1 == 1) & (expec_ready1 == 1)) begin

for (i1 = 0; i1 < 4; i1 = i1 +1) begin
  for (j1 = 0; j1 < 4; j1 = j1 +1) begin
  
   if ( tag_in1[i1] == tag_out1 [j1] ) begin
     if ( expec1[i1] == real1 [j1] ) begin 
    
         $fdisplay(calc_result1,"********************************\n");
         $fdisplay(calc_result1,"time:%g",$time);     
         $fwrite(calc_result1,"%h     %h\n",tag_in1[i1],real1 [j1]);
         
  end
  end 
end
end 

end 
end 

////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////port 2 //////////////////////////
//////////////////////////////////////////////////////////////////////////


initial
begin
calc_result2 = $fopen ("OUTPUT PORT 2.txt", "w");
end


always  @ (posedge c_clk)
begin

if (B ==1) begin
if (count_B < 20) begin
count_B = count_B+1 ;
end else begin
B = 0;
expec2    =  {32'bz,32'bz,32'bz,32'bz};
tag_in2   =  {32'bz,32'bz,32'bz,32'bz};
count_B   =  0 ;
end 
end

if  (B == 0) begin

   if ((req2_cmd_in != 1)|(req2_cmd_in != 2)|(req2_cmd_in != 5)|(req2_cmd_in != 6)) begin
    $fdisplay(calc_result2," invalid_command PORT 2 ********\n");
	$fdisplay(calc_result2,"time:%g",$time);     
	$fwrite(calc_result2,"%h\n",req2_cmd_in);
    end

	if ((req2_cmd_in == 1) | (req2_cmd_in == 2) | (req2_cmd_in == 5) | (req2_cmd_in == 6) | (wait_2in2 == 1)) begin

	counter2 = counter2+1;

//
	if    ((counter2 == 1) | (counter2 == 2))	begin
		expec_ready2 = 0;
		
			if   (counter2 == 1)    begin
			data_in2_11 = req2_data_in;
			wait_2in2 = 1;
			cmd2 = req2_cmd_in;
			tag_in2[0] <= req2_tag_in;
           end  //                            
           else if(counter2 == 2)   begin			
			data_in2_12 = req2_data_in;                                                                                        
			case (cmd2) 
				   1 :    expec2[0]    <= (data_in2_11  +  data_in2_12); 
				   2 :    expec2[0]    <= (data_in2_11   -  data_in2_12);       
				   5 :    begin 
				          data_in2_12 [31:27]  = 5'b0; 
				          expec2[0]    <= (data_in2_11  <<  data_in2_12);                
				          end
				   6 :    begin
				           data_in2_12 [31:27]  = 5'b0; 
				           expec2[0]    <= (data_in2_11  >>  data_in2_12);
				           end
         default :    expec2[0] <= 32'b00000000000000000000000000000000;                                                                     
			endcase 
      
            wait_2in2 = 0;
            end      
        end 

//
		if    ((counter2 == 3) | (counter2 == 4)) begin
          if      (counter2 == 3) begin
          data_in2_21 = req2_data_in;
          wait_2in2 = 1;
          cmd2 = req2_cmd_in;
          tag_in2[1] <= req2_tag_in;
          end else if (counter2 == 4)  begin
          data_in2_22 = req2_data_in;
                                                                                        
          case (cmd2)
              1 :     expec2[1]  <= (data_in2_21  +  data_in2_22); 
              2 :     expec2[1]  <= (data_in2_21   -  data_in2_22);       
              5 :     begin
                      data_in2_22 [31:27]  = 5'b0; 
            	         expec2[1]  <= (data_in2_21  <<  data_in2_22);           
          	           end                                                             
              6 :     begin       
                      data_in2_22 [31:27]  = 5'b0; 
		               expec2[1]  <= (data_in2_21  >> data_in2_22);
		               end
          default:    expec2[1]  <=  32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in2 = 0;
          end      
  end                              


//

  if    ((counter2 == 5) | (counter2 == 6)) begin
          if      (counter2 == 5) begin
          data_in2_31 = req2_data_in;
          wait_2in2 = 1;
          cmd2 = req2_cmd_in;
          tag_in2[2] <= req2_tag_in;
          end                                   
          else if (counter2 == 6) begin
          data_in2_32 = req2_data_in;
                                                                                        
          case (cmd2)
            1 :     expec2[2]  <= (data_in2_31  +  data_in2_32); 
            2 :     expec2[2]  <= (data_in2_31   -  data_in2_32);       
            5 :     begin
                    data_in2_32 [31:27]  = 5'b0; 
       			         expec2[2]  <= (data_in2_31 <<  data_in2_32);                                                                        
     			         end
            6 :    begin
                   data_in2_32 [31:27]  = 5'b0; 
			        expec2[2]  <= (data_in2_31  >>  data_in2_32);
			        end
     default:  expec2[2]  <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in2 = 0;
          end 
  end 


//
  if    ((counter2 == 7) | (counter2 == 8))  begin
          if      (counter2 == 7) begin
          data_in2_41 = req2_data_in;
          wait_2in2 = 1;
          cmd2 = req2_cmd_in;
          tag_in2[3] <= req2_tag_in;
         end                                  
          else if  (counter2 == 8) begin 
          data_in2_42 = req2_data_in;
                                                                                        
          case (cmd2) 
            1 :     expec2[3]  <= (data_in2_41  +  data_in2_42); 
            2 :     expec2[3]  <= (data_in2_41   -  data_in2_42);       
            5 :     begin
                    data_in2_42 [31:27]  = 5'b0; 
			         expec2[3]  <= (data_in2_41 <<  data_in2_42);                                                                        
			         end
            6 :    begin 
                   data_in2_42 [31:27]  = 5'b0; 
			        expec2[3]  <= (data_in2_41 >>  data_in2_42);
			        end
          default:          expec2[3] <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in2 = 0;
          counter2= 0;
		  expec_ready2 = 1;
          B = 1;
          end
  end 
  
  end
end
end


//
initial
begin
calc_result2 = $fopen ("OUTPUT PORT 2.txt", "w");
end


always  @ (posedge c_clk)
begin 
    
	if  ((B == 0) | (B_out == 0)) begin
    B_out = 0;
	
	if (out_resp2 == 2) begin 
$fdisplay(calc_result2,"*****overflow/underflow PORT 2 ******\n");
$fdisplay(calc_result2,"time:%g",$time);     
$fwrite  (calc_result2);
 end    

if (out_resp2 == 3) begin 
$fdisplay(calc_result2,"*****internal error(never happens) PORT 2 ******\n");
$fdisplay(calc_result2,"time:%g",$time);     
$fwrite  (calc_result2);
 end 

 if ((out_resp2 == 1) | (out_resp2 == 2)  | (out_resp2 == 3)) begin
 
      if (add2 <= 3)  begin
  
            if ((out_resp2 == 1) | (out_resp2 == 2)) begin  
            real2[add2] <= out_data2;
            tag_out2[add2]     <= out_tag2;
            add2 = add2+1;
            end      
                                               
            if ( add2 == 4) begin
            add2 = 0;
            calc_ready2 <= 1;
            B_out = 1;
            end else begin
            calc_ready2 <= 0; 
            end 
                    
        end 
     end  
end       
end 


initial
begin
calc_result2 = $fopen ("OUTPUT PORT 2.txt", "w");
end



always  @ (posedge c_clk)
begin 

if ((calc_ready2 == 1) & (expec_ready2 == 1)) begin

for (i2 = 0; i2 < 4; i2= i2 +1) begin
  for (j2 = 0; j2 < 4; j2 = j2 +1) begin
  
   if ( tag_in2[i2] == tag_out2 [j2] ) begin
     if ( expec2[i2] == real2 [j2] ) begin 
    
$fdisplay(calc_result2,"********************************\n");
$fdisplay(calc_result2,"time:%g",$time);     
$fwrite(calc_result2,"%h     %h\n",tag_in2[i2],real2 [j2]);
         
  end
  end 
end
end 

end 
end 

///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////port 3///////////////////////
/////////////////////////////////////////////////////////////////////////////////

initial
begin
calc_result3 = $fopen ("OUTPUT PORT 3.txt", "w");
end


always  @ (posedge c_clk)
begin

if (C ==1) begin
if (count_C < 20) begin
count_C = count_C +1 ;
end else begin
C = 0;
expec3    =  {32'bz,32'bz,32'bz,32'bz};
tag_in3   =  {32'bz,32'bz,32'bz,32'bz};
count_C   =  0 ;
end 
end


if  (C == 0) begin

   if ((req3_cmd_in != 1)|(req3_cmd_in != 2)|(req3_cmd_in != 5)|(req3_cmd_in != 6)) begin
   $fdisplay(calc_result3," invalid_command PORT 3 ********\n");
	$fdisplay(calc_result3,"time:%g",$time);     
	$fwrite(calc_result3,"%h\n",req3_cmd_in);
    end

	if ((req3_cmd_in == 1) | (req3_cmd_in == 2) | (req3_cmd_in == 5) | (req3_cmd_in == 6) | (wait_2in3 == 1)) begin

	counter3 = counter3+1;


	if    ((counter3 == 1) | (counter3 == 2))	begin
		expec_ready3 = 0;
		
			if   (counter3 == 1)    begin
			data_in3_11 = req3_data_in;
			wait_2in3 = 1;
			cmd3 = req3_cmd_in;
			tag_in3[0] <= req3_tag_in;
           end  
		   
           else if(counter3 == 2)   begin			
			data_in3_12 = req3_data_in;                                                                                        
			case (cmd3) 
				   1 :    expec3[0]    <= (data_in3_11  +  data_in3_12); 
				   2 :    expec3[0]    <= (data_in3_11   -  data_in3_12);       
				   5 :    begin 
				          data_in3_12 [31:27]  = 5'b0; 
				          expec3[0]    <= (data_in3_11  <<  data_in3_12);                
				          end
				   6 :    begin
				           data_in3_12 [31:27]  = 5'b0; 
				           expec3[0]    <= (data_in3_11  >>  data_in3_12);
				           end
         default :    expec3[0] <= 32'b00000000000000000000000000000000;                                                                     
			endcase 
      
            wait_2in3 = 0;
            end      
        end  
		if    ((counter3 == 3) | (counter3 == 4)) begin
          if      (counter3 == 3) begin
          data_in3_21 = req3_data_in;
          wait_2in3 = 1;
          cmd3 = req3_cmd_in;
          tag_in3[1] <= req3_tag_in;
          end else if (counter3 == 4)  begin
          data_in3_22 = req3_data_in;
                                                                                        
          case (cmd3)
              1 :     expec3[1]  <= (data_in3_21  +  data_in3_22); 
              2 :     expec3[1]  <= (data_in3_21   -  data_in3_22);       
              5 :     begin
                      data_in3_22 [31:27]  = 5'b0; 
            	         expec3[1]  <= (data_in3_21  <<  data_in3_22);           
          	           end                                                             
              6 :     begin       
                      data_in3_22 [31:27]  = 5'b0; 
		               expec3[1]  <= (data_in3_21  >> data_in3_22);
		               end
          default:    expec3[1]  <=  32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in3 = 0;
          end      
  end


  if    ((counter3 == 5) | (counter3 == 6)) begin
          if      (counter3 == 5) begin
          data_in3_31 = req3_data_in;
          wait_2in3 = 1;
          cmd3 = req3_cmd_in;
          tag_in3[2] <= req3_tag_in;
          end                                   
          else if (counter3 == 6) begin
          data_in3_32 = req3_data_in;
                                                                                        
          case (cmd3)
            1 :     expec3[2]  <= (data_in3_31  +  data_in3_32); 
            2 :     expec3[2]  <= (data_in3_31   -  data_in3_32);       
            5 :     begin
                    data_in3_32 [31:27]  = 5'b0; 
       			         expec3[2]  <= (data_in3_31 <<  data_in3_32);                                                                        
     			         end
            6 :    begin
                   data_in3_32 [31:27]  = 5'b0; 
			        expec3[2]  <= (data_in3_31  >>  data_in3_32);
			        end
     default:  expec3[2]  <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in3 = 0;
          end 
  end 

  if    ((counter3 == 7) | (counter3 == 8))  begin
          if      (counter3 == 7) begin
          data_in3_41 = req3_data_in;
          wait_2in3 = 1;
          cmd3 = req3_cmd_in;
          tag_in3[3] <= req3_tag_in;
         end                                  
          else if  (counter3== 8) begin 
          data_in3_42 = req3_data_in;
                                                                                        
          case (cmd3) 
            1 :     expec3[3]  <= (data_in3_41  +  data_in3_42); 
            2 :     expec3[3]  <= (data_in3_41   -  data_in3_42);       
            5 :     begin
                    data_in3_42 [31:27]  = 5'b0; 
			         expec3[3]  <= (data_in3_41 <<  data_in3_42);                                                                        
			         end
            6 :    begin 
                   data_in3_42 [31:27]  = 5'b0; 
			        expec3[3]  <= (data_in3_41 >>  data_in3_42);
			        end
          default:          expec3[3] <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in3 = 0;
          counter3= 0;
		  expec_ready3 = 1;
          C = 1;
          end
  end
  
  end
end
end



initial
begin
calc_result3 = $fopen ("OUTPUT PORT 3.txt", "w");
end

always  @ (posedge c_clk)
begin 
    
	if  ((C == 0) | (C_out == 0)) begin
    C_out = 0;
	
	if (out_resp3 == 2) begin 
$fdisplay(calc_result3,"*****overflow/underflow PORT 3 ******\n");
$fdisplay(calc_result3,"time:%g",$time);     
$fwrite  (calc_result3);
 end    

if (out_resp3 == 3) begin 
$fdisplay(calc_result3,"*****internal error(never happens)PORT 3 ******\n");
$fdisplay(calc_result3,"time:%g",$time);     
$fwrite  (calc_result3);
 end 
 
 if ((out_resp3 == 1) | (out_resp3 == 2)  | (out_resp3 == 3)) begin
 
      if (add3 <= 3)  begin
  
            if ((out_resp3 == 1) | (out_resp3 == 2)) begin  
            real3[add3] <= out_data3;
            tag_out3[add3]     <= out_tag3;
            add3 = add3+1;
            end      
                                               
            if ( add3 == 4) begin
            add3 = 0;
            calc_ready3 <= 1;
            C_out = 1;
            end else begin
            calc_ready3 <= 0; 
            end 
                    
        end 
     end  
end       
end

initial
begin
calc_result3 = $fopen ("OUTPUT PORT 3.txt", "w");
end


always  @ (posedge c_clk)
begin 

if ((calc_ready3 == 1) & (expec_ready3 == 1)) begin

for (i3 = 0; i3 < 4; i3= i3 +1) begin
  for (j3 = 0; j3< 4; j3 = j3 +1) begin
  
   if ( tag_in3[i3] == tag_out3 [j3] ) begin
     if ( expec3[i3] == real3 [j3] ) begin 
    
$fdisplay(calc_result3,"********************************\n");
$fdisplay(calc_result3,"time:%g",$time);     
$fwrite(calc_result3,"%h     %h\n",tag_in3[i3],real3 [j3]);
         
  end
  end 
end 
end 

end 
end 


////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////port 4 //////////////////////////
//////////////////////////////////////////////////////////////////////////


initial
begin
calc_result4 = $fopen ("OUTPUT PORT 4.txt", "w");
end


always  @ (posedge c_clk)
begin

if (D ==1) begin
if (count_D < 20) begin
count_D = count_D + 1 ;
end else begin
D= 0;
expec4    =  {32'bz,32'bz,32'bz,32'bz};
tag_in4   =  {32'bz,32'bz,32'bz,32'bz};
count_D   =  0 ;
end 
end

if  (D == 0) begin

   if ((req4_cmd_in != 1)|(req4_cmd_in != 2)|(req4_cmd_in != 5)|(req4_cmd_in != 6)) begin
    $fdisplay(calc_result4," invalid_command PORT 4 ********\n");
	$fdisplay(calc_result4,"time:%g",$time);     
	$fwrite(calc_result4,"%h\n",req4_cmd_in);
    end

	if ((req4_cmd_in == 1) | (req4_cmd_in == 2) | (req4_cmd_in == 5) | (req4_cmd_in == 6) | (wait_2in4 == 1)) begin

	counter4 = counter4+1;


	if    ((counter4 == 1) | (counter4 == 2))	begin
		expec_ready4 = 0;
		
			if   (counter4 == 1)    begin
			data_in4_11 = req4_data_in;
			wait_2in4 = 1;
			cmd4= req4_cmd_in;
			tag_in4[0] <= req4_tag_in;
           end  //                            
           else if(counter4 == 2)   begin			
			data_in4_12 = req4_data_in;                                                                                        
			case (cmd4) 
				   1 :    expec4[0]    <= (data_in4_11  +  data_in4_12); 
				   2 :    expec4[0]    <= (data_in4_11   -  data_in4_12);       
				   5 :    begin 
				          data_in4_12 [31:27]  = 5'b0; 
				          expec4[0]    <= (data_in4_11  <<  data_in4_12);                
				          end
				   6 :    begin
				           data_in4_12 [31:27]  = 5'b0; 
				           expec4[0]    <= (data_in4_11  >>  data_in4_12);
				           end
         default :    expec4[0] <= 32'b00000000000000000000000000000000;                                                                     
			endcase 
      
            wait_2in4 = 0;
            end     
        end 

		if    ((counter4== 3) | (counter4 == 4)) begin
          if      (counter4 == 3) begin
          data_in4_21 = req4_data_in;
          wait_2in4 = 1;
          cmd4 = req4_cmd_in;
          tag_in4[1] <= req4_tag_in;
          end else if (counter4 == 4)  begin
          data_in4_22 = req4_data_in;
                                                                                        
          case (cmd4)
              1 :     expec4[1]  <= (data_in4_21  +  data_in4_22); 
              2 :     expec4[1]  <= (data_in4_21   -  data_in4_22);       
              5 :     begin
                      data_in4_22 [31:27]  = 5'b0; 
            	         expec4[1]  <= (data_in4_21  <<  data_in4_22);           
          	           end                                                             
              6 :     begin       
                      data_in4_22 [31:27]  = 5'b0; 
		               expec4[1]  <= (data_in4_21  >> data_in4_22);
		               end
          default:    expec4[1]  <=  32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in4 = 0;
          end    
  end

  if    ((counter4 == 5) | (counter4== 6)) begin
          if      (counter4 == 5) begin
          data_in4_31 = req4_data_in;
          wait_2in4 = 1;
          cmd4 = req4_cmd_in;
          tag_in4[2] <= req4_tag_in;
          end                                   
          else if (counter4 == 6) begin
          data_in4_32 = req4_data_in;
                                                                                        
          case (cmd4)
            1 :     expec4[2]  <= (data_in4_31  +  data_in4_32); 
            2 :     expec4[2]  <= (data_in4_31   -  data_in4_32);       
            5 :     begin
                    data_in4_32 [31:27]  = 5'b0; 
       			         expec4[2]  <= (data_in4_31 <<  data_in4_32);                                                                        
     			         end
            6 :    begin
                   data_in4_32 [31:27]  = 5'b0; 
			        expec4[2]  <= (data_in4_31  >>  data_in4_32);
			        end
     default:  expec4[2]  <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in4 = 0;
          end 
  end 
  


  if    ((counter4 == 7) | (counter4 == 8))  begin
          if      (counter4 == 7) begin
          data_in4_41 = req4_data_in;
          wait_2in4 = 1;
          cmd4 = req4_cmd_in;
          tag_in4[3] <= req4_tag_in;
         end                                  
          else if  (counter4== 8) begin 
          data_in4_42 = req4_data_in;
                                                                                        
          case (cmd4) 
            1 :     expec4[3]  <= (data_in4_41  +  data_in4_42); 
            2 :     expec4[3]  <= (data_in4_41   -  data_in4_42);       
            5 :     begin
                    data_in4_42 [31:27]  = 5'b0; 
			         expec4[3]  <= (data_in4_41 <<  data_in4_42);                                                                        
			         end
            6 :    begin 
                   data_in4_42 [31:27]  = 5'b0; 
			        expec4[3]  <= (data_in4_41 >>  data_in4_42);
			        end
          default:          expec4[3] <= 32'b00000000000000000000000000000000;                                                                     
		  endcase 
      
          wait_2in4 = 0;
          counter4= 0;
		  expec_ready4 = 1;
          D = 1;
          end
  end       
      
end
end
end


initial
begin
calc_result4 = $fopen ("OUTPUT PORT 4.txt", "w");
end

always  @ (posedge c_clk)
begin 

    
	if  ((D == 0) | (D_out == 0)) begin
    D_out = 0;
	
	if (out_resp4 == 2) begin 
$fdisplay(calc_result4,"*****overflow/underflow PORT 4 ******\n");
$fdisplay(calc_result4,"time:%g",$time);     
$fwrite  (calc_result4);
 end    

if (out_resp4 == 3) begin 
$fdisplay(calc_result4,"*****internal error(never happens)PORT 4 ******\n");
$fdisplay(calc_result4,"time:%g",$time);     
$fwrite  (calc_result4);
 end  


 if ((out_resp4 == 1) | (out_resp4 == 2)  | (out_resp4 == 3)) begin
 
      if (add4 <= 3)  begin
  
            if ((out_resp4 == 1) | (out_resp4 == 2)) begin  
            real4[add4] <= out_data4;
            tag_out4[add4] <= out_tag4;
            add4 = add4+1;
            end      
                                               
            if ( add4 == 4) begin
            add4 = 0;
            calc_ready4 <= 1;
            D_out = 1;
            end else begin
            calc_ready4 <= 0; 
            end 
                    
        end 
     end
	 
end       
end 


initial
begin
calc_result4 = $fopen ("OUTPUT PORT 4.txt", "w");
end

always  @ (posedge c_clk)
begin 

if ((calc_ready4 == 1) & (expec_ready4 == 1)) begin

for (i4 = 0; i4 < 4; i4= i4 +1) begin
  for (j4 = 0; j4< 4; j4 = j4 +1) begin
  
   if ( tag_in4[i4] == tag_out4 [j4] ) begin
     if ( expec4[i4] == real4[j4] ) begin 
    
$fdisplay(calc_result4,"********************************\n");
$fdisplay(calc_result4,"time:%g",$time);     
$fwrite(calc_result4,"%h     %h\n",tag_in4[i4],real4 [j4]);
         
  end
  end 
end
end 

end 
end 

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////assertions/////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////


// valid command values
//The cmd_values sequence specifies the valid command values
sequence cmd_values (cmd_in);
@(posedge c_clk) (cmd_in == 1 || cmd_in == 2 || cmd_in == 5 || cmd_in == 6);
endsequence

//
sequence cmd_resp_protocol (cmd_in, resp_out);
@(posedge c_clk) cmd_in != 0 ##0 cmd_values(cmd_in) ##1 (cmd_in == 0 && resp_out == 0)[*2:$] ##1 ((resp_out == 0 || resp_out == 1));
endsequence


//the same cycle (|->) in  cmd_in doesn’t equal zero, a valid command is seen, followed by (##1) at least two or more consecutive cycles ([*2:$]) in which both cmd_in and resp_out equal zero, followed by (##1) a response value of either 0 or 1
property valid_cmd (cmd_in, resp_out);
@(posedge c_clk) cmd_in != 0 |-> cmd_values(cmd_in) ##1 (cmd_in == 0 && resp_out == 0)[*2:$] ##1 (resp_out == 0 || resp_out == 1);
endproperty

//
sequence add_sub_cmd (cmd_in, resp_out);
@(posedge c_clk) (cmd_in == 1 || cmd_in == 2) ##1 (cmd_in == 0 && resp_out == 0)[*2:$] ##1 resp_out != 0;
endsequence

chk1_cmd_valid: assert property(valid_cmd(req1_cmd_in, out_resp1));
chk2_cmd_valid: assert property(valid_cmd(req2_cmd_in, out_resp2));
chk3_cmd_valid: assert property(valid_cmd(req3_cmd_in, out_resp3));
chk4_cmd_valid: assert property(valid_cmd(req4_cmd_in, out_resp4)); 

//
property add_data (cmd_in, data_in, resp_out, data_out);
int x;
@(posedge c_clk) ($rose(cmd_in == 1), x=data_in) |=> ($rose(resp_out == 0 && cmd_in == 0), x=x+data_in) ##1 (resp_out == 0 && cmd_in == 0)[*0:$] ##1 $rose(resp_out != 1) ##0 data_out == x;
endproperty


chk1_add_data: assert property(add_data(req1_cmd_in, req1_data_in, out_resp1, out_data1));
chk2_add_data: assert property(add_data(req2_cmd_in, req2_data_in, out_resp2, out_data2));
chk3_add_data: assert property(add_data(req3_cmd_in, req3_data_in, out_resp3, out_data3));
chk4_add_data: assert property(add_data(req4_cmd_in, req4_data_in, out_resp4, out_data4));


//
property add_resp (cmd_in, data_in, resp_out);
bit [0:32] x;
@(posedge c_clk) ($rose(cmd_in == 1), x={1'b0,data_in}) |=> ($rose(resp_out == 0 && cmd_in == 0), x=x+{1'b0,data_in}) ##1
  (resp_out == 0 && cmd_in == 0)[*0:$] ##1 $rose(resp_out != 1) |-> if (x <= 1000000000) (resp_out == 1)else resp_out == 2;
endproperty

chk1_add_resp: assert property(add_resp(req1_cmd_in, req1_data_in, out_resp1));
chk2_add_resp: assert property(add_resp(req2_cmd_in, req2_data_in, out_resp2));
chk3_add_resp: assert property(add_resp(req3_cmd_in, req3_data_in, out_resp3));
chk4_add_resp: assert property(add_resp(req4_cmd_in, req4_data_in, out_resp4));

//underflow or overflow responses
property valid_ovr_undr_flow_resp (cmd_in, resp_out);
@(posedge c_clk) resp_out == 2 |-> add_sub_cmd(cmd_in, resp_out).ended;
endproperty



chk1_ovr_undr_flow_resp: assert property(valid_ovr_undr_flow_resp(req1_cmd_in, out_resp1));
chk2_ovr_undr_flow_resp: assert property(valid_ovr_undr_flow_resp(req2_cmd_in, out_resp2));
chk3_ovr_undr_flow_resp: assert property(valid_ovr_undr_flow_resp(req3_cmd_in, out_resp3));
chk4_ovr_undr_flow_resp: assert property(valid_ovr_undr_flow_resp(req4_cmd_in, out_resp4)); 


endmodule	
