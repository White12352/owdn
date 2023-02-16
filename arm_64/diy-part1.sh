#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# rm -rf target/linux/ramips
# svn export https://github.com/padavanonly/immortalwrt/trunk/target/linux/ramips target/linux/ramips
rm -f feeds.conf.default
echo 'src-git packages https://github.com/immortalwrt/packages.git^94e7da6301' >>feeds.conf.default
echo 'src-git luci https://github.com/immortalwrt/luci.git^381482cff5' >>feeds.conf.default
echo 'src-git routing https://github.com/openwrt/routing.git^c2f9428ac5' >>feeds.conf.default
echo 'src-git telephony https://github.com/openwrt/telephony.git^0403af50b1' >>feeds.conf.default
