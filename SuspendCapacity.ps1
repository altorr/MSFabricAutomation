$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Suspend-AzFabricCapacity -ResourceGroupName "yourResourceGroup" -CapacityName "yourFabricService"

write-output "Suspend executed"
