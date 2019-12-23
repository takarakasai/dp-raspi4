ARG distro

FROM ros:${distro}

# if arg is defined before FROM,
# then it can't be dereferenced unless redefined after FROM.
ARG distro=${distro}

LABEL maintainer="takarakasai <takara.kasai@gmail.com>"

RUN echo distro is $distro.

RUN apt-get update && apt-get install -y \
    ros-${distro}-desktop \
    bash-completion \
    git \
    vim

RUN echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashr && \
    echo "source /opt/ros/${distro}/setup.bash" >> ~/.bashrc
