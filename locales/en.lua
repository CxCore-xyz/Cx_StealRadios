local Translations = {
    error = {
        ["error_notinvehicle"] = "To use the removal kit you have to be in a vehicle!",
        ["error_cooldown"] = "You already stole an radio! Please wait before stealing other radios!",
    },
    progbar = {
        ["progbar_unscrew"] = "Unscrewing Screws",
        ["progbar_remove"] = "Removing Radio",
        ["progbar_cancel"] = "You failed to complete the task!",
        ["progbar_success_radio"] = "Succesfully removed the radio from the vehicle!",
        ["progbar_success_unscrew"] = "Succesfully unscrewed all the screws!",
        ["progbar_dessembly_high"] = "Disassemblying Radio",
        ["progbar_dessembly_low"] = "Disassemblying Radio",
    },
    police = {
        ["police_notify"] = "Someones looking for something in the car!",
    },
    target = {
        ["target_disassembly_label"] = "Disassembly Radios",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})