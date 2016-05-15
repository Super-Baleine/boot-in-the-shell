#!/bin/bash

read -p "What do you want to do ?
1) install a image on a usb driver
2) remove the iso of an usb driver
3) Exit
> " choice
case $choice in
  "1")
    read -p "Path of the .iso : " path_iso
    read -p "Path of the /dev/ driver (for example : /dev/sdb not /dev/sdb1) : " path_driver
    echo "Okay, processing...";
    cat $path_iso $path_driver || echo "There's a problem... Can you start the script and check your paths again please ?";exit 0;
    echo "It's okay !";exit 0;
    ;;
  "2")
    read -p "Path of the driver : " path_driver
    read -p "Path on the system (for example /mnt/bob/usb1/)" path_folder
    read -p "Give a name for your usb : " name_usb
    umount $path_folder
    echo Processing...
    sudo mkfs.vfat -F 32 -n $name_usb $path_driver
    echo "Finished !";
    echo -n "Do you want to go on your usb driver ? (y|n)" choice
    if [[ $choice = "y" ]]; then
      cd $path_folder;cd ../$name_usb;
      pwd;
      exit 0;
    else
      exit 0;
    fi
    ;;
  *)
    echo "Don't know...":exit 0;
    ;;
esac
exit 0;
