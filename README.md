# edgehog-buildroot-rpi-images

## A Raspberry Pi 4 64-OS image based on Buildroot with Rauc and Edgehog.

---

## Installation.

- Get a 4 GB SD-card which will hold the image.
- Download the image BR2-RAUC-EDGEHOG-date.zip from
  [github releases page](https://github.com/edgehog-device-manager/edgehog-buildroot-rpi-images/releases)
- Extract the image
- Flash the image on the SD-card with bmap-tools

```shell
bmaptool copy images/sdcard.img.xz /dev/sda
```

- Insert the SD-card in your Raspberry Pi 4.

## Edgehog Device Runtime Configuration

Edgehog Device Runtime can be configured using a TOML file located
`/var/lib/edgehog-device-runtime/edgehog-config.toml`. For more information, see
[Edgehog Device Runtime repo](https://github.com/edgehog-device-manager/edgehog-device-runtime)

## Build tips

Add the following lines to the `br2rauc/board/post-build.sh` script to configure a local hostname:

```sh
sed -i '/api.astarte.localhost/d' ${TARGET_DIR}/etc/hosts
echo '<IP> api.astarte.localhost dashboard.astarte.localhost grafana.astarte.localhost broker.astarte.localhost minio-storage.edgehog.localhost' >>${TARGET_DIR}/etc/hosts
```

Remember to configure the following options:

- External toolchain
- Ccaching
- disable trigger systemd-tmpfiles
- gnutls for uboot
