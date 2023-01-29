tfdocs: 
	terraform-docs markdown modules/generic_resource_group > README.md

unit-test:
	go test tests/terraform_generic_resource_group_unit_test.go -v -timeout 30m

int-test:
	go test tests/terraform_generic_resource_group_int_test.go -v -timeout 30m