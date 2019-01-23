#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Delete GCP VM instance, IP address, and firewall rule

# Constants - CHANGE ME!
readonly PROJECT='ansible-demo-project'
readonly ZONE='us-east1-b'
readonly INSTANCE='compute-instance'

# Delete instance
time yes | gcloud compute instances delete $INSTANCE \
  --project $PROJECT --zone $ZONE

time yes | gcloud compute firewall-rules delete allow-http \
  --project $PROJECT

# Clean up for next workflow
rm ansible/inventories/hosts
