#Enter Your Tenancy OCID
export TF_VAR_tenancy_ocid="Enter_Tenancy_OCID_Here"
#Enter Your Compartment OCID
export TF_VAR_compartment_ocid="Enter_Compartment_OCID_Here"
#Enter Your User OCID
export TF_VAR_user_ocid="Enter_User_OCID_Here"
#Enter Your Fingerprint
export TF_VAR_fingerprint="Enter_Fingerprint_Here"
#Enter Your Region (Example: us-ashburn-1)
export TF_VAR_region="Enter_Region_Here"
#Enter the Image OCID
#Example for OEL 7.5 in Ashburn: ocid1.image.oc1.iad.aaaaaaaa6ybn2lkqp2ejhijhehf5i65spqh3igt53iyvncyjmo7uhm5235ca
export TF_VAR_image_ocid="Enter_Image_OCID_Here"
#Enter Shape for Instance (Example: VM.Standard1.1)
export TF_VAR_instance_shape="Enter_Shape_Here"
#Enter Path to Your Private API Key
export TF_VAR_private_key_path="Enter_Private_API_Key_Path_Here"
#Enter Path to Your Public SSH Key
export TF_VAR_ssh_public_key=$(cat Enter_Public_SSH_Key_Path_Here)
#Enter Path to Your Private SSH Key
export TF_VAR_ssh_authorized_private_key=$(cat Enter_Private_SSH_Key_Path_Here)
