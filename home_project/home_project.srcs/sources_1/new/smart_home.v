module home_automation(
    input wire light_control,   // Iþýk kontrol sinyali (telefon üzerinden)
    input wire door_control,    // Kapý kontrol sinyali (telefon üzerinden)
    output reg light,           // Iþýk durumu
    output reg door             // Kapý durumu
);

// Iþýk kontrolü
always @(light_control) begin
    if (light_control) begin
        light = ~light;  // Iþýk durumu deðiþir (aç/kapa)
    end
end

// Kapý kontrolü
always @(door_control) begin
    if (door_control) begin
        door = ~door;  // Kapý durumu deðiþir (aç/kapa)
    end
end

endmodule