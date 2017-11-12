FROM elixir:1.5.2
WORKDIR /app
ADD . /app
RUN ./build.sh
CMD ["/bin/bash"]
