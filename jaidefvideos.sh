video=$1
output=$2
get=$(wget $video -O - | grep tumblr | grep video | grep -o -P '(?<=i_Frame).*(?=style)' | sed -e 's:"><::g' -e 's:iframe src=::g' -e 's/style.*$//g' | sed "s/'//g" ) && get2=$(wget $get -O - | grep video_file | grep -o -P '(?<=src).*(?=type)' | sed -e 's:="::g' -e 's/"//g') && wget $get2 -O $output

