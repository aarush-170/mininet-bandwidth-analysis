# Bandwidth Measurement Results

**Course:** UE24CS252B — Computer Networks  
**Tool Used:** iperf (TCP mode)  
**Test Duration:** 10 seconds per experiment  
**Protocol:** TCP  

---

## Raw Results

### 1. Single Switch Topology (`--topo single,3`)

| Metric    | Value          |
|-----------|----------------|
| Transfer  | 41.1 GBytes    |
| Bandwidth | 35.3 Gbits/sec |

**Command run:**
```
h1 iperf -s
h2 iperf -c h1 -t 10
```

---

### 2. Linear Topology (`--topo linear,3`)

| Metric    | Value          |
|-----------|----------------|
| Transfer  | 39.8 GBytes    |
| Bandwidth | 34.2 Gbits/sec |

**Command run:**
```
h1 iperf -s
h3 iperf -c h1 -t 10
```

---

### 3. Tree Topology (`--topo tree,depth=2,fanout=2`)

| Metric    | Value          |
|-----------|----------------|
| Transfer  | 37.3 GBytes    |
| Bandwidth | 32.0 Gbits/sec |

**Command run:**
```
h1 iperf -s
h4 iperf -c h1 -t 10
```

---

## Comparison Table

| Topology      | Transfer (GB) | Bandwidth (Gbits/sec) | Rank |
|---------------|---------------|-----------------------|------|
| Single Switch | 41.1          | 35.3                  | 🥇 1st |
| Linear        | 39.8          | 34.2                  | 🥈 2nd |
| Tree          | 37.3          | 32.0                  | 🥉 3rd |

---

## Observations

1. Single switch topology gives the best performance — direct host-to-switch links with no intermediate hops.
2. Linear topology is slightly slower due to packets traversing multiple switches.
3. Tree topology has the most overhead due to multi-level hierarchy (root → child → host).
4. The bandwidth drop from single to tree is approximately **3.3 Gbits/sec (~9.3% reduction)**.
5. In real networks, this difference would be amplified by actual hardware limitations, cable quality, and congestion.
