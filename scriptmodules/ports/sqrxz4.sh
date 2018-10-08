#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="sqrxz4"
rp_module_desc="Sqrxz 4 - Sqrxz 4 is another instalment in the Sqrxz Jump'n'Die franchise."
rp_module_licence="WEB http://www.sqrxz.de/sqrxz4/"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_sqrxz4() {
    local depends=(libsdl1.2debian libsdl-mixer1.2 libmodplug1 zlib1g)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function install_bin_sqrxz4() {
    downloadAndExtract "https://www.retroguru.com/sqrxz4/sqrxz4-v.latest-raspberrypi.zip" "$md_inst"
}

function configure_sqrxz4() {
    mkRomDir "ports/sqrxz4"
    addPort "$md_id" "sqrxz4" "Sqrxz 4" "pushd $md_inst; $md_inst/sqrxz4_rpi; popd"
    chmod +x "$md_inst/sqrxz4_rpi"
	chown -R $user:$user "$md_inst"
}
