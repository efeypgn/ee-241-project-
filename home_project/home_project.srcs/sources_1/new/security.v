module security_system(
    input wire motion_sensor,
    input wire door_sensor,
    output reg alarm
);

always @(motion_sensor or door_sensor) begin
    if (motion_sensor || door_sensor) begin
        alarm = 1;  // Alarm� tetikle
    end else begin
        alarm = 0;  // Alarm kapal�
    end
end
endmodule