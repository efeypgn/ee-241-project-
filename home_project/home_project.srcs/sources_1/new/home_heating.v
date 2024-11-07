module home_heating(
    input wire enable,                   // Master enable signal for the heating system
    input wire [7:0] temp_setpoint,      // Set-point temperature for all zones
    input wire [7:0] temp_zone1,         // Current temperature in zone 1
    input wire [7:0] temp_zone2,         // Current temperature in zone 2
    input wire [7:0] temp_zone3,         // Current temperature in zone 3
    output reg heat_zone1,               // Heating control for zone 1
    output reg heat_zone2,               // Heating control for zone 2
    output reg heat_zone3                // Heating control for zone 3
);

// Always block to control heating based on temperature comparisons
always @(*) begin
    if (enable) begin
        // Zone 1 heating control
        if (temp_zone1 < temp_setpoint)
            heat_zone1 = 1;              // Turn on heating if below setpoint
        else
            heat_zone1 = 0;              // Turn off heating if at or above setpoint
        
        // Zone 2 heating control
        if (temp_zone2 < temp_setpoint)
            heat_zone2 = 1;              // Turn on heating if below setpoint
        else
            heat_zone2 = 0;              // Turn off heating if at or above setpoint
        
        // Zone 3 heating control
        if (temp_zone3 < temp_setpoint)
            heat_zone3 = 1;              // Turn on heating if below setpoint
        else
            heat_zone3 = 0;              // Turn off heating if at or above setpoint
    end else begin
        // If the system is disabled, turn off heating in all zones
        heat_zone1 = 0;
        heat_zone2 = 0;
        heat_zone3 = 0;
    end
end

endmodule