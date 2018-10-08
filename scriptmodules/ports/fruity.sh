#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="fruity"
rp_module_desc="Fruit'Y - Playing with edibles is heavily inspired by the Kaiko classic Gem'X, which has been seen on computers such as the Commodore Amiga 500, Commodore 64 and Atari ST."
rp_module_licence="WEB http://www.retroguru.com/fruity/"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_fruity() {
    local depends=(libsdl1.2debian libsdl-mixer1.2 libmodplug1 zlib1g)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function install_bin_fruity() {
    downloadAndExtract "http://www.retroguru.com/fruity/fruity-v.latest-raspberrypi.zip" "$md_inst/.."
	cd "$md_inst/.."
	rm -rf "fruity"
	mv fruity_rpi fruity
}

function configure_fruity() {
    mkRomDir "ports/fruity"
    addPort "$md_id" "fruity" "Fruit'Y" "pushd $md_inst; $md_inst/fruity_rpi; popd"
    chmod +x "$md_inst/fruity_rpi"
	chown -R $user:$user "$md_inst"
}
