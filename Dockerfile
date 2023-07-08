# Use an official Python runtime as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Update package repositories
RUN apt-get update

# Install system dependencies
RUN apt-get install -y \
    build-essential \
    cmake \
    python3 \
    g++ \
    libxerces-c-dev \
    libfox-1.6-dev \
    libgdal-dev \
    libproj-dev \
    libgl2ps-dev \
    python3-dev \
    swig \
    default-jdk \
    maven \
    libeigen3-dev \
    git

# Clone SUMO from GitHub
RUN git clone --recursive https://github.com/eclipse/sumo.git

# Build SUMO from source
RUN cd sumo && \
    mkdir build/cmake-build  && \
    cd build/cmake-build  && \
    cmake ../.. && \
    make -j$(nproc)

# Create a volume to persist SUMO binaries
VOLUME /app/sumo/bin

# Add SUMO to the PATH
ENV PATH="/app/sumo/bin:${PATH}"

# Copy the simulation files into the container
COPY . /app

# Set the entry point to start a shell session
CMD ["/bin/bash"]

