
killrouterpumba() {

    if [ -z $1 ]; then
        local pid=`ps axw | grep pumba | grep router | awk '{split($0,a, " "); print a[1]}'`
    else
        local pid=`ps axw | grep pumba | grep router | grep $1 | awk '{split($0,a, " "); print a[1]}'`
    fi

    for p in $pid; do
        kill $p
    done
}

startrouterpumba() {

    local routercmd=`cat $jamfolder/pumba/outfog_cmd`
    $routercmd $@ &
}

restartrouterpumba() {

    killrouterpumba $@
    startrouterpumba $@
}


killfogpumba() {

    if [ -z $1 ]; then
        local pid=`ps axw | grep pumba | grep fog | awk '{split($0,a, " "); print a[1]}'`
    else
        local pid=`ps axw | grep pumba | grep fog | grep $1 | awk '{split($0,a, " "); print a[1]}'`
    fi

    for p in $pid; do
        kill $p
    done
}

startfogpumba() {

    local fogcmd=`cat $jamfolder/pumba/infog_cmd`
    $fogcmd $@ &
}

restartfogpumba() {

    killfogpumba $@
    startfogpumba $@
}


killcloudpumba() {

    if [ -z $1 ]; then
        local pid=`ps axw | grep pumba | grep cloud | awk '{split($0,a, " "); print a[1]}'`
    else
        local pid=`ps axw | grep pumba | grep cloud | grep $1 | awk '{split($0,a, " "); print a[1]}'`
    fi

    if [ ! -z $pid ]; then
        kill $pid
    fi
}

startcloudpumba() {

    local cloudcmd=`cat $jamfolder/pumba/cloud_cmd`
    $cloudcmd $@ &
}

restartcloudpumba() {

    killcloudpumba $@
    startcloudpumba $@
}
