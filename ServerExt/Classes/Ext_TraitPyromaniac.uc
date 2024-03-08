Class Ext_TraitPyromaniac extends Ext_TraitBase;

var localized string GroupDescription;

function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|"$GroupDescription;
	return S;
}

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUsePyromaniac = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUsePyromaniac = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFirebug'
	TraitGroup=class'Ext_TGroupZEDTime'
	NumLevels=1
	DefLevelCosts(0)=50
	//DefMinLevel=65
}