class Logic;
class Module_F: Logic {
	class ArgumentsBaseUnits {};
	class ModuleDescription {};
};

#include "modules\cfgWeather.hpp"

#include "modules\cfgCreateMedicCentre.hpp"

#include "modules\cfgCustomMedical.hpp"

#include "modules\cfgMedicalExclude.hpp"

#include "modules\cfgMedicalChangeRole.hpp"

class Man;
class CAManBase: Man {
	class EventHandlers
	{
		init = "params ['_unit'];[_unit] spawn ACPL_MM_Core_fnc_AddMedicaments;[_unit] spawn ACPL_MM_Core_fnc_CalculateCamo;";
	};
};