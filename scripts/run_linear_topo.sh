#!/bin/bash
# ============================================
# Experiment: Linear Topology
# Topology: 3 switches, 3 hosts (h1, h2, h3)
# Structure: h1 — s1 — s2 — s3 — h3
# Controller: POX (forwarding.l2_learning)
# Tool: iperf (TCP throughput test)
# Test Duration: 10 seconds
#
# Result (from experiment):
# Transfer: 39.8 GBytes
# Throughput: 34.2 Gbits/sec
#
# Objective:
# Measure throughput between hosts connected
# through multiple OpenFlow switches in a
# linear SDN topology using Mininet.
# ============================================

echo "======================================"
echo " Starting Linear Topology Test"
echo "======================================"

sudo mn --topo linear,3 --controller remote --switch ovsk << 'EOF'

echo "Checking connectivity..."
pingall

echo "Starting iperf server on h1..."
h1 iperf -s &

sleep 1

echo "Running iperf client on h3..."
h3 iperf -c h1 -t 10

EOF

echo ""
echo "Cleanup..."
sudo mn -c
echo "Done. Throughput result displayed above."
