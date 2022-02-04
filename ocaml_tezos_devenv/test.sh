#!/bin/bash

sleep 15s
eval $(opam env) && tezos-client config reset && tezos-client --endpoint http://sandbox:20000 bootstrapped && tezos-client --endpoint http://sandbox:20000 config update 
eval $(opam env) && tezos-client import secret key alice unencrypted:edsk3QoqBuvdamxouPhin7swCvkQNgq4jP5KZPbwWNnwdZpSpJiEbq --force
eval $(opam env) && tezos-client import secret key bob unencrypted:edsk3RFfvaFaxbHx8BMtEW1rKQcPtDML3LXjNqMNLCzC3wLC1bWbAt --force
tezos-client originate contract demo transferring 0 from alice running ~/work/Documents/Studium/Uni/Bachelorprojekt/demo_contracts/demo.tz --init '{Elt "a" 0; Elt "j" 0}' --burn-cap 1
tezos-client originate contract votes transferring 0 from alice running ~/work/Documents/Studium/Uni/Bachelorprojekt/demo_contracts/votes.tz --init '(Pair {} (Pair { Elt "a" 0; Elt "b" 0 } (Pair { Elt "a" "tz1VSUr8wwNhLAzempoch5d6hLRiTh8Cjcjb" ; Elt "b" "tz1aSkwEot3L2kmUvcoxzjMomb9mvBNuzFK6" } 1637847000)))' --burn-cap 1
#tail -F wait_for_nothing
sleep infinity
