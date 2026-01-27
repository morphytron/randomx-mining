
nssm install xmRigMiningService "C:\Users\dapat\git\randomx-mining\amd64\xmrig-no-docker\xmrig.exe"
nssm set xmRigMiningService AppParameters "-u 47ycYS8t79DSyYAYnpXGVJTSiGXAW7qnEVBXfwVfeQ9f4HYWLWEn2imV2WUZWTMPVbjTFaWFhDSxiUU22GscsCDnR7yWcEa.amd-worker-1/dapatiga@gmail.com -o xmr-us-east1.nanopool.org:10343"
nssm set xmRigMiningService AppDirectory "C:\Users\dapat\git\randomx-mining\amd64\xmrrig-no-docker"
nssm set xmRigMiningService AppStdout "C:\Users\dapat\git\randomx-mining\logs\xmrig-service.log"
nssm set xmRigMiningService AppStderr "C:\Users\dapat\git\randomx-mining\logs\xmrig-error.log"
nssm start xmRigMiningService