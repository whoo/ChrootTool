#Chroot Tools


Copy libraries for a minimal chroot environement.

## Create Chroot
With your favorite command.
```bash
./Chrootbin.sh /bin/bash
./Chrootbin.sh $(cat list)
```

## Use-it for docker :)
To use simple chroot inside docker container.
```bash
./Chrootbin.sh /bin/bash
docker build -t simple .
docker run -it --rm  simple /bin/bash
```
