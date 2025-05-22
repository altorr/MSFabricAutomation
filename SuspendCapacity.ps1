$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Suspend-AzFabricCapacity -ResourceGroupName "rgfabrictest" -CapacityName "demofabrictest2"

write-output "Suspend executed"