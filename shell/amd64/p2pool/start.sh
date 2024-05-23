#!/bin/sh

export WALLET=47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa
exec p2pool --no-randomx --host 127.0.0.1 --wallet ${WALLET}
