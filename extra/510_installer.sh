echo -n "Kernel 5.10 wifi installer, only try if other methods have failed, continue? (y/n) "
read answer
if [[ $answer == ${answer#[Yy]} ]]; then
    exit 0
fi

linver=$(uname -r)
genhdrdir=/usr/src/linux-headers-$linver
normhdrdir=${genhdrdir%-generic}/scripts
genhdrdir=$genhdrdir/scripts

if [[ ${linver:0:4} != "5.10" ]]; then
    echo "Error, kernel must be 5.10"
    exit 1
fi
if ! test -d $genhdrdir -a -d $normhdrdir; then
    echo "Error, (generic) header (/scripts) directory not found, or non-standard"
    exit 1
fi

normhdrfile=$normhdrdir/module.lds.S

if ! test -f $normhdrfile; then
    echo "Error, cannot find $normhdrfile"
    exit 1
fi

module=module.lds
genhdrfile=$genhdrdir/$module

if ! test -f $genhdrfile; then
    sudo cp $normhdrfile $genhdrfile
    sudo sed -i '$ d' $genhdrfile
    echo $module created
else
    echo $module already available   
fi

../install_wifi.sh
