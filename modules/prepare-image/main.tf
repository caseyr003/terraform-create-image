# Copy script to instance and then run script
resource "null_resource" "compute_config" {
  # Copy file userdata folder contents into tmp folder on instance
  provisioner "file" {
    connection {
      host = "${var.public_ip}"
      user = "opc"
      private_key = "${var.ssh_private_key}"
    }
    source     = "userdata/"
    destination = "/tmp/"
  }
  # Run the script on the instance
  provisioner "remote-exec" {
    connection {
      host="${element(split(",", var.public_ip), count.index)}"
      user = "opc"
      private_key = "${var.ssh_private_key}"
    }

    inline = [
      "chmod +x /tmp/rsync.sh",
      "sudo /tmp/rsync.sh ",
    ]
  }
}

# Create custom image from compute instance
resource "oci_core_image" "custom_image" {
	compartment_id = "${var.compartment_id}"
	instance_id = "${var.instance_id}"
	display_name = "${var.image_name}"
    depends_on = ["null_resource.compute_config"]
}
