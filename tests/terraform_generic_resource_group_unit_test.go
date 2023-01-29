package test

import (
	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestGenericResourceGroup(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../modules/generic_resource_group",
		Vars: map[string]interface{}{
			"ressource_group_config": map[string]interface{}{
				"rg-testing-1": map[string]interface{}{
					"location": "westeurope",
					"tags": map[string]string{
						"stage": "dev"},
				},
				"rg-testing-2": map[string]interface{}{
					"location": "westeurope",
					"tags": map[string]string{
						"stage": "dev"},
				},
			}},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	resource_groups := terraform.OutputMapOfObjects(t, terraformOptions, "resource_groups")
	subscriptionID := terraform.Output(t, terraformOptions, "subscription_id")

	for key, value := range resource_groups {
		exists := azure.ResourceGroupExists(t, key, subscriptionID)
		assert.True(t, exists, "Resource group does not exist")
		assert.Equal(t, value.(map[string]interface{})["location"], "westeurope")
	}
}
