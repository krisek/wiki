#!/usr/bin/env bash

exec 2>&1 >/var/log/reposync_lastrun

function log {
   logger -t reposync $*
   echo $* 1>&2
}

date

MIRRORDIR=/media/fileserver/mirror/RHEL-7
REPODIR=/media/fileserver/mirror/RHEL-7/7Server

if [ ! -d "$MIRRORDIR/rhel-7-server-rpms" ]
then
    sshfs reposync@mirror:$MIRRORDIR $MIRRORDIR
fi

if [ ! -d "$MIRRORDIR/rhel-7-server-rpms" ]
then
    log "No target dir $MIRRORDIR"
    exit 1
fi

cd $MIRRORDIR
for repo in rhel-7-server-rpms rhel-7-server-optional-rpms rhel-7-server-extras-rpms rhel-server-rhscl-7-rpms
do
        #reposync -n --gpgcheck -l --repoid=$repo
        #reposync -u -l --download-metadata --downloadcomps -m --repoid=$repo | grep -vi Skip | tee -a /var/log/reposync
        reposync    -l --download-metadata --downloadcomps -m --repoid=$repo | grep -vi Skip | tee -a /var/log/reposync
        yum --disablerepo=* --enablerepo=$repo clean metadata dbcache
        yum --disablerepo=* --enablerepo=$repo makecache
done

ssh reposync@mirror /media/fileserver/repoupdate7 >> /var/log/reposync_lastrun
date
cat /var/log/reposync_lastrun >> /var/log/reposync
cat /var/tmp/header /var/log/reposync_lastrun > /tmp/reposync_lastrun
log "reposync finished."
exit;
