# CV — Amazon, Security Engineer, SoC / Devices and Services Security (Job ID 10384840)

Tailored from the master academic CV (`../CV_Tanvir_H_Academic`).
Output: **`cv_tanvir_hossain_amazon_secengineer.pdf`** (2 pages). Build: `compile_cv.bat`.

## Role read

- **Archetype:** engineering/applied — chip- and firmware-level security engineering for
  shipped devices (Fire TV, Eero, Alexa), not a pure research role. Duties center on design
  review, code review, testing, fuzzing, and advising product teams — closer to the offensive
  `CV_Tanvir_H_Industry` template than the research-scientist one.
- **Seniority:** mid-level (no "Sr." in title, Amazon-style ≈ L5). Explicit bar is **3+ years
  of any combination** of threat modeling, secure coding, identity/authentication, software
  development, cryptography, sysadmin, or network security — an OR-list, not years-in-role.
  Tanvir's 4.5+ years of Ph.D. hardware-security research (which includes C/LLVM software
  development and applied-cryptography work) satisfies this on its own reading.
- **Basic quals are unusually strict for this flavor of role:** "knowledge of hardware
  security mechanisms including secure boot, TEE," "OS internals (Linux/RTOS)," and
  "semiconductor reverse engineering" are all **basic (required)**, while side-channel and
  fault injection — Tanvir's strongest research area — is only a **preferred** item listed last.

## Visual design (differs from every other CV folder)

This folder's `resume.cls` is a **restyled local copy**, not the master's class. Same API
(`\name`, `\address`, `rSection`, `rSubsection`), so section files stay interchangeable, but:
Charter typeface (XCharter, scaled 0.93), navy accent color on the name / section titles /
rules / table labels, Font Awesome icons in the contact header, hanging-indent bullets with
bold lead-in phrases, and a "Core" keyword strip under the summary. **No em-dashes anywhere
in the CV** (per Tanvir's preference); date ranges use en-dashes. If you re-tailor from the
master, copy *this* `resume.cls` if you want the same look.

## How this version differs from the master

- **Summary leads with fault injection and side-channel analysis** and deliberately names
  **no papers, journals, or tools** (no SPHINX, no TCHES/TODAES) — Tanvir's request. Venue
  tags appear only as short parentheticals on individual experience bullets and in the
  publication list.
- **Reframed as chip-level security engineering, not offensive research.** Summary says
  "finds and helps close chip-level security gaps through design review, hardware reverse
  engineering, and lab-based security testing" — mirroring the JD's own framing.
- **GlitchLab preprint (arXiv:2609.00502, 2026) is #1 in Selected Publications** and is
  tagged on the Keysight "scalable fault-injection tooling" bullet. A hardware-in-the-loop
  fault-injection optimizer co-authored with Keysight/Riscure researchers is the most
  on-target single item for this JD (preferred qual: hands-on fault injection; duty: "develop
  tools and techniques to improve the security posture of devices at scale"). It is listed as a
  preprint, not counted among the 17 peer-reviewed publications. Also added to the master
  under a new "Preprints" group.
- **Experience bullets ordered FI/SCA first**, then reverse engineering / attacks on chip
  defenses (the closest true matches to the *basic* qual "semiconductor reverse engineering":
  netlist-level primitive identification/extraction, PUF authentication bypass, scan-chain
  unlocking), then software-side mitigation, then training/mentoring.
- **Threat modeling** is covered by reframing the zero-trust supply-chain / adversarial
  evaluation language already in the master (P1, P3) — the master never uses the phrase
  "threat model," but the substance (systematic adversary-capability evaluation of designs) is
  the same activity.
- **Secure coding / cryptography** covered via HOACS (C-library + LLVM transformations
  protecting cryptographic workloads) and the TCHES paper.
- **Added a training/workshops line** (side-channel tutorials + REU/course co-teaching) to
  match the JD's explicit ask to "empower others... developing training materials."
- **Skills table reorganized around the JD's own domain names**, not the master's generic EDA
  categories: Chip Security & Reverse Engineering; Side-Channel & Fault Injection; Applied
  Cryptography & Secure Coding; ML for Security; Digital Design/EDA/Embedded; Languages &
  Scripting.
- **Publications trimmed 17 → 6**, ordered by JD relevance (TODAES and SPHINX first, since
  they map to a *basic* qual; the JHSS survey paper is included last for its breadth — it
  signals broad awareness of the hardware-security landscape even though it doesn't cover
  secure boot/TEE specifically).
- **Kept a compact "Talks, Training & Professional Service" section** (two invited
  side-channel talks, a one-line teaching/outreach summary, reviewer/TPC line) because the JD
  explicitly asks for "developing training materials" and "empowering others"; it also
  balances page 2.
- **Cut:** grants, course lists, device-physics papers, education-outreach papers, and most
  poster-competition awards (kept HOST 2023 Champion, Robb Award, and a couple of the
  strongest others, matching the Industry CV's trim depth).

## JD requirement → evidence mapping

| JD item | Type | Evidence on this CV |
|---|---|---|
| 3+ yrs threat modeling / secure coding / software dev / crypto / sysadmin / network | Basic | 4.5+ yrs PhD research incl. C/LLVM dev (HOACS), applied crypto (TCHES), zero-trust adversarial evaluation |
| B.Sc. EE/CE or related | Basic | B.Sc. EEE, AUST |
| Hardware security mechanisms incl. secure boot, TEE | Basic | **Partial/weak** — see gaps below |
| OS internals, Linux/RTOS | Basic | **GAP** — see below |
| Semiconductor reverse engineering | Basic | SPHINX (netlist-level primitive ID/extraction); TODAES PUF/scan-chain attacks |
| Master's+ | Preferred | M.S. EE (KU) + Ph.D. candidate — exceeds this |
| Python, Perl, bash | Preferred | Python, Bash (yes); **Perl — not in master, not claimed** |
| Hardware/system/network security incl. crypto | Preferred | Hardware security (strong); network security not claimed |
| Code review + exploit development | Preferred | Hardware-level exploit development (PUF/scan-chain bypass) is strong; formal *code review* practice not directly evidenced |
| Fault injection + side-channel | Preferred | Strongest area on the CV — Keysight internship, ASCON talk, multiple SCA/FI publications and lab equipment |

## Verify before submitting (phrased at or above what the master states)

- **"Reverse-engineered ... design-for-security primitives"** — the master's P1 project bullet
  says "systematically identify and neutralize," which this CV compresses to "reverse-engineered
  and systematically attacked." Confirm you're comfortable with "reverse-engineered" as the verb
  in an interview — it's accurate to SPHINX's stated purpose but is a slightly sharper word than
  the master used for the TODAES/P1 work itself.
- **"Delivered hands-on side-channel security-testing tutorials and training workshops"** —
  built from the master's two invited-talk titles (Jan 2025, Feb 2024). Confirm these were
  hands-on/tutorial format (the Jan 2025 title says "Hands-On Tutorial," the Feb 2024 one does
  not explicitly) before repeating "hands-on" for both.
- **"HOST 2023: first place in the IP-security track"** — phrasing carried over unchanged from
  the Industry CV; reconfirm this description of the competition track if asked to elaborate.

## Honest gaps (cover-letter / interview material — NOT padded onto the resume)

1. **Secure boot / bootloader / firmware review — zero evidence.** No file in the master CV
   mentions secure boot, bootloader, UEFI, or firmware. This is a named basic qualification.
   If you have any relevant coursework, personal projects, or reading in this area, that's
   worth a sentence in the cover letter; otherwise, be ready to discuss it as a fast-follow
   learning area, not existing expertise.
2. **Trusted Execution Environments (TEE) — zero evidence.** No TrustZone/SGX/enclave work
   anywhere. HOACS is a *related goal* (protecting secrets on untrusted processors) achieved
   via a different mechanism (software encoding, not a hardware TEE) — do not conflate the two
   in an interview.
3. **OS internals (Linux/RTOS) — zero evidence.** The master's only OS-adjacent material is
   gem5 (x86) and MARS (MIPS) *simulators* used for teaching computer architecture — that is
   architecture, not kernel/OS-internals experience. Not claimed on this CV.
4. **Network security, identity/IAM, Perl — zero evidence.** Not claimed. The word
   "authentication" elsewhere on your CV refers to *device/IC* authentication (PUF-based), not
   user identity management — don't let that get conflated in a screen.
5. **Formal code-review practice / exploit development in the software-security sense** — your
   exploit development is real but hardware-side (breaking PUFs, scan chains, Trojan-assisted
   attacks), not software vulnerability research (no fuzzing tools, no CVEs, no memory-safety
   exploitation). The JD's "code review and exploit development" line most likely means the
   latter; be ready to pivot the conversation to your hardware-side equivalent if it comes up.

**Bottom line:** this is a genuinely good keyword match on the *preferred* side (fault
injection, side-channel, hardware/system security, crypto) and on "semiconductor reverse
engineering," but three of the five *basic* qualifications (secure boot, TEE, OS/RTOS
internals) have no supporting evidence in your record. The CV is built to be maximally honest
about what you do have (chip-level attack/defense research, reverse-engineering tooling,
crypto-adjacent software work) rather than stretching hardware-Trojan work to sound like
firmware/OS security. Decide before applying whether to address the secure-boot/TEE/RTOS gap
head-on in a cover letter (e.g., framing it as adjacent and fast-to-learn given your low-level
C/embedded background) or to treat this as a stretch application.

---
*Analysis and drafting for this tailored CV were produced via a two-agent pipeline (JD analysis
+ master-CV inventory) run on Fable 5.1 at high reasoning effort, synthesized and compiled by
Claude Sonnet 5.*
