#!/bin/bash

# Test record to lookup
TEST_HOST="kube-dns.kube-system.svc.cluster.local"
# Choose our lookup tool, in this case we will use the host command
DNS_TOOL_BIN=`which host`
# Wait 5 seconds for a DNS reply at most...which is honestly way too much.
DNS_TOOL_FLAGS="-W 5"
# Duration to wait between checks, in seconds
SLEEP_DURATION=30

NODE_NAME=${MY_NODE_NAME}

# Run the check
while true ; do
if $DNS_TOOL_BIN $DNS_TOOL_FLAGS $TEST_HOST; then
        echo "`date +%s` - `date` - $NODE_NAME - OK: DNS working as expected."
        sleep $SLEEP_DURATION
else
        echo "`date +%s` - `date` - $NODE_NAME - ERROR: DNS Lookup for $TEST_HOST failed."
        sleep $SLEEP_DURATION
        # Lets exit and let k8s restart the container.
        exit
fi
done
