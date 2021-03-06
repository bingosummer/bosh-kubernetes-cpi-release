#!/bin/bash

set -e

cf_lb_ip=35.224.30.194

bosh -n -d cf deploy cf-deployment/cf-deployment.yml \
  --vars-store creds.yml \
  -v system_domain=${cf_lb_ip}.sslip.io \
  -o cf-deployment/operations/use-compiled-releases.yml \
  -o cf-deployment/operations/experimental/use-bosh-dns.yml \
  -o cf-deployment/operations/experimental/skip-consul-cell-registrations.yml \
  -o cf-deployment/operations/experimental/skip-consul-locks.yml \
  -o cf-deployment/operations/experimental/disable-consul.yml \
  -o cf-deployment/operations/experimental/use-grootfs.yml \
  -o local.yml
