class Object
{
	class AttributeCategories
	{
		class ACPL_ACEgetAmmo
		{
			displayName = "$STR_ACPL_ACEgetAmmo_modules_category";
			collapsed = 1;
			class Attributes
			{
				class acpl_acegetammo_value
				{
					displayName = "$STR_ACPL_ACEgetAmmo_module_name";
					tooltip = "$STR_ACPL_ACEgetAmmo_module_desc";
					property = "acpl_acegetammo_value";
					control = "Edit";
					expression = "if !(_value isEqualTo 0) then {_this setVariable ['%s',_value,true];};";
					defaultValue = "0";
					unique = 0;
					validate = "number";
					condition = "objectHasInventoryCargo";
					typeName = "NUMBER";
				};
			};
		};
	};
};