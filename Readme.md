#Chroot Tools


Copy libraries for a minimal chroot environement.
All datas are in jail folder.

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

## For namespace
Add simple commands into jail.
```bash
./Chrootbin.sh /bin/bash
systemd-nspawn  -D jail --network-veth  /bin/bash 
```

