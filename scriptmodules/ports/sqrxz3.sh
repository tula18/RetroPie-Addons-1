#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="sqrxz3"
rp_module_desc="Sqrxz 3 - Sqrxz 3 is a Jump'n'Run which will please the hardcore gamer amongst you."
rp_module_licence="WEB http://www.sqrxz.de/sqrxz3/"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_sqrxz3() {
    local depends=(libsdl1.2debian libsdl-mixer1.2 libmodplug1 zlib1g)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function install_bin_sqrxz3() {
    downloadAndExtract "https://www.retroguru.com/sqrxz3/sqrxz3-v.latest-raspberrypi.zip" "$md_inst"
}

function configure_sqrxz3() {
    mkRomDir "ports/sqrxz3"
    addPort "$md_id" "sqrxz3" "Sqrxz 3" "pushd $md_inst; $md_inst/sqrxz3_rpi; popd"
    chmod +x "$md_inst/sqrxz3_rpi"
	chown -R $user:$user "$md_inst"
}
