FROM phusion/baseimage:0.9.16
MAINTAINER jann@resmio.com

# Add external APT repositories
RUN echo "deb-src http://archive.ubuntu.com/ubuntu vivid main restricted universe multiverse" | tee /etc/apt/sources.list.d/vivid.list

# Install APT dependencies
RUN apt-get update -q && apt-get install -q -y build-essential python python-pip python-dev ca-certificates antlr

# Install vivid version of Scilab
RUN apt-get -q -y build-dep libgluegen2-build-java
RUN apt-get -qq -b source libgluegen2-build-java
RUN dpkg -i libgluegen2-build-java_*_all.deb
RUN dpkg -i libgluegen2-jni_*_amd64.deb
RUN dpkg -i libgluegen2-rt-java_*_all.deb
RUN apt-get -q -y build-dep libjogl2-java
RUN apt-get -qq -b source libjogl2-java
RUN dpkg -i libjogl2-jni_*_amd64.deb
RUN dpkg -i libjogl2-java_*_all.deb
RUN dpkg -i libjogl2-toolkits_*_all.deb
RUN apt-get -q -y build-dep scilab-cli
RUN apt-get -qq -b source scilab-cli
RUN dpkg -i scilab-include_*_amd64.deb
RUN dpkg -i scilab-data_*_all.deb
RUN dpkg -i scilab-minimal-bin_*_amd64.deb
RUN dpkg -i scilab-cli_*_all.deb

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

