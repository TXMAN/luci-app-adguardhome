# luci-app-adguardhome（nft 版）简要说明

面向已熟悉原项目的用户：**仅把 DNS 重定向从 iptables 迁移到 nftables/fw4**，核心语义不变。

## 变更概览
- **iptables → nftables**：使用 fw4 include 注入 `/var/etc/adguardhome.nft`。
- 模板：`/usr/share/AdGuardHome/adguardhome.nft.tpl`（默认仅 `prerouting`；如需本机 DNS 也强制走 AGH，可自行加 `output` 并做好白名单）。
- 清理：`clear_nft_redirect` 会删 include + `fw4 reload` + `nft delete table inet adguardhome`，避免规则叠加。
- 模式语义保持：`redirect` / `dnsmasq-upstream` / `exchange` 与原版一致。

## 快速使用
```sh
# 重定向
uci set AdGuardHome.AdGuardHome.redirect='redirect'; uci commit; /etc/init.d/AdGuardHome do_redirect 1
# dnsmasq 上游
uci set AdGuardHome.AdGuardHome.redirect='dnsmasq-upstream'; uci commit; /etc/init.d/AdGuardHome do_redirect 1
# 替换（AGH 占 53）
uci set AdGuardHome.AdGuardHome.redirect='exchange'; uci commit; /etc/init.d/AdGuardHome do_redirect 1
```