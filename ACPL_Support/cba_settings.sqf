#define SETTINGS "ACPL Support"

[
    "ACPL_Support_Heal_HealingModifer", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_Support_CBA_Heal_HealModifier", localize "STR_ACPL_Support_CBA_Heal_HealModifier_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_Support_CBA", localize "STR_ACPL_Support_CBA_Heal"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_Support_Heal_LeaveRubbish", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_Support_CBA_Heal_Rubbish", localize "STR_ACPL_Support_CBA_Heal_Rubbish_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_Support_CBA", localize "STR_ACPL_Support_CBA_Heal"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_Support_Heal_RubbishPerTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_Support_CBA_Heal_RubbishPerTime", localize "STR_ACPL_Support_CBA_Heal_RubbishPerTime_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_Support_CBA", localize "STR_ACPL_Support_CBA_Heal"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 120, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;