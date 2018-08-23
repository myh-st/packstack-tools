# Packstack Tools
    - Clean and Install OpenStack Scripts
    - OpenStack RDO - Queens and Pike version
    - Packstack: Create a proof of concept cloud                                    
    - Script for CentOS 7. Using script can damage your system, Please carefully.
    - Users shall use this Service at his/her own risk, and shall bear all responsibility for actions carried out and their results upon this Service.

# Prerequisites

    Please remove NetworkManager
    Disable Selinux (These changes require that you restart)

# Gen file for install

    packstack --gen-answer-file=openstack.txt

# Packstack

    packstack --answer-file=openstack.txt

# Run the script:

    sh packstack-pike

or

    sh packstack-queens

# Read More
Packstack: Create a proof of concept cloud

https://www.rdoproject.org/install/packstack/
