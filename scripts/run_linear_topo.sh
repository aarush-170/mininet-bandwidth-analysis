#!/bin/bash
# ============================================
# Experiment: Linear Topology
# Topology: 3 switches in series, each with 1 host
# Tool: iperf (TCP bandwidth test)
# ============================================

echo "======================================"
echo "   Starting Linear Topology Test      "
echo "======================================"

sudo mn --topo linear,3 --test none << 'EOF'
h1 iperf -s &
sleep 1
h3 iperf -c h1 -t 10
EOF

echo ""
echo "Cleanup..."
sudo mn -c
echo "Done. Check results above."
