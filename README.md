## Flat simple items for Warsow

Enjoy *simple* items.

Forum thread: http://www.warsow.net/forum/thread/16468


### Rendering

Pre-requisites:

* GNU Make
* ImageMagick `convert` tool (`apt-get install imagemagick`)
* Inkscape (`apt-get install inkscape`)

This will render all icons and package them into `.pk3`:

```
make
```

To speed up rendering, use `-j` flag (where `$(nproc)` resolves to number of
CPU cores on your machine):

```
make -j $(nproc)
```


### Contacts

Aleksej Komarov <[stylemistake@gmail.com]>

[stylemistake@gmail.com]: mailto:stylemistake@gmail.com
