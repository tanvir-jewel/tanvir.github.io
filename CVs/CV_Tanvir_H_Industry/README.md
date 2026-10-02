# Industry Resume — Tailored for NVIDIA Offensive Hardware Security Researcher (JR2016209)

Built from the academic CV in `../CV_Tanvir_H_Academic`, repositioned for an industry
hiring manager. Compile with `compile_cv.bat` (produces `cv_tanvir_hossain_industry.pdf`).

## What changed vs. the academic CV and why

**Reframed everything as offensive security.** The job is "think like an attacker."
The academic CV described work neutrally ("conducted research on hardware security");
this version leads with the attacks: Trojan-assisted meta-attacks, PUF authentication
bypass, scan-chain unlocking, netlist reverse engineering (SPHINX), side-channel and
fault attacks on ASCON.

**Summary replaces Objective.** Industry recruiters skim for 10 seconds; the summary
front-loads the JD keywords (side-channel, fault injection, reverse engineering, RTL,
LLVM, ML-driven attack automation) plus the two strongest proof points: TCHES
publication and HOST 2023 Champion.

**Skills table rewritten against the JD checklist:**
- "side-channel analysis and mitigation for cryptographic primitives" → first skills row
- "ML techniques for side-channel attacks" → dedicated ML-for-Security row
- "ChipWhisperer, debugging" → SCA & Lab Equipment row
- "low-level C, Verilog" → Languages row
- "SoC/ASIC architecture" → Digital Design & EDA row (Cadence flow, gem5)

**Cut entirely:** grants, course lists, peer-review service, summer-camp/TA/co-instructor
entries (condensed to one mentorship bullet), research talks (folded into the ASCON
bullet), nanoelectronics/graphene papers, undergrad-era competition awards.

**Publications trimmed 17 → 7,** ordered by relevance to the role (TCHES first), with a
one-line count + Google Scholar link for the rest.

**Education moved below Experience** — standard for industry; the Ph.D. timing is
already in the summary's first line.

## Verify before submitting (claims I phrased from your records)

- "Led an in-depth security evaluation of lightweight homomorphic obfuscation schemes"
  — neutral phrasing of the TCHES 2026 paper; sharpen to "broke / demonstrated attacks
  on" if that's what the paper shows.
- "Demonstrated power side-channel and fault attacks on ASCON" — based on your
  Feb 2024 invited talk title; confirm you're comfortable defending this in interview.
- "embedded-target bring-up and debugging" (skills) — kept generic; add "JTAG/SWD"
  explicitly only if you've genuinely used them (the JD lists JTAG).

## Known gaps vs. the JD (address in cover letter / interview, do not pad the resume)

- **ARM/RISC-V assembly**: you list MIPS. MIPS→RISC-V is a short hop — consider a
  small RISC-V project before the interview, or mention transferability in the cover letter.
- **TEE / Confidential Computing, symbolic execution / fuzzing, IDA Pro / Ghidra**:
  not in your background; the JD only requires 2+ expertise areas and you solidly have
  side-channel + ML-for-SCA + ChipWhisperer/lab + publications track record.
- **"6+ years in a security-related field"**: you have ~4.5 years of PhD security research
  plus the Keysight internship. PhD research years typically count; the publication record
  and HOST win argue capability over tenure. Expect Level 4 rather than Level 5.
