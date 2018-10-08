#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-mame2009"
rp_module_desc="Arcade emu - MAME 0.135U4 port for libretro"
rp_module_help="ROM Extension: .zip\n\nCopy your MAME roms to either $romdir/mame-libretro or\n$romdir/arcade"
rp_module_licence="NONCOM https://raw.githubusercontent.com/r-type/mame2009-libretro/master/docs/license.txt"
rp_module_section="exp"

function sources_lr-mame2009() {
    gitPullOrClone "$md_build" https://github.com/r-type/mame2009-libretro.git
}

function build_lr-mame2009() {
    rpSwap on 750
    make clean
    local params=()
    make -f Makefile PTR64=0 TINY=1
    rpSwap off
    md_ret_require="$md_build/mame2009_libretro.so"
}

function install_lr-mame2009() {
    md_ret_files=(
        'mame2009_libretro.so'
        'README.MD'
    )
}

function configure_lr-mame2009() {
    local system
    for system in arcade mame-libretro; do
        mkRomDir "$system"
        ensureSystemretroconfig "$system"
        addEmulator 0 "$md_id" "$system" "$md_inst/mame2009_libretro.so"
        addSystem "$system"
    done
}
