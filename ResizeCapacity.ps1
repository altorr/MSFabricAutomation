$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Update-AzFabricCapacity -ResourceGroupName "rgfabrictest" -CapacityName "demofabrictest2" -SkuName "F4"

write-output "Upgrade executed"