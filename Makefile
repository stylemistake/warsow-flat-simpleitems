# Makefile

.DEFAULT_GOAL := default
.PHONY: default clean

source_dirs := $(wildcard src/simpleitems/*) $(wildcard src/hud/icons/*)
source_files := $(foreach dir,$(source_dirs),$(wildcard $(dir)/*.svg))
target_files := $(patsubst src/%.svg, dist/gfx/%.tga, $(source_files))


## --------------------------------------------------------
##  File targets
## --------------------------------------------------------

.tmp/%.png: src/%.svg
	@mkdir -p $(@D)
	inkscape --export-png=$@ --export-dpi=90 --without-gui $<

dist/gfx/%.tga: .tmp/%.png
	@mkdir -p $(@D)
	convert $< $@

dist/gfx_items_flat.pk3: $(target_files)
	cd $(@D) && zip -r -9 $(@F) gfx


## --------------------------------------------------------
##  Phony targets
## --------------------------------------------------------

default: dist/gfx_items_flat.pk3

clean:
	@rm -rf dist .tmp
