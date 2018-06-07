# Create compute instance
resource "oci_core_instance" "compute_instance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.compute_display_name}"
  image = "${var.image_ocid}"
  shape = "${var.instance_shape}"
  subnet_id = "${var.subnet_ocid}"

  metadata = {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts = {
    create = "60m"
  }
}
