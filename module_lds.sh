linversion=$(uname -r)
genstr=-generic
genheaderdir=/usr/src/linux-headers-$linversion
normalheaderdir=${genheaderdir%$genstr}
genheaderdir=$genheaderdir/scripts
normalheaderdir=$normalheaderdir/scripts
fname=$genheaderdir/module.lds
if ! test -f $fname; then
    sudo cp $normalheaderdir/module.lds.S $genheaderdir/module.lds
    sudo sed -i '$ d' $genheaderdir/module.lds
    echo module.lds created
else
    echo module.lds already available
fi

