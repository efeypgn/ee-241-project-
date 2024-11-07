module home_lighting(
    input wire enable,           // Master enable signal for the system
    input wire switch1,          // Manual switch for light1
    input wire switch2,          // Manual switch for light2
    input wire switch3,          // Manual switch for light3
    input wire timer,            // Timer signal to automate the lights
    output reg light1,           // Output for light1
    output reg light2,           // Output for light2
    output reg light3            // Output for light3
);

// Always block to control lights based on switches and timer
always @(*) begin
    if (enable) begin            // Only control lights if system is enabled
        // Light 1 control
        if (switch1 || timer)
            light1 = 1;
        else
            light1 = 0;
        
        // Light 2 control
        if (switch2 || timer)
            light2 = 1;
        else
            light2 = 0;
        
        // Light 3 control
        if (switch3 || timer)
            light3 = 1;
        else
            light3 = 0;
    end else begin
        // If the system is disabled, turn off all lights
        light1 = 0;
        light2 = 0;
        light3 = 0;
    end
end

endmodule