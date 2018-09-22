#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-scummvm"
rp_module_desc="ScummVM - Port for libretro"
rp_module_help="Copy your ScummVM games to $romdir/scummvm"
rp_module_licence="GPL2 https://github.com/libretro/scummvm/raw/master/COPYING"
rp_module_section="exp"

function sources_lr-scummvm() {
    gitPullOrClone "$md_build" https://github.com/libretro/scummvm.git
}

function build_lr-scummvm() {
    cd backends/platform/libretro/build
	if ! grep -q "rpi" "Makefile"; then
		patch "Makefile" < "$md_data/Makefile.diff"
	fi
    make clean
    make
    md_ret_require="$md_build/backends/platform/libretro/build/scummvm_libretro.so"
}

function install_lr-scummvm() {
    md_ret_files=(
        'LIBRETRO_CMDLINE.md'
        'README.md'
        'README'
        'NEWS'
        'TODO'
        'backends/platform/libretro/build/scummvm_libretro.so'
    )
}

function configure_lr-scummvm() {
    mkRomDir "scummvm"
    ensureSystemretroconfig "scummvm" "lr-scummvm"
    addEmulator 1 "$md_id" "scummvm" "$md_inst/scummvm_libretro.so" "lr-scummvm"
    addSystem "scummvm"
}
