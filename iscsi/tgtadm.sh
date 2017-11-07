#!/bin/bash

#img="/iscsi_disks/disk.img"
img="/mnt/gfclient/disk.img"
glfsimg="vol1@fujitsu02:disk.img"
if [ "$1" == "show" ]
then
  echo "executing => tgtadm --lld iscsi --mode target --op show"
  tgtadm --lld iscsi --mode target --op show
  exit
fi

if [ "$1" == "create" ]
then
  echo "executing => tgtadm --lld iscsi --mode target --op new --tid 1 --targetname iqn.2016-11.fujitsu02:target02"
  tgtadm --lld iscsi --mode target --op new --tid 1 --targetname iqn.2016-11.fujitsu02:target02
  exit
fi

if [ "$1" == "addlun" ]
then
  echo "executing => tgtadm --lld iscsi --mode logicalunit --op new --tid 1 --lun 1 -b $img"
  tgtadm --lld iscsi --mode logicalunit --op new --tid 1 --lun 1 -b $img
  exit
fi

if [ "$1" == "deletelun" ]
then
  echo "executing => tgtadm --lld iscsi --mode logicalunit --op delete --tid 1 --lun 1 -b $img"
  tgtadm --lld iscsi --mode logicalunit --op delete --tid 1 --lun 1 
  exit
fi

if [ "$1" == "deletelun" && "$2" == "2" ]
then
  echo "executing => tgtadm --lld iscsi --mode logicalunit --op delete --tid 1 --lun 2 -b $img"
  tgtadm --lld iscsi --mode logicalunit --op delete --tid 1 --lun 2 
  exit
fi

if [ "$1" == "addglfslun" ]
then
  echo "executing => tgtadm --lld iscsi --mode logicalunit --op new --tid 1 --lun 2 -b $glfsimg --bstype glfs"
  tgtadm --lld iscsi --mode logicalunit --op new --tid 1 --lun 2 -b $glfsimg --bstype glfs
  exit
fi

if [ "$1" == "bindall" ]
then
  echo "executing => tgtadm --lld iscsi --mode target --op bind --tid 1 -I ALL"
  tgtadm --lld iscsi --mode target --op bind --tid 1 -I ALL
  exit
fi

if [ "$1" == "unbindall" ]
then
  echo "executing => tgtadm --lld iscsi --mode target --op unbind --tid 1 -I ALL"
  tgtadm --lld iscsi --mode target --op unbind --tid 1 -I ALL
  exit
fi

if [ "$1" == "discovery" ]
then
  echo "executing => tgtadm --lld iscsi --mode target --op unbind --tid 1 -I ALL"
  tgtadm --lld iscsi --mode target --op unbind --tid 1 -I ALL
  exit
fi
