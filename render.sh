#!/bin/bash

output_dir="render"
temp_dir=".tmp"
source_dir_list="ammo armor health powerup weapon weaponpickup"

rm -rf ${temp_dir} ${output_dir}
mkdir -p ${temp_dir} ${output_dir}

render() { # <source> <target>
	source_dir="${1}"
	target_dir="${2}"
    mkdir -p ${temp_dir}/tga/${source_dir} ${temp_dir}/png/${source_dir}
    for file in ${source_dir}/*; do
        echo ${file}
        filename=`echo ${file} | cut -d . -f 1`
		inkscape \
			--export-png=${temp_dir}/png/${filename}.png --export-dpi=90 \
			--without-gui ${file}
		convert ${temp_dir}/png/${filename}.png ${temp_dir}/tga/${filename}.tga
    done
	mkdir -p ${output_dir}/${target_dir}
	mv ${temp_dir}/tga/${source_dir}/* ${output_dir}/${target_dir}
	rm -rf ${temp_dir}/tga ${temp_dir}/png
}

render ammo gfx/hud/icons/ammo
render armor gfx/hud/icons/armor
render health gfx/hud/icons/health
render powerup gfx/hud/icons/powerup
render weapon gfx/hud/icons/weapon
render weaponpickup gfx/simpleitems/weapon

rm -rf ${temp_dir}

echo "finished!"
