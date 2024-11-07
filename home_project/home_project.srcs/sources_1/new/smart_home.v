module home_automation(
    input wire light_control,   // I��k kontrol sinyali (telefon �zerinden)
    input wire door_control,    // Kap� kontrol sinyali (telefon �zerinden)
    output reg light,           // I��k durumu
    output reg door             // Kap� durumu
);

// I��k kontrol�
always @(light_control) begin
    if (light_control) begin
        light = ~light;  // I��k durumu de�i�ir (a�/kapa)
    end
end

// Kap� kontrol�
always @(door_control) begin
    if (door_control) begin
        door = ~door;  // Kap� durumu de�i�ir (a�/kapa)
    end
end

endmodule