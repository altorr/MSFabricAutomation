# MSFabricAutomation
This repository contains the process to execute Azure Automation Runbooks to do management activities over Microsoft Fabric Capacity

# Azure Automation Creation
🧭 **Step 1: Sign in to the Azure Portal**
1. Go to https://portal.azure.com.
2. Sign in with your Azure account.

🧭 **Step 2: Create the Automation Account**
1. In the search bar, type "Automation Accounts" and select the service.
2. Click “+ Create” or “+ Add”.

🧾 **Step 3: Fill in the Basic Information**
Provide the following details:
1. Subscription: Choose the subscription where you want to create the account.
2. Resource Group: Select an existing one or create a new one.
3. Automation Account Name: Must be unique within the resource group.
4. Region: Choose the region closest to your resources or users.

⚙️ **Step 4: Additional Configuration (Optional but Recommended)** Enable Managed Identity:
1. Go to the Identity tab.
2. Enable the System-assigned managed identity so your Runbooks can securely access other Azure resources.

✅ **Step 5: Review and Create**
1. Click “Review + create”.
2. Verify all the information.
3. Click “Create” to deploy the Automation Account.

🧪 **Step 6: Post-Creation** Once deployed, you sould:
1. Create Runbooks (PowerShell, Python, Graphical).
2. Import additional modules.
3. Configure credentials, certificates, variables, and connections.
4. Schedule tasks or integrate with alerts and events.

# Runtime Environment Creation

1. Go to "Process Automation" section and select "Runtime Environments"
2. Select Create, provide the following details:
   a. Name: Must be unique.
   b. Language: Choose the PowerShell 
c) Runtime version: Choose 7.4 version.
d) select next to go Package section
4. In package section provide the following details:
a) Add from Galery
b) On search bar section write "Az.Accounts", then select the package and on the new page clikc on Select
c) Repeat again the process, select again Add from Galery
d) On search bar section write "Az.Fabric", then select the package and on the new page clikc on Select
d) For Az Package on package version select "None"
e) For Azure CLI Package on package version select "None"
f) Select Next for Review + Create section
g) Select Create

# Runbook Creation
1. Go to "Process Automation" section and select Runbooks
2. Select Create, provide the following details:
a) Runbook: select Create new.
b) Name: Must be unique.
c) Runbook Type: select PowerShell
d) Runtime Environment : Select from exiting option, then select the package created in the step before "Runtime Environment"
3. Select Review and create, then create

# Runbook Code
1. Go to "Process Automation" section and select Runbooks
2. Then select the Runbook in the previous step "Runbook creation"
3. On the Overview page select edit option and then select "Edit in portal"
4. On the Edit Portal Page, provide the following details:
a) Runtime Environment: Select the environment create in the step "Runtime Environment Creation"
b) on the coding section copy and paste the code provided:

$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Suspend-AzFabricCapacity -ResourceGroupName "rgfabrictest" -CapacityName "demofabrictest2"
write-output "Suspend executed"

c) if you want to resumen the Fabric Capacity copy and paste the next code

$AzureConnection = (Connect-AzAccount -Identity).context

Set-AzContext -SubscriptionName $AzureConnection.Subscription -DefaultProfile $AzureConnection

Suspend-AzFabricCapacity -ResourceGroupName "rgfabrictest" -CapacityName "demofabrictest2"
write-output "Suspend executed"

5) To test the runbook select "Test Pane" Option, and then press "Start"
6) The runbook will be executed , when it finished go to the error and warning section to validate this sections are clear.
7) After validate the proper execution, close this test pane page.
8) You will back to the Coding Page, select "Publish" option.

#Schedule the Runbook execution
