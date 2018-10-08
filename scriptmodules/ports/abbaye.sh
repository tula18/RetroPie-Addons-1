#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="abbaye"
rp_module_desc="Abbaye - Port of the indie game l'Abbaye des Morts."
rp_module_licence="GPL3 https://github.com/nevat/abbayedesmorts-gpl/raw/master/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_abbaye() {
    local depends=(libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev)
    isPlatform "rpi" && depends+=(libraspberrypi-dev)
    getDepends "${depends[@]}"
}

function sources_abbaye() {
    gitPullOrClone "$md_build" https://github.com/nevat/abbayedesmorts-gpl.git
}

function build_abbaye() {
    platform="$platform" PREFIX="$md_inst" make
    md_ret_require="$md_build/abbayev2"
}

function install_abbaye() {
    platform="$platform" PREFIX="$md_inst" make install
}

function configure_abbaye() {
    mkRomDir "ports/abbaye"
    addPort "$md_id" "abbaye" "Abbaye" "pushd $md_inst; $md_inst/bin/abbayev2; popd"
	chown -R $user:$user "$md_inst"
}
