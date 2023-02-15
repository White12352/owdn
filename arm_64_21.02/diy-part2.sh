#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP 默认IP由1.1修改为0.1
# sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.0.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.2.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.3.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.4.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.5.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.6.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.7.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.8.1/192.168.5.5/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.9.1/192.168.5.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.5.5/g' package/base-files/files/bin/config_generate

# 最大连接数修改为65535
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# git clone https://github.com/siropboy/sirpdboy-package package/sirpdboy-package
# git clone https://github.com/small-5/luci-app-adblock-plus package/adblock-plus
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/luci-app-adguardhome
svn co https://github.com/281677160/openwrt-package/branches/21.02/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/281677160/openwrt-package/branches/21.02/adguardhome package/adguardhome
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-easymesh package/luci-app-easymesh
git clone --depth=1 https://github.com/ntlf9t/luci-app-easymesh.git package/luci-app-easymesh
#svn co https://github.com/281677160/openwrt-package/branches/21.02/luci-app-adguardhome package/luci-app-mosdns
#svn co https://github.com/281677160/openwrt-package/branches/21.02/mosdns package/mosdns
#rm -rf package/helloworld
rm -rf feeds/luci/applications/luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-vssr
rm -rf feeds/luci/applications/luci-app-openclash
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/packages/net/smartdns
svn co https://github.com/281677160/openwrt-package/branches/21.02/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/281677160/openwrt-package/branches/21.02/smartdns package/smartdns
#svn co https://github.com/kenzok8/openwrt-packages/trunk/aliyundrive-webdav package/aliyundrive-webdav
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav package/luci-app-aliyundrive-webdav
git clone --depth=1 https://github.com/messense/aliyundrive-webdav.git package/aliyundrive-webdav
#rm -rf package/feeds/luci/luci-theme-neobird
#git clone https://github.com/lwb1978/luci-theme-neobird.git package/feeds/luci/luci-theme-neobird
rm -rf feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
#rm -rf feeds/luci/applications/luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
rm -rf feeds/luci/applications/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#rm -rf feeds/luci/applications/luci-app-omcproxy
#git clone -b master https://github.com/riverscn/luci-app-omcproxy package/luci-app-omcproxy
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
rm -rf feeds/packages/net/v2ray-geodata
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 把bootstrap替换成argon为源码必选主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],源码内必须有该主题,要不然编译失败）
#sed -i "s/bootstrap/argon-18.06/ig" feeds/luci/collections/luci/Makefile
