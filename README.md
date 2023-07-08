# sumo-docker
Create a docker container of SUMO
This Dockerfile install the dependencies to run SUMO and pulls the latest stable realese from their [GitHub repo](https://github.com/eclipse/sumo.git). 

To biuld the container pull the repository and then run:

```docker build -t sumo-docker . ```

If you have built the container before it will use cahced files, to avoid it you can use ```--no-cache``` when building the container. 

To make the container have access to local files on the machine, we need to mount a volume when running the container:

```docker run -v /path/to/local/files:/path/in/container -it sumo-docker ```

