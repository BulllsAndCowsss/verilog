module mx_2x1(s_1,
              s_0,
              sel,
              m_out);
    
    
    input wire	s_1;
    input wire	s_0;
    input wire	sel;
    output wire	m_out;
    
    wire	SYNTHESIZED_WIRE_0;
    wire	SYNTHESIZED_WIRE_1;
    wire	SYNTHESIZED_WIRE_2;
    
    
    assign	SYNTHESIZED_WIRE_2 = s_1 & sel;
    
    assign	SYNTHESIZED_WIRE_1 = s_0 & SYNTHESIZED_WIRE_0;
    
    assign	m_out = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;
    
    assign	SYNTHESIZED_WIRE_0 = ~sel;
    
    
endmodule
