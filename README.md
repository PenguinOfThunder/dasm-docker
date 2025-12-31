# Dasm Docker

Docker container that lets you run dasm without installing it.

You probably don't need this. And it's less convenient than just installing the real thing.

**This is not affiliated with the [dasm](https://dasm-assembler.github.io/) project in any way. It was created for my own use.**


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

## GitHub Image (GHCR)

This repo has a GitHub workflow to build and publish an image ready-to-use.

- **Trigger:** push to `main`, push a `v*` tag (e.g. `v1.2.3`), or run the workflow manually from the Actions UI (`workflow_dispatch`).
- **Publish:** the workflow builds multi-arch images (`amd64` + `arm64`) and publishes them to GitHub Container Registry (`ghcr.io`).
- **Pull (public image):**

```bash
docker pull ghcr.io/OWNER/REPO:latest
docker pull ghcr.io/OWNER/REPO:v1.2.3
```

- **Pull (private image):** authenticate with a Personal Access Token that has `read:packages`:

```bash
docker login ghcr.io -u YOUR_GITHUB_USERNAME -p YOUR_PAT
docker pull ghcr.io/OWNER/REPO:latest
```

Replace `OWNER/REPO` with your GitHub owner and repository name (for example `myuser/myrepo`).

The workflow also pushes the commit SHA tag; you will see images tagged as `ghcr.io/OWNER/REPO:latest`, `ghcr.io/OWNER/REPO:<sha>`, and `ghcr.io/OWNER/REPO:<tag>` for tag-created releases.

