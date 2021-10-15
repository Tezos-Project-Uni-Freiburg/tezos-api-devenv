# Goal
This project is a development environment for working with the tezos blockchain and its ocaml api.
It was built to work with [tezos-api](https://github.com/Qup42/tezos-api).
It includes:
1. local Tezos Blockchain sandbox
2. development environment with tezos libraries and dune installed 

# Usage
`docker-compose up -d`

To use the devenv use `docker-compose exec devenv fish`. This will give you a shell in the devenv. The tezos-client is already configure for the sandbox.

## Modification
Changing the tezos version of the sandbox and devenv can be done via the `docker-compose.yml`. E.g. code can be mounted into the container in the compose file under volumes section.
