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

mkdir -p files/etc/hotplug.d/block && curl -fsSL https://raw.githubusercontent.com/281677160/openwrt-package/usb/block/10-mount > files/etc/hotplug.d/block/10-mount

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
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/281677160/openwrt-package/trunk/adguardhome package/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-easymesh package/luci-app-easymesh
rm -rf package/helloworld
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
rm -rf package/passwall
#git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
#git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
#rm -rf package/feeds/luci/luci-theme-neobird
#git clone https://github.com/lwb1978/luci-theme-neobird.git package/feeds/luci/luci-theme-neobird
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon-18.06

pushd package/emortal/
#rm -rf lua-maxminddb
#git clone https://github.com/jerrykuku/lua-maxminddb.git
#rm -rf luci-app-vssr
#git clone https://github.com/jerrykuku/luci-app-vssr.git
rm -rf luci-app-openclash
git clone https://github.com/vernesong/OpenClash
# rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
# rm -rf luci-theme-neobird
# git clone https://github.com/lwb1978/luci-theme-neobird.git
rm -rf luci-app-omcproxy
git clone -b 18.06 https://github.com/lwb1978/luci-app-omcproxy.git
rm -rf luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/destan19/OpenAppFilter.git
popd
# 把bootstrap替换成argon为源码必选主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],源码内必须有该主题,要不然编译失败）
sed -i "s/bootstrap/argon-18.06/ig" feeds/luci/collections/luci/Makefile
