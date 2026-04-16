#!/bin/bash
# ============================================
# Experiment: Tree Topology
# Topology: depth=2, fanout=2
# Structure:
#            s1
#           /  \
#         s2    s3
#        / \    / \
#      h1  h2 h3  h4
#
# Controller: POX (forwarding.l2_learning)
# Tool: iperf (TCP throughput test)
# Test Duration: 10 seconds
#
# Result (from experiment):
# Transfer: 37.3 GBytes
# Throughput: 32.0 Gbits/sec
#
# Objective:
# Measure throughput between hosts connected
# across multiple switches in a hierarchical
# SDN tree topology using Mininet.
# ============================================

echo "======================================"
echo "     Starting Tree Topology Test"
echo "======================================"

sudo mn --topo tree,depth=2,fanout=2 --controller remote --switch ovsk << 'EOF'

echo "Checking connectivity..."
pingall

echo "Starting iperf server on h1..."
h1 iperf -s &

sleep 1

echo "Running iperf client on h4..."
h4 iperf -c h1 -t 10

EOF

echo ""
echo "Cleanup..."
sudo mn -c
echo "Done. Throughput result displayed above."
