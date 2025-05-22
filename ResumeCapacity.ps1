$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Resume-AzFabricCapacity -ResourceGroupName "yourResourceGroup" -CapacityName "yourFabricService"

write-output "Resume executed"
