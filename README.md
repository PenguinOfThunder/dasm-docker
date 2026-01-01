# Dasm Docker

## NOTICE

> This is not affiliated with the [dasm](https://dasm-assembler.github.io/) project in any way, nor is this a superior or officially supported way to use it.
>
> Go to [the dasm page](https://dasm-assembler.github.io/) and download the binaries if you just want to run dasm.

## What is it

This lets you create a Docker container you can use to run dasm without installing it.

This docker image is built in these steps:

1. Clone [dasm](https://github.com/dasm-assembler) from github
2. Compile dasm with gcc
3. Copy the output to the base image. The entrypoint for the image is the dasm executable.

In the end, you can run the container in place of a locally installed executable (see below).

## Build Docker Image

```sh
docker build . -t dasm-docker --build-arg DASM_BRANCH=master # master is the default
```

For convenience, this repository also has a pre-built version of the image [here](https://github.com/PenguinOfThunder/dasm-docker/pkgs/container/dasm-docker).

## Usage

Assume your game is called "game1". You can build the binaries for NTSC like this:

```sh
docker run --rm -it -v .:/home/dasm dasm-docker game1.asm -ogame1_ntsc2.bin -lgame1_ntsc.lst -sgame1_ntsc.sym -DNTSC=1 -DNO_ILLEGAL_OPCODES=1 -S -f3 -v5  -I/opt/dasm/machines/atari2600
```

Note the `-v` switch to mount the current directory to the `/home/dasm` volume.


## But why?

My Linux distro (Fedora) didn't have a package for dasm and it gave me an idea to try and make it "portable" with Docker.

Would Flatpak or AppImage be better? Yes, probably. Why don't you get on that.
