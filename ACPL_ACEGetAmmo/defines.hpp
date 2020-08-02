#define SCOPE_PRIVATE	        scope = 0; scopeCurator = 0; scopeArsenal = 0;
#define SCOPE_HIDDEN	        scope = 1; scopeCurator = 1; scopeArsenal = 1;
#define SCOPE_PUBLIC	        scope = 2; scopeCurator = 2; scopeArsenal = 2;

#define NAME(a,b)		        displayName = a; descriptionShort = b;
#define WEIGHT(var)             mass = var; class ItemInfo {mass = var;};
#define MODEL(var1,var2)        picture = var2; model = var1;
#define AMMO(var1)				class ACPL_ACEgetAmmo {ammo = var1;};