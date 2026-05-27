module "oci_fk_custom_function_1" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-function.git"

  tenancy_ocid             = var.tenancy_ocid
  region                   = var.region
  ocir_user_name           = var.ocir_user_name
  ocir_user_password       = var.ocir_user_password
  compartment_ocid         = var.compartment_ocid
  use_my_fn                = true
  fk_app_name              = "fkappapigw"
  fk_fn_name               = "fncustom1"
  dockerfile_content       = data.local_file.fncustom1_dockerfile.content
  func_py_content          = data.local_file.fncustom1_func_py.content
  func_yaml_content        = data.local_file.fncustom1_func_yaml.content
  requirements_txt_content = data.local_file.fncustom1_requirements_txt.content
  invoke_fn                = false
  use_oci_logging          = true
  use_my_fn_network        = true
  my_fn_subnet_ocid        = module.fk_vcn.subnet_ids["functions_private"]
  fn_config = {
    FN_CUSTOM_MESSAGE = var.fncustom1_message
  }
}

module "oci_fk_custom_function_2" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-function.git"

  tenancy_ocid             = var.tenancy_ocid
  region                   = var.region
  ocir_user_name           = var.ocir_user_name
  ocir_user_password       = var.ocir_user_password
  compartment_ocid         = var.compartment_ocid
  use_my_fn                = true
  fk_fn_name               = "fncustom2"
  dockerfile_content       = data.local_file.fncustom2_dockerfile.content
  func_py_content          = data.local_file.fncustom2_func_py.content
  func_yaml_content        = data.local_file.fncustom2_func_yaml.content
  requirements_txt_content = data.local_file.fncustom2_requirements_txt.content
  invoke_fn                = false
  use_oci_logging          = false
  use_my_fn_app            = true
  my_fn_app_ocid           = module.oci_fk_custom_function_1.oci_app_fn.fn_app_ocid
  use_my_fn_network        = true
  my_fn_subnet_ocid        = module.fk_vcn.subnet_ids["functions_private"]
  fn_config = {
    FN_CUSTOM_MESSAGE = var.fncustom2_message
  }
}
