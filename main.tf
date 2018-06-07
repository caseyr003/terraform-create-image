# This Terraform script creates a virtual cloud network, provisions a compute
# instance, runs a script to configure server, and creates a custom image
# from the compute instance.

# Create VCN
module "vcn" {
  source = "./modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  availability_domain = "${var.availability_domain}"
}

# Create Compute Instance
module "compute" {
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  instance_name = "compute_image"
  subnet_ocid = "${module.vcn.subnet1_ocid}"
  instance_count = "${var.instance_count}"
  instance_shape = "${var.instance_shape}"
  image_ocid = "${var.image_ocid}"
  compute_display_name = "${var.compute_display_name}"
  availability_domain = "${var.availability_domain}"
}

# Configure Compute Instance and Create Custom Image
module "prepare_image" {
  source = "./modules/prepare-image"
  instance_id = "${module.compute.instance_ocid}"
  compartment_id = "${var.compartment_ocid}"
  image_name = "golden image"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  instance_count = "${var.instance_count}"
  public_ip = "${module.compute.public_ip}"
}

# Print Custom Image OCID After Completed
output "image_ocid" {
  value = "${module.prepare_image.image_ocid}"
}
