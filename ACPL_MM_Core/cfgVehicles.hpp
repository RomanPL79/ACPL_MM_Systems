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

class Man;
class CAManBase: Man {
	class EventHandlers
	{
		Init = "params ['_unit'];[_unit] spawn ACPL_MM_Core_fnc_AddMedicaments;[_unit] spawn ACPL_MM_Core_fnc_CalculateCamo;[_unit] spawn ACPL_MM_Core_fnc_BS_init;";
	};
};