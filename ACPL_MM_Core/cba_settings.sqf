#define SETTINGS "ACPL MM Core"

[
    "ACPL_MM_Core_MedicalSupplies_Enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_MM_Core_Set_Med_En", localize "STR_ACPL_MM_Core_Set_Med_En_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_ban", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_e_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_e_ban", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 4, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_p_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_p_ban", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_atropine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_atropine", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_adenosine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_adenosine", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_epinephrine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_epinephrine", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_morphine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_morphine", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_PAK", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_PAK", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_torniquet", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_torniquet", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_plasma250", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_plasma250", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_plasma500", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_plasma500", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_saline250", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_saline250", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_saline500", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_saline500", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_quicklot", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_quicklot", localize "STR_ACPL_MM_Core_Set_Meds_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_nonmed"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_ban", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 16, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_e_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_e_ban", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 18, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_p_bandages", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_p_ban", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_atropine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_atropine", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 4, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_adenosine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_adenosine", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 4, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_epinephrine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_epinephrine", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 14, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_morphine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_morphine", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 14, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_PAK", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_PAK", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_torniquet", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_torniquet", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_plasma250", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_plasma250", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_plasma500", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_plasma500", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 1, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_plasma1", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_plasma1", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_saline250", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_saline250", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_saline500", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_saline500", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_saline1", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_saline1", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_blood250", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_blood250", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_blood500", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_blood500", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_blood1", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_blood1", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_quicklot", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_quicklot", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_MedicalSupplies_med_sewing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [localize "STR_ACPL_MM_Core_Set_sewing", localize "STR_ACPL_MM_Core_Set_Meds_med_desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Set_Menu_Med_med"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_Camo_enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_MM_Core_Camo_Enabled_Name", localize "STR_ACPL_MM_Core_Camo_Enabled_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Camo_Enabled_Sec"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_MM_Core_Camo_groupAI_enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [localize "STR_ACPL_MM_Core_Camo_groupAI_Enabled_Name", localize "STR_ACPL_MM_Core_Camo_groupAI_Enabled_Desc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_MM_Core_Set_Menu", localize "STR_ACPL_MM_Core_Camo_Enabled_Sec"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;