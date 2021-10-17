FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ocaml opam fish vim ripgrep
RUN opam init -ya --disable-sandboxing --bare
WORKDIR /root/
ARG version=7.3
RUN wget -O latest-release:version.sh https://gitlab.com/tezos/tezos/-/raw/v$version/scripts/version.sh
RUN . ./latest-release:version.sh && opam switch create for_tezos $ocaml_version 
RUN opam install -y depext
RUN opam depext tezos
RUN opam install -y tezos=$version
RUN opam install -y dune utop
RUN ["bash", "-c", "echo $(opam env) >> /root/.bashrc"]
RUN mkdir -p /root/.config/fish
RUN ["bash", "-c", "echo 'eval (opam env)' > /root/.config/fish/config.fish"]
RUN mkdir /root/work
WORKDIR /root/work
COPY test.sh /root/test.sh
COPY .ocamlinit /root/.ocamlinit
CMD ["bash", "-c", "/root/test.sh"] 
