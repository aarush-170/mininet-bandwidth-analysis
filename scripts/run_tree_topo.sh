#!/bin/bash
# ============================================
# Experiment: Tree Topology
# Topology: depth=2, fanout=2 (1 root switch,
#           2 child switches, 4 hosts)
# Tool: iperf (TCP bandwidth test)
# ============================================

echo "======================================"
echo "    Starting Tree Topology Test       "
echo "======================================"

sudo mn --topo tree,depth=2,fanout=2 --test none << 'EOF'
h1 iperf -s &
sleep 1
h4 iperf -c h1 -t 10
EOF

echo ""
echo "Cleanup..."
sudo mn -c
echo "Done. Check results above."
