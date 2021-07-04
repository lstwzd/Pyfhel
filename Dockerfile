FROM ubuntu:bionic
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get update && apt-get install lzip git make sudo -y
RUN sudo apt-get install software-properties-common -y
RUN sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN sudo apt-get update
RUN sudo apt-get install gcc-6 g++-6 python3 python3-pip -y
RUN git clone --recursive https://github.com/ibarrond/Pyfhel
RUN cd Pyfhel && pip3 install .
