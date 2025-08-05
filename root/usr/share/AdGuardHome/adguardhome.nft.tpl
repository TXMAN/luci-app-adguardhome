table inet adguardhome {
    chain prerouting {
        type nat hook prerouting priority dstnat; policy accept;

        iifname != "lo" udp dport 53 dnat to :__AGH_PORT__
        iifname != "lo" tcp dport 53 dnat to :__AGH_PORT__
    }
}