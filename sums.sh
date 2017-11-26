#!/bin/bash

# To run you need to:
# * Have compiled mem_sim.c to mem_sim in the same folder
# * Have mem_trace.txt in the same folder as this script
# * Save the script as sums.sh
# * Run: chmod +x sums.sh
# * Run: ./sums.sh

declare -A checksums
checksums['./mem_sim cache-only 256 256 32 mem_trace.txt']='f179fd37d5b0e0bad282b2bed9dc7223  -'
checksums['./mem_sim cache-only 256 256 64 mem_trace.txt']='29c6906080a55f68cf42f545ea4a6dd8  -'
checksums['./mem_sim cache-only 256 2048 32 mem_trace.txt']='62639ab4935d77feb829a57673d93554  -' 
checksums['./mem_sim cache-only 256 2048 64 mem_trace.txt']='48567ce21ecfed9f8c90e1fe23422bc5  -' 
checksums['./mem_sim cache-only 4096 256 32 mem_trace.txt']='b7164e7f9dcb8ea0739a2e3e8f260610  -' 
checksums['./mem_sim cache-only 4096 256 64 mem_trace.txt']='838fe3e1f5217da5e2e29cd3bb0a830e  -' 
checksums['./mem_sim cache-only 4096 2048 32 mem_trace.txt']='ab6e50cdeaf185464fd5c75e55922205  -' 
checksums['./mem_sim cache-only 4096 2048 64 mem_trace.txt']='74e737369e968912ab174cb880e35107  -' 
checksums['./mem_sim tlb-only 8 256 mem_trace.txt']='b49963998be83e3f642fe1b58ac6de55  -' 
checksums['./mem_sim tlb-only 8 4096 mem_trace.txt']='15b3e8f382cdfbdfc9c3374cdb9a1eea  -' 
checksums['./mem_sim tlb-only 16 256 mem_trace.txt']='284a50a9a3c559396141f94dcc22e3ea  -' 
checksums['./mem_sim tlb-only 16 4096 mem_trace.txt']='a7b7df1a937dffb716d844ac3ef87a80  -' 
checksums['./mem_sim tlb+cache 8 256 256 32 mem_trace.txt']='d487e978627bac1436c745cc4fd04e81  -' 
checksums['./mem_sim tlb+cache 8 256 256 64 mem_trace.txt']='de2dc1b6b710af74f888038926a31c07  -' 
checksums['./mem_sim tlb+cache 8 256 2048 32 mem_trace.txt']='984c749f510a881d5af5154faf5d6f44  -' 
checksums['./mem_sim tlb+cache 8 256 2048 64 mem_trace.txt']='65d0a8cda3b23085cf629ee97f71ef65  -' 
checksums['./mem_sim tlb+cache 8 4096 256 32 mem_trace.txt']='35ada0bed9ccb66da99f21bef5fc6404  -' 
checksums['./mem_sim tlb+cache 8 4096 256 64 mem_trace.txt']='93b807c29e7fcc02721a0b6eab79917f  -' 
checksums['./mem_sim tlb+cache 8 4096 2048 32 mem_trace.txt']='74ff155dab05ce6a8fd19f16601b83a5  -' 
checksums['./mem_sim tlb+cache 8 4096 2048 64 mem_trace.txt']='d5fa84ccc0f48eaf05af294c9c25a1c1  -' 
checksums['./mem_sim tlb+cache 16 256 256 32 mem_trace.txt']='c1efa017c43cac9ff9d4c544ceb825b1  -' 
checksums['./mem_sim tlb+cache 16 256 256 64 mem_trace.txt']='097ebf035134d0fb49b28cb2a444b7bb  -' 
checksums['./mem_sim tlb+cache 16 256 2048 32 mem_trace.txt']='4063923329f1d72b164f27ddab7e9132  -' 
checksums['./mem_sim tlb+cache 16 256 2048 64 mem_trace.txt']='96370d13c02819a6c8829317b341801f  -' 
checksums['./mem_sim tlb+cache 16 4096 256 32 mem_trace.txt']='a284f8ad3602470534d3c6418e7c46f7  -' 
checksums['./mem_sim tlb+cache 16 4096 256 64 mem_trace.txt']='3802c0d5e9ccd6bc8743ea4bfac67154  -' 
checksums['./mem_sim tlb+cache 16 4096 2048 32 mem_trace.txt']='7d5c6f064f0f2ad0a3cf960ab99136d4  -' 
checksums['./mem_sim tlb+cache 16 4096 2048 64 mem_trace.txt']='4e8f232e1606b29be4c846a6d4bf9021  -' 

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

for ps in 256 4096 ; do
for ncb in 256 2048 ; do
for cbs in 32 64 ; do
    CMD="./mem_sim cache-only $ps $ncb $cbs mem_trace.txt"
    sum="$($CMD | md5sum)"
    if [ "$sum" == "${checksums[$CMD]}" ]; then
        echo -e "${GREEN}Success${NC}: $CMD"
    else
        echo -e "\t${RED}Failed${NC}: $CMD"
        echo -e "\tExpected: ${checksums[$CMD]} Found: $sum"
    fi
done; done; done;

echo

for te in 8 16 ; do
for ps in 256 4096 ; do
    CMD="./mem_sim tlb-only $te $ps mem_trace.txt"
    sum="$($CMD | md5sum)"
    if [ "$sum" == "${checksums[$CMD]}" ]; then
        echo -e "${GREEN}Success${NC}: $CMD"
    else
        echo -e "\t${RED}Failed${NC}: $CMD"
        echo -e "\tExpected: ${checksums[$CMD]} Found: $sum"
    fi
done; done;

echo 

for te in 8 16 ; do
for ps in 256 4096 ; do
for ncb in 256 2048 ; do
for cbs in 32 64 ; do
    CMD="./mem_sim tlb+cache $te $ps $ncb $cbs mem_trace.txt"
    sum="$($CMD | md5sum)"
    if [ "$sum" == "${checksums[$CMD]}" ]; then
        echo -e "${GREEN}Success${NC}: $CMD"
    else
        echo -e "\t${RED}Failed${NC}: $CMD"
        echo -e "\tExpected: ${checksums[$CMD]} Found: $sum"
    fi
done; done; done; done;
