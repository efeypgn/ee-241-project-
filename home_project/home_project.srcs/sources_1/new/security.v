module security_system(
    input wire motion_sensor,
    input wire door_sensor,
    output reg alarm
);

always @(motion_sensor or door_sensor) begin
    if (motion_sensor || door_sensor) begin
        alarm = 1;  // Alarmý tetikle
    end else begin
        alarm = 0;  // Alarm kapalý
    end
end
endmodule