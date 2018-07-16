# CEntOS 7 configuration

Start by configuring the user as a *sudoer* user and installing `git`.

## *sudoer* user

Log as root and add your user to the `wheel` group, allowing it to execute administrative commands with `sudo`.

```shell
su -
usermod --append --groups wheel <user>
exit
```

It is necessary to log out and log in again to the group changes to take effect (no need to restart the machine, just log off the user and log back in).

## `git` install

```shell
sudo yum --assumeyes update
sudo yum --assumeyes install git
git clone https://github.com/aguirreeng/linux-configs.git
```

## installation

```shell
sudo bash ./machine-intstall-sudo-centos.sh
bash ./machine-install-centos.sh
```