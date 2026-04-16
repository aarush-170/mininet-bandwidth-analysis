    #!/bin/bash
# ============================================
# Experiment: Single Switch Topology
# Topology: 1 switch, 2 hosts (h1, h2)
# Controller: POX (forwarding.l2_learning)
# Tool: iperf (TCP throughput test)
# Test Duration: 10 seconds
#
# Result (from experiment):
# Transfer: 41.1 GBytes
# Throughput: 35.3 Gbits/sec
#
# Objective:
# Measure throughput between hosts connected
# to a single OpenFlow switch using Mininet.
# ============================================

echo "======================================"
echo " Starting Single Switch Topology Test"
echo "======================================"

sudo mn --topo single,2 --controller remote --switch ovsk << 'EOF'

echo "Checking connectivity..."
pingall

echo "Starting iperf server on h1..."
h1 iperf -s &

sleep 1

echo "Running iperf client on h2..."
h2 iperf -c h1 -t 10

EOF

echo ""
echo "Cleanup..."
sudo mn -c
echo "Done. Throughput result displayed above."
