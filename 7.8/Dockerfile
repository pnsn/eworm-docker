FROM centos:7
MAINTAINER joncon@uw.edu

ENV EW_VER 7.8


#install packages
RUN yum update -y && yum install -y glibc-devel.i686 \
  libgcc.i686 \
  libstdc++-devel.i686 \
  libgfortran.i686 \
  gcc \
  gcc-fortran.x86_64 \
  libgfortran.x86_64 \
  make \
  compat-gcc-34-g77.x86_64 \
  wget \
  which \
  vim \
  less 


#stub out dirs
RUN mkdir -p /eworm/run/params \
  /eworm/run/log \
  /eworm/tankfiles

#get ew and unzip
RUN cd /eworm \
  && wget http://folkworm.ceri.memphis.edu/ew-dist/v$EW_VER/earthworm_$EW_VER-src.tar.gz \
  && tar -xzvf earthworm_$EW_VER-src.tar.gz

ENV EW_LINUX_FILE=/eworm/earthworm_$EW_VER/environment/ew_linux.bash

#edit environment
RUN sed -i -e s/run_working/run/g $EW_LINUX_FILE \
  && sed -i -e 's/^export GLOBALFLAGS.*/export GLOBALFLAGS="-fno-stack-protector -m32 -Dlinux -D__i386 -D_LINUX -D_INTEL -D_USE_SCHED  -D_USE_PTHREADS -D_USE_TERMIOS -I${EW_HOME}\/${EW_VERSION}\/include"/' $EW_LINUX_FILE \
  && sed -i -e 's/^export EW_HOME=.*/export EW_HOME="${EW_INSTALL_HOME:-\/eworm}"/' $EW_LINUX_FILE \
  && cp $EW_LINUX_FILE /eworm/run/params
  
RUN echo "source $EW_LINUX_FILE" >> /root/.bashrc

RUN source /root/.bashrc

RUN source $EW_LINUX_FILE

#compile

#this doesn't work, even when adding the env variables before the command.
#just shell in and compile
#RUN cd /eworm/earthworm_$EW_VER/src \
#  && make unix
  
#copy files
RUN cp /eworm/earthworm_$EW_VER/params/* /eworm/run/params \
  && cp /eworm/earthworm_$EW_VER/environment/earthworm.d /eworm/run/params \
  && cp /eworm/earthworm_$EW_VER/environment/earthworm_global.d /eworm/run/params \
  && cp /eworm/earthworm_$EW_VER/environment/earthworm_commonvars.d /eworm/run/params

VOLUME /eworm/run/params
CMD [/eworm/earthworm_7.8/bin/startstop]