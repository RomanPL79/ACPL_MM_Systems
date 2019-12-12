#define SETTINGS "ACPL SkillSystem"

[
    "ACPL_SkillSystem_Enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enable ACPL SkillSystem",localize "STR_ACPL_SkillSystem_settings_module_enable"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    localize "STR_ACPL_SkillSystem_settings_name", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_Enabled_West", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enable WEST", localize "STR_ACPL_SkillSystem_settings_module_WEST_enable"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_random_str", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Random", localize "STR_ACPL_SkillSystem_settings_module_Random"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_acc_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [min]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_acc_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [max]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_shake_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [min]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_shake_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [max]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_speed_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_speed_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_spot_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [min]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_spot_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [max]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_time_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [min]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_time_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [max]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_general_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [min]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_general_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [max]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_courage_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [min]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_courage_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [max]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_reload_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_west_reload_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "WEST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_Enabled_East", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enable EAST", localize "STR_ACPL_SkillSystem_settings_module_EAST_enable"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_random_str", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Random", localize "STR_ACPL_SkillSystem_settings_module_Random"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_acc_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [min]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_acc_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [max]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_shake_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [min]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_shake_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [max]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_speed_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_speed_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_spot_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [min]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_spot_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [max]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_time_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [min]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_time_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [max]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_general_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [min]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_general_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [max]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_courage_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [min]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_courage_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [max]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_reload_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_east_reload_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "EAST"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_Enabled_Resistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enable RESISTANCE", localize "STR_ACPL_SkillSystem_settings_module_RESISTANCE_enable"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_random_str", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Random", localize "STR_ACPL_SkillSystem_settings_module_Random"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_acc_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [min]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_acc_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Acc [max]", localize "STR_ACPL_SkillSystem_settings_module_Acc"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_shake_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [min]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_shake_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Shake [max]", localize "STR_ACPL_SkillSystem_settings_module_Shake"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_speed_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_speed_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Aim Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Speed"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_spot_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [min]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_spot_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Distance [max]", localize "STR_ACPL_SkillSystem_settings_module_Spot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_time_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [min]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_time_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spot Time [max]", localize "STR_ACPL_SkillSystem_settings_module_Time"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_general_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [min]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_general_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["General [max]", localize "STR_ACPL_SkillSystem_settings_module_General"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_courage_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [min]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_courage_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Courage [max]", localize "STR_ACPL_SkillSystem_settings_module_Courage"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.6", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_reload_min", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [min]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.2", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "ACPL_SkillSystem_resistance_reload_max", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Reload Speed [max]", localize "STR_ACPL_SkillSystem_settings_module_Reload"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [localize "STR_ACPL_SkillSystem_settings_name", "RESISTANCE"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "0.4", // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {[] call ACPL_SkillSystem_fnc_CBAsettings_changed;} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[] call ACPL_SkillSystem_fnc_CBAsettings_changed;