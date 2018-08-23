# Packstack Tools
    - Packstack: Create a proof of concept cloud    
    - This script has been developed by muyahid.dy@gmail.com                                      
    - Script for CentOS 7. Using script can damage your system, Please carefully.
    - Users shall use this Service at his/her own risk, and shall bear all responsibility for actions   carried out and their results upon this Service.


Clean and Install OpenStack Scripts
OpenStack RDO - Queens and Pike version

# Prerequisites

    Please remove NetworkManager
    Disable Selinux (These changes require that you restart)

# Gen file for install

    packstack --gen-answer-file=openstack.txt

# Packstack

    packstack --answer-file=openstack.txt

# Run the script:
    pike version

    sh packstack-pike

or

    queens version

    sh packstack-queens

# Read More
Packstack: Create a proof of concept cloud
https://www.rdoproject.org/install/packstack/
