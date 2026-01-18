---
layout: post
title: "Fault Attack Fundamentals Part-1: Clock and Voltage Glitching with ChipWhisperer Husky"
date: 2026-01-18
author: Tanvir Hossain
categories: [hardware-security, fault-injection, embedded-systems]
tags: [ChipWhisperer, Husky, glitch-attacks, clock-glitching, voltage-glitching, fault-injection, hardware-security, embedded-security]
excerpt: "A comprehensive academic introduction to fault injection attack methodologies using the ChipWhisperer Husky platform. This tutorial provides systematic coverage of clock glitching and voltage glitching parameter configurations for embedded systems security research."
no_toc: true
---

## Abstract

Fault injection attacks represent a critical class of physical security threats against embedded systems and cryptographic implementations. This tutorial provides a comprehensive introduction to glitch-based fault injection techniques using the ChipWhisperer Husky platform. We present systematic coverage of both clock glitching and voltage glitching methodologies, detailing their theoretical foundations, parameter configurations, and practical implementation considerations. This work serves as a foundational resource for researchers and practitioners in the field of hardware security, providing detailed specifications of controllable parameters and their effects on fault injection success rates.

## Table of Contents

1. [Clock Glitch](#clock-glitch)
2. [Voltage Glitch](#voltage-glitch)
3. [Understanding Glitch Parameters](#understanding-glitch-parameters)
4. [Implementation Methodology and API Configuration](#implementation-methodology-and-api-configuration)

---

## Clock Glitch

### Theoretical Foundation of Clock Glitching

Clock glitching represents a temporal fault injection methodology that exploits the critical timing dependencies inherent in synchronous digital systems. This technique induces transient perturbations in the target device's clock signal, resulting in violations of setup and hold time requirements that can manifest as computational errors, instruction skipping, or security mechanism bypasses.

The underlying principle leverages the fact that digital circuits require stable clock edges to ensure proper data propagation through sequential logic elements. When the clock signal experiences abnormal transitions or timing violations, the combinational logic may not have sufficient time to settle, leading to metastable states or incorrect data latching.

The ChipWhisperer Husky platform implements clock glitching through precise manipulation of Mixed-Mode Clock Manager (MMCM) phase relationships, enabling fine-grained control over glitch timing and duration. The fault manifestation depends on several factors:

- **Temporal precision**: The exact phase relationship between the glitch and the target instruction execution
- **Glitch amplitude**: The degree of timing violation introduced
- **Target architecture sensitivity**: Processor-specific responses to timing anomalies
- **Environmental conditions**: Temperature, voltage, and process variations affecting timing margins

### Parameter Specification and Control Interface

The ChipWhisperer Husky platform provides comprehensive control over clock glitching parameters through its Python API. The following table presents all controllable parameters available for clock glitch configuration, detailing their API endpoints, data types, operational ranges, and functional descriptions.

<table border="1" style="border-collapse: collapse; width: 100%;">
<thead>
<tr style="background-color: #f2f2f2;">
<th style="border: 1px solid #ddd; padding: 8px;">Parameter</th>
<th style="border: 1px solid #ddd; padding: 8px;">Husky API</th>
<th style="border: 1px solid #ddd; padding: 8px;">Type</th>
<th style="border: 1px solid #ddd; padding: 8px;">Range</th>
<th style="border: 1px solid #ddd; padding: 8px;">Supported</th>
<th style="border: 1px solid #ddd; padding: 8px;">Description</th>
</tr>
</thead>
<tbody>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Width</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.width</code></td><td style="border: 1px solid #ddd; padding: 8px;">Continuous</td><td style="border: 1px solid #ddd; padding: 8px;">0 - 4592 (phase steps)</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Duration/strength of the clock glitch. Higher values = stronger glitch but more resets. On Husky, measured in MMCM phase shift steps, NOT percentages.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Offset</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.offset</code></td><td style="border: 1px solid #ddd; padding: 8px;">Continuous</td><td style="border: 1px solid #ddd; padding: 8px;">0 - 4592 (phase steps)</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Phase offset of the glitch within a clock cycle. Determines WHERE in the clock cycle the glitch occurs.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Ext_Offset</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.ext_offset</code></td><td style="border: 1px solid #ddd; padding: 8px;">Integer</td><td style="border: 1px solid #ddd; padding: 8px;">0 - trig_count</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Number of clock cycles to wait AFTER trigger before injecting glitch. Coarse timing control for hitting the right instruction.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Repeat</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.repeat</code></td><td style="border: 1px solid #ddd; padding: 8px;">Integer</td><td style="border: 1px solid #ddd; padding: 8px;">1 - 255</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Number of consecutive glitch pulses to inject. Higher values increase fault probability but also reset probability.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Clock Source</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.clk_src</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"pll", "clkgen"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Source clock for the glitch module. PLL recommended for Husky.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Output Mode</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.output</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"clock_xor", "clock_or", "glitch_only", "enable_only"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">How the glitch modifies the clock signal. "clock_xor" is typical for clock glitching.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Trigger Source</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.trigger_src</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"ext_single", "ext_continuous", "manual"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">What triggers the glitch injection. "ext_single" waits for firmware trigger.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Clock Frequency</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.clock.clkgen_freq</code></td><td style="border: 1px solid #ddd; padding: 8px;">Continuous</td><td style="border: 1px solid #ddd; padding: 8px;">1MHz - 200MHz+</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Base clock frequency for target. Changing this affects ALL timing relationships.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Phase Shift Steps</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.phase_shift_steps</code></td><td style="border: 1px solid #ddd; padding: 8px;">Read-only</td><td style="border: 1px solid #ddd; padding: 8px;">4592 (Husky)</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Maximum available phase shift resolution. Use to normalize width/offset.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Glitch Enabled</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.enabled</code></td><td style="border: 1px solid #ddd; padding: 8px;">Boolean</td><td style="border: 1px solid #ddd; padding: 8px;">True/False</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Master enable for glitch module. MUST be True for Husky.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>HS2 Output</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.io.hs2</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"clkgen", "glitch"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Clock routing to target. "glitch" for clock glitching, "clkgen" for normal operation.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Glitch Polarity</strong></td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">No</td><td style="border: 1px solid #ddd; padding: 8px;">Not exposed - hardware defined</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Glitch Shape/Waveform</strong></td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">No</td><td style="border: 1px solid #ddd; padding: 8px;">Cannot specify arbitrary waveforms</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Edge Slew Rate</strong></td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">No</td><td style="border: 1px solid #ddd; padding: 8px;">Fixed by hardware design</td></tr>
</tbody>
</table>

---

## Voltage Glitch

### Theoretical Foundation of Voltage Glitching

Voltage glitching constitutes a power-domain fault injection methodology that exploits the fundamental dependency of CMOS logic on adequate supply voltage levels for reliable operation. This technique induces transient undervoltage conditions that can compromise the noise margins of digital circuits, leading to logic errors and computational faults.

The physical mechanism underlying voltage glitching relates to the voltage-dependent switching characteristics of CMOS transistors. When the supply voltage falls below the minimum operating threshold (V_DD,min), several failure modes may manifest:

- **Reduced drive strength**: Insufficient current to charge/discharge node capacitances within the clock period
- **Threshold voltage violations**: Logic levels falling below switching thresholds
- **Propagation delay increases**: Extended signal transition times causing timing violations
- **Memory cell instability**: SRAM and latch corruption due to insufficient retention voltage

The ChipWhisperer Husky implements voltage glitching through a crowbar circuit architecture utilizing both low-power and high-power MOSFET switches. This dual-stage design enables precise control over fault amplitude while maintaining compatibility with various target power domains.

**Crowbar Circuit Analysis**: The fault injection mechanism operates by temporarily short-circuiting the target's supply voltage through controlled MOSFET activation. The fault amplitude depends on:
- Target power supply impedance
- Crowbar MOSFET on-resistance  
- Decoupling capacitor characteristics
- Load current requirements during fault injection

### Parameter Specification and Control Interface

The voltage glitch parameter configuration utilizes the same timing control framework as clock glitching, with additional power-domain specific controls. The following table details all available voltage glitching parameters for the ChipWhisperer Husky platform.

<table border="1" style="border-collapse: collapse; width: 100%;">
<thead>
<tr style="background-color: #f2f2f2;">
<th style="border: 1px solid #ddd; padding: 8px;">Parameter</th>
<th style="border: 1px solid #ddd; padding: 8px;">Husky API</th>
<th style="border: 1px solid #ddd; padding: 8px;">Type</th>
<th style="border: 1px solid #ddd; padding: 8px;">Range</th>
<th style="border: 1px solid #ddd; padding: 8px;">Supported</th>
<th style="border: 1px solid #ddd; padding: 8px;">Description</th>
</tr>
</thead>
<tbody>

<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Width</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.width</code></td><td style="border: 1px solid #ddd; padding: 8px;">Continuous</td><td style="border: 1px solid #ddd; padding: 8px;">0 - 4592 (phase steps)</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Duration of voltage dip. Longer = stronger effect but higher reset risk.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Offset</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.offset</code></td><td style="border: 1px solid #ddd; padding: 8px;">Continuous</td><td style="border: 1px solid #ddd; padding: 8px;">0 - 4592 (phase steps)</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Phase offset for voltage glitch timing within a clock cycle.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Ext_Offset</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.ext_offset</code></td><td style="border: 1px solid #ddd; padding: 8px;">Integer</td><td style="border: 1px solid #ddd; padding: 8px;">0 - trig_count</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Clock cycles delay after trigger before voltage glitch.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Repeat</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.repeat</code></td><td style="border: 1px solid #ddd; padding: 8px;">Integer</td><td style="border: 1px solid #ddd; padding: 8px;">1 - 255</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Number of voltage glitch pulses.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>MOSFET Mode</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.vglitch_setup()</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"lp", "hp", "both"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Controls which crowbar MOSFETs are active. "lp" = low power (weaker), "hp" = high power (stronger), "both" = strongest.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>LP MOSFET</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.io.glitch_lp</code></td><td style="border: 1px solid #ddd; padding: 8px;">Boolean</td><td style="border: 1px solid #ddd; padding: 8px;">True/False</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Individual low-power MOSFET enable.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>HP MOSFET</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.io.glitch_hp</code></td><td style="border: 1px solid #ddd; padding: 8px;">Boolean</td><td style="border: 1px solid #ddd; padding: 8px;">True/False</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Individual high-power MOSFET enable.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Output Mode</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.output</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"glitch_only", "enable_only"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">For voltage glitching, typically use "glitch_only".</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Trigger Source</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.trigger_src</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"ext_single", "ext_continuous", "manual"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">What triggers the voltage glitch.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Clock Source</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.clk_src</code></td><td style="border: 1px solid #ddd; padding: 8px;">Discrete</td><td style="border: 1px solid #ddd; padding: 8px;">"pll", "clkgen"</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Clock source for timing the voltage glitch.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Glitch Reset</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.io.vglitch_reset()</code></td><td style="border: 1px solid #ddd; padding: 8px;">Method</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Reset glitch state after injection. Call between glitches if needed.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Glitch Enabled</strong></td><td style="border: 1px solid #ddd; padding: 8px;"><code>scope.glitch.enabled</code></td><td style="border: 1px solid #ddd; padding: 8px;">Boolean</td><td style="border: 1px solid #ddd; padding: 8px;">True/False</td><td style="border: 1px solid #ddd; padding: 8px;">Yes</td><td style="border: 1px solid #ddd; padding: 8px;">Master enable for glitch module.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Voltage Depth (DAC)</strong></td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">No</td><td style="border: 1px solid #ddd; padding: 8px;">Strength is via MOSFET selection, not continuous voltage control.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Edge Slew Control</strong></td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">No</td><td style="border: 1px solid #ddd; padding: 8px;">Fixed by hardware.</td></tr>
<tr><td style="border: 1px solid #ddd; padding: 8px;"><strong>Baseline VCC</strong></td><td style="border: 1px solid #ddd; padding: 8px;">External</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">N/A</td><td style="border: 1px solid #ddd; padding: 8px;">External</td><td style="border: 1px solid #ddd; padding: 8px;">Requires separate power supply control, not Husky API.</td></tr>
</tbody>
</table>

---

## Understanding Glitch Parameters

### Core Timing Parameters

All glitch types share these fundamental timing parameters:

### System-Level Configuration Parameters

The following parameters define the experimental environment and platform configuration that affects both clock and voltage glitching methodologies:

| Parameter | Husky API | Type | Range | Description |
|-----------|-----------|------|-------|-------------|
| Target Clock Frequency | `scope.clock.clkgen_freq` | Continuous | 1-200+ MHz | Base clock for target device |
| ADC Samples | `scope.adc.samples` | Integer | 1 - 131124 | Power trace capture length |
| ADC Timeout | `scope.adc.timeout` | Float | 0.1 - 10+ seconds | Timeout for trigger detection |
| Trigger Module | `scope.trigger.module` | Discrete | "basic" | Trigger configuration |
| Baud Rate | `target.baud` | Integer | Platform-dependent | Serial communication speed |
| Target Reset | `scope.io.nrst` | Discrete | "low", "high_z" | Hardware reset control |
| ADC Trigger Count | `scope.adc.trig_count` | Read-only | Integer | Cycles between trigger high/low |
| ADC State | `scope.adc.state` | Read-only | Boolean | Check if ADC is stuck |

---

## Implementation Methodology and API Configuration

This section presents the systematic approach to configuring the ChipWhisperer Husky platform for fault injection experiments. The implementation follows established protocols for embedded systems security research and provides reproducible experimental setups.

### Clock Glitch Configuration Protocol

The following implementation demonstrates the systematic configuration of clock glitching parameters according to established research methodologies:

```python
# Enable glitch module (REQUIRED for Husky)
scope.glitch.enabled = True

# Clock source for glitch generation
scope.glitch.clk_src = "pll"  # Use PLL for Husky

# How glitch modifies clock
scope.glitch.output = "clock_xor"  # XOR glitch with clock

# Trigger source
scope.glitch.trigger_src = "ext_single"  # Wait for firmware trigger

# Route glitch to target
scope.io.hs2 = "glitch"

# Disable ADC errors during glitching
scope.adc.lo_gain_errors_disabled = True
scope.adc.clip_errors_disabled = True

# Core glitch parameters
scope.glitch.width = 2000       # Phase shift steps (0-4592)
scope.glitch.offset = 2000      # Phase shift steps (0-4592)
scope.glitch.ext_offset = 10    # Clock cycles after trigger
scope.glitch.repeat = 5         # Number of glitch pulses

# Get available phase shift range
max_steps = scope.glitch.phase_shift_steps  # Returns 4592 for Husky
```

### Voltage Glitch Configuration Protocol

The voltage glitching implementation requires careful consideration of target power characteristics and crowbar circuit parameters:

```python
# Quick setup method
scope.vglitch_setup('both', default_setup=False)  # 'lp', 'hp', or 'both'

# Or manual setup
scope.glitch.enabled = True
scope.glitch.clk_src = "pll"
scope.glitch.output = "glitch_only"  # For voltage glitching
scope.glitch.trigger_src = "ext_single"
scope.io.glitch_hp = True  # High-power MOSFET
scope.io.glitch_lp = True  # Low-power MOSFET

# Same timing parameters as clock glitching
scope.glitch.width = 2000
scope.glitch.offset = 2000
scope.glitch.ext_offset = 10
scope.glitch.repeat = 5

# Reset voltage glitch state if needed
scope.io.vglitch_reset()
```

---

## Experimental Validation and Implementation Framework

To facilitate reproducible research and provide a standardized implementation baseline, we have developed a comprehensive parameter validation framework for the ChipWhisperer Husky platform. This framework enables systematic evaluation of fault injection parameters and serves as a foundation for advanced security research.

**[Reference Implementation: ChipWhisperer Husky Parameter Testing Framework](https://github.com/tanvir-jewel/fault-attack-fundamentals/blob/main/test_husky_parameters.py)**

The validation framework encompasses:
- **Platform initialization protocols**: Standardized setup procedures for consistent experimental conditions
- **Parameter space exploration**: Systematic methods for evaluating fault injection parameter effectiveness  
- **Fault characterization tools**: Metrics and analysis capabilities for assessing attack success rates
- **Diagnostic and verification procedures**: Quality assurance mechanisms for experimental integrity

This implementation serves as a foundational resource for the hardware security research community, providing validated methodologies for fault injection experimentation and analysis.

### Expected Test Output

When the experimental setup is properly configured and the testing framework executes successfully, the system should generate the following comprehensive parameter verification output:

```
============================================================
PARAMETER VERIFICATION TABLE
============================================================

| Parameter | API Path | Status | Value/Notes |
|-----------|----------|--------|-------------|
| Width                     | scope.glitch.width             | [PASS] | Original: 0                    |
| Offset                    | scope.glitch.offset            | [PASS] | Original: 0                    |
| Ext_Offset                | scope.glitch.ext_offset        | [PASS] | Original: 0                    |
| Repeat                    | scope.glitch.repeat            | [PASS] | Original: 1                    |
| Clock Source              | scope.glitch.clk_src           | [PASS] | Original: pll                  |
| Output Mode               | scope.glitch.output            | [PASS] | Original: clock_xor            |
| Trigger Source            | scope.glitch.trigger_src       | [PASS] | Original: manual               |
| Clock Frequency           | scope.clock.clkgen_freq        | [PASS] | Original: 7363636.363636363    |
| Phase Shift Steps         | scope.glitch.phase_shift_steps | [PASS] | 4592                           |
| Glitch Enabled            | scope.glitch.enabled           | [PASS] | Original: True                 |
| HS2 Output                | scope.io.hs2                   | [PASS] | Original: clkgen               |
| Arm                       | scope.arm()                    | [PASS] | Method OK                      |
| vglitch_setup (lp)        | scope.vglitch_setup('lp')      | [PASS] | Method OK                      |
| vglitch_setup (hp)        | scope.vglitch_setup('hp')      | [PASS] | Method OK                      |
| vglitch_setup (both)      | scope.vglitch_setup('both')    | [PASS] | Method OK                      |
| LP MOSFET                 | scope.io.glitch_lp             | [PASS] | Original: True                 |
| HP MOSFET                 | scope.io.glitch_hp             | [PASS] | Original: True                 |
| Output Mode (Voltage)     | scope.glitch.output            | [PASS] | Original: glitch_only          |
| vglitch_reset             | scope.io.vglitch_reset()       | [PASS] | Method OK                      |
| ADC Samples               | scope.adc.samples              | [PASS] | Original: 5000                 |
| ADC Timeout               | scope.adc.timeout              | [PASS] | Original: 2                    |
| Trigger Module            | scope.trigger.module           | [PASS] | Original: basic                |
| Target Reset              | scope.io.nrst                  | [PASS] | Original: high_z               |
| ADC Trig Count            | scope.adc.trig_count           | [PASS] | 0                              |
| ADC State                 | scope.adc.state                | [PASS] | False                          |
| ADC Lo Gain Errors Disabl | scope.adc.lo_gain_errors_disab | [PASS] | Original: True                 |
| ADC Clip Errors Disabled  | scope.adc.clip_errors_disabled | [PASS] | Original: True                 |
| Baud Rate                 | target.baud                    | [PASS] | Original: 230400               |
| In Waiting                | target.in_waiting()            | [PASS] | 0                              |
| Clkgen Source             | scope.clock.clkgen_src         | [PASS] | Original: system               |
| ADC Mul                   | scope.clock.adc_mul            | [PASS] | Original: 3                    |
| PLL Locked                | scope.clock.pll.pll_locked     | [PASS] | True                           |
| Glitch MMCM Locked        | scope.glitch.mmcm_locked       | [PASS] | True                           |
| ADC Frequency             | scope.clock.adc_freq           | [PASS] | 22095238.095238093             |
| Scope Name                | scope.getName()                | [PASS] | Unknown                        |
```

This verification table confirms proper initialization and accessibility of all critical system parameters, providing confidence in the experimental setup before proceeding with fault injection experiments.

---

## References

- ChipWhisperer Husky Documentation
- Fault101 Course Materials
- NewAE Forum Discussions
- Experimental results from SAM4S target testing

---

