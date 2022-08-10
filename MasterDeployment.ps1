# Example Code Only
# Provided as-is

param([string]$suscriptionId = "", [string]$deploymentType = "DEV/QA/PROD- It really is the prefix/suffix name of parameters.json file", [string]$location = "scus", [string]$resourceGroupName="", [string]$localPath="" )

Login-AzureRmAccount 

$subResult = Select-AzureRmSubscription -suscriptionId "$suscriptionId"  

# List all the Logic Apps to be deployed in order needed
$LogicAppList = @("NameOfYourLogicApp.json")

Foreach($logicApp in $LogicAppList)
{
    $results = New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$localPath\$logicApp\$logicApp.json" -TemplateParameterFile "$localPath\$logicApp\$logicApp.parameters.$deploymentType.json" 
    Write-Output $results
}
