# From the Deep

## Random Partitioning

Random partitioning ensures that the load and data are evenly distributed across all boats regardless of peak collection hours, preventing any single boat from becoming a bottleneck. However, performing range or specific time queries requires querying every single boat in the network, which increases network overhead and query latency.

## Partitioning by Hour

Partitioning by hour allows range queries for specific time windows (like observations between midnight and 1 AM) to be routed directly to only the relevant boat, significantly improving query speed. The main drawback is that it causes severe data imbalance, overloading Boat A during peak night hours while leaving other boats underutilized.

## Partitioning by Hash Value

Partitioning by hash value guarantees an even distribution of data across all boats even during peak observation times, and allows point queries for specific exact timestamps to target a single boat. However, range queries for time intervals still require searching across all boats because consecutive timestamps produce widely different hash values.
