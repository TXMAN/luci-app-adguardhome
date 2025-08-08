# luci-app-adguardhome（nft 版）简要说明

面向已熟悉原项目的用户：**仅把 DNS 重定向从 iptables 迁移到 nftables/fw4**，核心语义不变。

## 变更概览
- **iptables → nftables**：使用 fw4 include 注入 `/var/etc/adguardhome.nft`。
- 模板：`/usr/share/AdGuardHome/adguardhome.nft.tpl`（默认仅 `prerouting`；如需本机 DNS 也强制走 AGH，可自行加 `output` 并做好白名单）。
- 模式语义保持：`redirect` / `dnsmasq-upstream` / `exchange` 与原版一致。

本项目基于 https://github.com/rufengsuixing/luci-app-adguardhome 项目修改。原项目未提供明确的开源协议，当前仅用于个人学习研究，**不用于商业用途**。如原作者有任何异议，请联系我处理。
