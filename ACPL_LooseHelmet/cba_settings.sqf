#define SETTINGS "ACPL LooseHelmet"

[
    "ACPL_LooseHelmet_Enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_LooseHelmet_Enable",localize "STR_ACPL_LooseHelmet_Enable_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_Enabled_Losenvgs", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_LooseHelmet_Enable_losenvgs",localize "STR_ACPL_LooseHelmet_Enable_losenvgs_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_HelmetChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 33, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_WeaponChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 33, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_Destroy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_DestroyChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_Weap_PickUpChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 50, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_Helm_PickUpChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 50, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_LooseHelmet_NVG_PickUpChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_LooseHelmet_HelmetChance",localize "STR_ACPL_LooseHelmet_HelmetChance_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_LooseHelmet", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 50, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;