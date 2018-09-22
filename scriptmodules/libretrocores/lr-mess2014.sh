#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-mess2014"
rp_module_desc="MESS emulator - MESS 0.159 port for libretro"
rp_module_help="see wiki for detailed explanation"
rp_module_licence="NONCOM https://raw.githubusercontent.com/libretro/mame2014-libretro/master/docs/license.txt"
rp_module_section="exp"

function sources_lr-mess2014() {
    gitPullOrClone "$md_build" https://github.com/libretro/mame2014-libretro.git
}

function build_lr-mess2014() {
    rpSwap on 768
    make clean
    make TARGET=mess
    rpSwap off
    md_ret_require="$md_build/mess2014_libretro.so"
}

function install_lr-mess2014() {
    md_ret_files=(
        'mess2014_libretro.so'
    )
}

function configure_lr-mess2014() {

    local module="$1"
    [[ -z "$module" ]] && module="mess2014_libretro.so"

    local system
    for system in nes gb coleco arcadia crvision coco dragon32; do
        mkRomDir "$system"
        ensureSystemretroconfig "$system"
        addEmulator 0 "$md_id" "$system" "$md_inst/$module"
        addSystem "$system"
    done

    cp -rv "$md_build/docs" "$md_inst/"
    cp -rv "$md_build/hash" "$md_inst/"
    cp -rv "$md_build/metadata" "$md_inst/"

    setRetroArchCoreOption "mame_softlists_enable" "enabled"
    setRetroArchCoreOption "mame_softlists_auto_media" "enabled"
    setRetroArchCoreOption "mame_boot_from_cli" "enabled"

    mkdir "$biosdir/mess2014"
    cp -rv "$md_build/hash" "$md_inst/mess2014/"
    chown -R $user:$user "$biosdir/mess2014"

}
