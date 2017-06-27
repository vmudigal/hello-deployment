
# add a graphical desktop, make it the default
sudo yum groupinstall -y "GNOME Desktop" "Graphical Administration Tools"
sudo systemctl set-default graphical.target

# For installing Virtual Box Additions
# do this second so Xwindows is there before the additions run
sudo yum install -y bzip2 gcc kernel-devel
sudo mount /dev/sr0 /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /dev/sr0 /mnt

# on the next reboot, the system will be running the graphical.target
# uncomment to automate the reboot after provisioning
sudo /sbin/reboot