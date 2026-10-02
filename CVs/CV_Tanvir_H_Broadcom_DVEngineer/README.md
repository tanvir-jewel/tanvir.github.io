# CV — Broadcom, Design Verification Engineer (Req R026325)

Tailored from the master academic CV (`../CV_Tanvir_H_Academic`).
Output: **`cv_tanvir_hossain_broadcom_dv.pdf`** (2 pages). Build: `compile_cv.bat`.

## Role read
- **Archetype:** engineering / applied (ASIC Design Verification).
- **Seniority:** SENIOR — JD asks for **12+ years industry experience**. Tanvir is a Ph.D.
  candidate with research + one upcoming industry internship. This is the dominant gap.
- **Core must-haves:** SystemVerilog, UVM/OVM, ASIC DV flows, coverage + assertions,
  directed/random tests, debugging sim failures, C/C++, Perl, scripting, system+block verification.

## How this version differs from the master
- Reframed from a hardware-security research CV into a **design-and-verification** CV:
  Summary leads with RTL design, functional verification (ModelSim), and Cadence synthesis.
- Added a **Design & Verification** skills row; promoted Verilog/VHDL, ModelSim, FPGA, Tcl/Bash.
- Research Assistant bullets rewritten around **block/system-level verification, testbenches,
  failure analysis, and debug** (the JD's language) — without inventing tools.
- Cut: research-interest keywords block, grants, talks, full service, teaching detail (one TA
  line kept), and most of the publication list (6 most design/VLSI-relevant kept).
- Publications reordered to put **DCAS / ICCAD / SRAM digital-circuit** papers first.

## Skills → JD mapping
| JD requirement | Evidence on this CV |
|---|---|
| RTL verification methodologies | RTL design + ModelSim functional verification, testbenches |
| System + block level verification | RA bullets; RTL eval of scan/PUF primitives project |
| ASIC DV flows | Cadence Genus/Encounter synthesis + back-end; RTL-to-GDSII framing |
| Coverage + assertions (SystemVerilog) | **GAP** — see below |
| C/C++ | C (yes); C++ not in master |
| Perl + scripting | Tcl, Bash, Python (yes); **Perl not in master** |
| Independent debug | RA bullet: debug failures to root cause |
| FPGA prototyping (plus) | Strong — multiple boards/tools |
| CPU/DDR/bus/DSP, SystemC, emulators (plus) | Partial: arch/bus/memory fundamentals; **no SystemC/emulator/DDR** |

## Verify before submitting (phrased at or above what the master states)
- **"Verilog testbench development / directed and self-checking testbenches"** — confirm you
  have concrete testbench artifacts to discuss; the master implies verification but doesn't
  itemize testbench methodology.
- **"RTL-to-GDSII flow"** — you've done RTL + synthesis (Genus/Encounter); confirm you're
  comfortable claiming the full back-end framing, or soften to "RTL-through-synthesis."
- **"analyze simulation failures … debug to root cause"** — true in spirit; make sure you can
  give a specific example in interview.

## Honest gaps (cover-letter / interview material — NOT padded onto the resume)
1. **12+ years industry experience** — not met. You are early-career (Ph.D. + internship).
   Decide whether to apply anyway; if so, the cover letter should address level directly.
2. **UVM / OVM** — not in your record. This is the methodology centerpiece of the role and is
   absent. Strongest single gap after seniority.
3. **SystemVerilog** (coverage + assertions) — master lists Verilog/VHDL, not SystemVerilog/SVA.
   Do not claim it unless true; consider building a small UVM/SV sample before interviews.
4. **Perl, C++, SystemC, hardware emulators** — none in the master. Tcl/Bash/Python + C cover
   adjacent ground but not these specifically.

**Bottom line:** strong digital-design/RTL and FPGA foundation, honestly presented, but this is
a senior 12-year UVM/SystemVerilog DV role and the methodology + seniority gaps are real. Best
used if you're targeting a more junior DV opening or can credibly close the UVM/SV gap quickly.
