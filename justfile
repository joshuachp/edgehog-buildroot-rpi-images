# build the project
build:
    ./scripts/build.sh

# Configure using ncurse
config:
    make -j"$(nproc)" -Coutput nconfig

# This should be run only once at the beginning
init:
    ./scripts/init.sh

# Clean build (should not be necessary)
clean:
    make -j"$(nproc)" -Coutput clean
# flash to a device like /dev/sdcard
flash sdcard:
    sudo $(which bmaptool) copy $PWD/artifact/sdcard.img.xz '{{ sdcard }}'
