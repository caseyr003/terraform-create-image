# Terraform-Create-Image

## This will configure a compute instance by running a script on the instance and then create a custom image from the instance on Oracle Cloud Infrastructure using Terraform.


# Software Requirements

To run this you must have installed the Terraform binary (at least 0.9.x) and configured it per instruction.

You must also have installed the Oracle Cloud Infrastructure Terraform provider.

You will also, of course, need access to an Oracle Cloud Infrastructure (OCI) account. If you do not have access, you can request a free trial. To learn more about Oracle OCI, read the Getting Started guide.


# Environment Requirements

Please follow all instructions for installing the Terraform and Oracle Cloud Infrastructure Provider executables.

https://github.com/oracle/terraform-provider-oci


# Running

The env.sh file needs to be updated with your tenancy specific information. To find more information on where to find the needed values please visit: https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm

The rsync.sh in the "userdata" folder is used to configure the compute instance. You can supply your own script by adding it to the "userdata" folder and updating the "prepare-image" module to run the new script on the instance.

Once you understand the code, have all the software requirements, and have satisfied the environmental requirements you can build your environment.

The first step is to parse all the modules by typing terraform get. This will build out a .terraform directory in your project root. This needs to be done only once.

The next step is to run terraform plan from the command line to generate an execution plan. Examine this plan to see what will be built and that there are no errors.

If you are satisfied, you can build the configuration by typing terraform apply. This will build all of the dependencies and construct an environment to match the project.

Note that Terraform generates a terraform.tfstate and terraform.tfstate.backup file which manage the state of your environment. These files should not be hand edited.

If you want to tear down your environment, you can do that by running terraform destroy

Commands:

[opc@orchestration demo]$	terraform init

[opc@orchestration demo]$	. ./env.sh

[opc@orchestration demo]$	terraform plan

[opc@orchestration demo]$	terraform apply

[opc@orchestration demo]$	terraform destroy
