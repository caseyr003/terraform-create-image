# Output ocid from created custom image
output "image_ocid" {
  value = "${oci_core_image.custom_image.id}"
}
