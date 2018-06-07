# Create VCN
resource "oci_core_virtual_network" "vcn" {
  cidr_block = "10.0.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name = "vcn"
}

# Create internet gateway to allow public internet traffic
resource "oci_core_internet_gateway" "ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "ig"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
}

# Create route table to connect vcn and internet gateway
resource "oci_core_route_table" "rt" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
  display_name = "rt"
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.ig.id}"
  }
}

# Create security list to allow internet access from compute and ssh access
resource "oci_core_security_list" "sl" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "sl"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
  egress_security_rules = [{
    destination = "0.0.0.0/0"
    protocol = "6"
  }]
  ingress_security_rules = [{
    tcp_options {
      "max" = 22
      "min" = 22
    }
    protocol = "6"
    source = "0.0.0.0/0"
  }]
}

# Create subnet in vcn
resource "oci_core_subnet" "subnet_ad1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1],"name")}"
  cidr_block = "10.0.1.0/24"
  display_name = "subnet_ad1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
  route_table_id = "${oci_core_route_table.rt.id}"
  security_list_ids = ["${oci_core_security_list.sl.id}"]
}
