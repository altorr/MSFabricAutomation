$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Update-AzFabricCapacity -ResourceGroupName "yourResourceGroup" -CapacityName "yourFabricService" -SkuName "F4" #set the required capacity

write-output "Upgrade executed"
