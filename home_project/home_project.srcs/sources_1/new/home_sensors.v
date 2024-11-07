module sensors_detectors_automation(
    input wire clk,                // System clock
    input wire reset,              // System reset
    input wire smoke_sensor,       // Smoke detector input
    input wire gas_sensor,         // Gas leak detector input
    input wire motion_sensor,      // Motion sensor input
    input wire [7:0] temp_sensor,  // Temperature sensor input (8-bit temperature)
    output reg smoke_alert,        // Smoke alert output
    output reg gas_alert,          // Gas alert output
    output reg motion_alert,       // Motion alert output
    output reg temp_alert          // Temperature alert output
);

// Parameters
parameter TEMP_THRESHOLD = 8'd30; // Temperature threshold (e.g., 30 degrees)

// Sequential block to monitor and update alerts based on sensor inputs
always @(posedge clk or posedge reset) begin
    if (reset) begin
        smoke_alert <= 1'b0;
        gas_alert <= 1'b0;
        motion_alert <= 1'b0;
        temp_alert <= 1'b0;
    end else begin
        // Smoke Alert: Trigger when smoke sensor is activated
        smoke_alert <= smoke_sensor;

        // Gas Alert: Trigger when gas sensor is activated
        gas_alert <= gas_sensor;

        // Motion Alert: Trigger when motion is detected
        motion_alert <= motion_sensor;

        // Temperature Alert: Trigger if temperature exceeds threshold
        temp_alert <= (temp_sensor > TEMP_THRESHOLD) ? 1'b1 : 1'b0;
    end
end

endmodule
