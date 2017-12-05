# Usage

To run the docker container you need a image for your raspberry pi that supports
docker. You can use a default image and install docker yourself or you can use
an image that already supports docker. The image
[hypriot](https://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/)
for example.

If the image is working, you have to run this before launching the docker container:
```
sudo chown 1000:1000 /dev/gpiomem
```

This will make `/dev/gpiomem` accessible from within the container which can be started with:

```
docker run -it -v nerdc_home:/var/nerdc_home --device /dev/snd --device /dev/gpiomem -t benjaminfuchs/rpi-nerd-alarmclock /bin/bash
```

This will start an docker container that already has all set up for the
nerd-alarmclock. The settings should be store in /var/nerdc_home. The
command automatically creates a 'nerdc_home' docker volume, that will
survive container stop/restart/deletion. The cointainer has a script called
`start-nerdc.sh` to manually start the nerd-alarmclock. If you manually created your
`settings.json` you can use following command to only start the container with
the saved settings:

```
docker run -v nerdc_home:/var/nerdc_home --device /dev/snd --device /dev/gpiomem -t benjaminfuchs/rpi-nerd-alarmclock
```

Avoid using a bind mount from a folder on host into `/var/nerdc_home`, as this
might result in file permission issue. If you _really_ need to bind mount
jenkins_home, ensure that directory on host is accessible by the jenkins user in
container (jenkins user - uid 1000) or use `-u some_other_user` parameter with
`docker run`.

For more info check Docker docs section on [Managing data in
containers](https://docs.docker.com/engine/tutorials/dockervolumes/)
