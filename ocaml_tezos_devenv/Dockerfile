FROM debian:bookworm

WORKDIR /root/
ARG version=11.0

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ocaml opam fish vim ripgrep
RUN opam init -ya --disable-sandboxing --bare
RUN wget -O latest-release:version.sh https://gitlab.com/tezos/tezos/-/raw/v$version/scripts/version.sh
RUN . ./latest-release:version.sh && opam switch create for_tezos $ocaml_version 
RUN eval $(opam env) && opam update
RUN eval $(opam env) && opam install -y --confirm-level=unsafe-yes tezos=$version
RUN eval $(opam env) && opam install -y dune utop ppx_jane alcotest alcotest-lwt odoc
RUN ["bash", "-c", "echo $(opam env) >> /root/.bashrc"]
RUN mkdir -p /root/.config/fish
RUN ["bash", "-c", "echo 'eval (opam env)' > /root/.config/fish/config.fish"]
RUN mkdir /root/work
WORKDIR /root/work/Documents/Studium/Uni/Bachelorprojekt/test_proj/newer/
COPY ./test.sh /root/test.sh
COPY .ocamlinit /root/.ocamlinit
CMD ["bash", "-c", "/root/test.sh"] 
