targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'samplerg'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module webApp 'sub-templates.bicep' = {
  name: 'app-resources'
  scope: az.resourceGroup(resourceGroup.name)
  params: {
    location: location
  }
}
