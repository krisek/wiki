#utox install on debian strech 9

https://github.com/uTox/uTox

sudo apt install git build-essential libtool autotools-dev automake checkinstall check git \
                             yasm pkg-config libsodium18 libsodium-dev libvpx4 libvpx-dev libopus0 libopus-dev libedbus-dev \
                             cmake \
                             libv4l-0 libv4l-dev libxext6 libxext-dev
                             
git clone https://github.com/TokTok/c-toxcore.git
cd c-toxcore/
mkdir _build
cd _build/
cmake ..
make
sudo make install
cd ../..

git clone https://github.com/irungentoo/filter_audio.git
cd filter_audio/
make
sudo make install
cd ..

git clone https://github.com/uTox/uTox.git
cd uTox/
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make
sudo make install

LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/utox

tar zcvf package.tar.gz /usr/local/bin/utox /usr/local/lib/lib* /usr/local/share/{applications,icons,man}

on target machine
sudo apt install libasan3 libasound2 libbsd0 libc6 libdbus-1-3 libexpat1 libfontconfig1 libfreetype6 libgcc1 libgcrypt20 \ 
                             libgpg-error0 libjpeg62-turbo liblz4-1 liblzma5 libopenal1 libopus0 libpcre3 libpng16-16 libselinux1 libsndio6.1 \ 
                             libsodium18 libstdc++6 libsystemd0 libv4lconvert0 libvpx4 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxrender1 zlib1g
                             
                             
