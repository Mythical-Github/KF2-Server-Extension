class ExtHUD_ObjectiveConatiner extends KFGFxHUD_ObjectiveConatiner;

simulated function SetActive(bool bActive)
{
	if (bActive)
	{
		Super.SetActive(bActive);
	}
	else
	{
		SetVisible(bActive);
		CurrentObjectiveInterface = none;

		// Fix:
		// ScriptWarning: Accessed None
		// KFGFxHUD_ObjectiveConatiner Transient.ExtMoviePlayer_HUD_0:KFGFxHUD_ObjectiveConatiner_0
		// Function KFGame.KFGFxHUD_ObjectiveConatiner:SetActive:01D9
		if (GetObject("objectiveNumberMC") != None)
		{
			GetObject("objectiveNumberMC").SetVisible(false);
		}
	}
}

DefaultProperties
{

}