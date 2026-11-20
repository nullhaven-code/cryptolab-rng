# Randomness Forensics

A small weekend project to play with a linear congruential generator (LCG).
I wrote the generator in C, recovered its parameters with SageMath, and explored the binary in Ghidra.

- `src/lcg.c` — the generator
- `sage/attack.sage` — parameter recovery and prediction
- `report/report.tex` — short write-up
Run: `gcc -std=c11 -O2 src/lcg.c -o lcg && ./lcg`, then `sage sage/attack.sage`.
Recovered: `m = 2147483647`, `a = 48271`, `c = 12345`; next output: `1953266902`.
