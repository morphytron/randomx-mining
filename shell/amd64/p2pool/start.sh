#!/bin/sh

export WALLET=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa
p2pool --no-randomx --light-mode --host 0.0.0.0 --wallet ${WALLET} &
