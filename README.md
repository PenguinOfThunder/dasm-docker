# Dasm Docker

Docker container that lets you run dasm without installing it.

You probably don't need this. And it's less convenient than just installing the real thing.

## Build Docker Image

```sh
docker build . -t dasm-docker --build-arg DASM_VERSION=2.20.14.1
```

Substitute the version for whichever version you're building for.

The build will just download the binary release from the [dasm github](https://github.com/dasm-assembler/dasm/releases).

## Usage

Assume your game is called "game1". You can build the binaries for NTSC like this:

```sh
docker run --rm -it -v .:/home/dasm dasm-docker game1.asm -ogame1_ntsc2.bin -lgame1_ntsc.lst -sgame1_ntsc.sym -DNTSC=1 -DNO_ILLEGAL_OPCODES=1 -S -f3 -v5  -I/opt/dasm/machines/atari2600
```

Note the `-v` switch to mount the current directory to the `/home/dasm` volume.


## Notes

This is not affiliated in any way with the [dasm](https://dasm-assembler.github.io/) project in any way. It was created for my own use.

## Enhancements

This only builds the Linux x64 version, but it should be fairly simple to set it up for multi-target and perhaps compile dasm from source.

