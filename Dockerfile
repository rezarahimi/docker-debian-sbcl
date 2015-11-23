## -*- docker-image-name: "rezarahimi/debian-sbcl" -*-

FROM rezarahimi/debian
MAINTAINER Reza Rahimi <rezarahimi@gmail.com>

# SBCL Version
ENV SBCL_VERSION_MAJOR 8
ENV SBCL_VERSION_MINOR 60
ENV SBCL_VERSION_BUILD 27

# Download and unarchive Java
RUN apt-get update && apt-get install -y curl git coreutils make gcc build-essential sbcl time zlib1g-dev emacs texlive texinfo
 &&\
    git clone git://git.code.sf.net/p/sbcl/sbcl && \
    cd /sbcl && \ 
    sh make.sh --fancy && \
    sh install.sh && \
    cd /sbcl/tests && \
    sh ./run-tests.sh
    cd /sbcl/doc/manual && \
    make

CMD [ "/bin/bash" ]
