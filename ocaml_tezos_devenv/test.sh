#!/bin/bash

eval $(opam env) && tezos-client config reset && tezos-client -A sandbox -P 20000 bootstrapped && tezos-client -A sandbox -P 20000 config update 
eval $(opam env) && tezos-client import secret key alice unencrypted:edsk3QoqBuvdamxouPhin7swCvkQNgq4jP5KZPbwWNnwdZpSpJiEbq --force
eval $(opam env) && tezos-client import secret key bob unencrypted:edsk3RFfvaFaxbHx8BMtEW1rKQcPtDML3LXjNqMNLCzC3wLC1bWbAt --force
#tail -F wait_for_nothing
sleep infinity
