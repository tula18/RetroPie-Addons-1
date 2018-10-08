#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="sqrxz"
rp_module_desc="Sqrxz (Remake) - Sqrxz (Remake/2010) requires fast reflexes and is a simply mindblasting Jump’n’Run puzzle game with high frustration factor."
rp_module_licence="WEB http://www.sqrxz.de/sqrxz/"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_sqrxz() {
    local depends=(libsdl1.2debian libsdl-mixer1.2 libmodplug1 zlib1g)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function install_bin_sqrxz() {
    downloadAndExtract "https://www.retroguru.com/sqrxz/sqrxz-v.latest-raspberrypi.zip" "$md_inst/.."
}

function configure_sqrxz() {
    mkRomDir "ports/sqrxz"
    addPort "$md_id" "sqrxz" "Sqrxz (Remake)" "pushd $md_inst; $md_inst/sqrxz_rpi; popd"
    chmod +x "$md_inst/sqrxz_rpi"
	chown -R $user:$user "$md_inst"
}
