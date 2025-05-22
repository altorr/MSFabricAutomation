$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Resume-AzFabricCapacity -ResourceGroupName "rgfabrictest" -CapacityName "demofabrictest2"

write-output "Resume executed"