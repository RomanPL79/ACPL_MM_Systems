class Logic;
class Module_F: Logic {
	class ArgumentsBaseUnits {};
	class ModuleDescription {};
};

#include "modules\misc\cfgWeather.hpp"

#include "modules\medical\cfgCreateMedicCentre.hpp"

#include "modules\medical\cfgCustomMedical.hpp"

#include "modules\medical\cfgMedicalExclude.hpp"

#include "modules\medical\cfgMedicalChangeRole.hpp"

#include "modules\doStop\cfgDoStop.hpp"

#include "modules\spawner\cfgSpawnerCreateList.hpp"

#include "modules\spawner\cfgSpawnerSpawn.hpp"

#include "modules\briefing\cfgBriefing_CreateTask.hpp"

#include "modules\briefing\cfgBriefing_UpdateTask.hpp"

#include "modules\convoy\createConvoy.hpp"

#include "modules\convoy\destroyConvoy.hpp"

#include "modules\AI_Mods\cfg_VCOM.hpp"

#include "modules\AI_Mods\cfg_TCL.hpp"

#include "modules\misc\cfgCustomMarker.hpp"

class Man;
class CAManBase: Man {
	class EventHandlers
	{
		class ACPL_MM_Core {
			Init = "params ['_unit'];[_unit] spawn ACPL_MM_Core_fnc_AddMedicaments;[_unit] spawn ACPL_MM_Core_fnc_CalculateCamo;[_unit] spawn ACPL_MM_Core_fnc_BS_init;";
		};
	};
};