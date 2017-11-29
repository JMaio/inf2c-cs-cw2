#!/bin/bash
gcc -o mem_sim mem_sim.c -std=gnu99 -lm

# ./mem_sim cache-only [page_size: 256/4096] [number_of_cache_blocks: 256/2048] [cache_block_size: 32/64] mem_trace.txt

./mem_sim cache-only 256 256 32 mem_trace.txt | grep hit-rate
./mem_sim cache-only 256 256 64 mem_trace.txt | grep hit-rate

./mem_sim cache-only 256 2048 32 mem_trace.txt | grep hit-rate
./mem_sim cache-only 256 2048 64 mem_trace.txt | grep hit-rate

./mem_sim cache-only 4096 256 32 mem_trace.txt | grep hit-rate
./mem_sim cache-only 4096 256 64 mem_trace.txt | grep hit-rate

./mem_sim cache-only 4096 2048 32 mem_trace.txt | grep hit-rate
./mem_sim cache-only 4096 2048 64 mem_trace.txt | grep hit-rate


./mem_sim tlb-only 8 256 mem_trace.txt #| grep hit-rate
echo ""
./mem_sim tlb-only 8 4096 mem_trace.txt #| grep hit-rate
echo ""
./mem_sim tlb-only 16 256 mem_trace.txt #| grep hit-rate
echo ""
./mem_sim tlb-only 16 4096 mem_trace.txt #| grep hit-rate
echo ""
