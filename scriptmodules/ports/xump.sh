#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="xump"
rp_module_desc="Xump - The Final Run is a simple multi-platform puzzler by Retroguru."
rp_module_licence="WEB http://www.retroguru.com/xump/"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_xump() {
    local depends=(libsdl1.2debian libsdl-mixer1.2 libmodplug1 zlib1g)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function install_bin_xump() {
    downloadAndExtract "http://www.retroguru.com/xump/xump-v.latest-raspberrypi.zip" "$md_inst"
}

function configure_xump() {
    mkRomDir "ports/xump"
    addPort "$md_id" "xump" "Xump" "pushd $md_inst; $md_inst/xump_rpi; popd"
    chmod +x "$md_inst/xump_rpi"
	chown -R $user:$user "$md_inst"
}
