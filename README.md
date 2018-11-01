# rpi-ros
RaspberryPi Ros docker image


## Run ARM Docker Images on ubuntu
    apt-get update && apt-get install -y --no-install-recommends qemu-user-static binfmt-support
    update-binfmts --enable qemu-arm
    update-binfmts --display qemu-arm
    sudo chmod a+x /usr/bin/qemu-*
    docker run -it --privileged -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static arm32v7/ubuntu bash
https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
