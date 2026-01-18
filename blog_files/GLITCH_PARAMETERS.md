# ChipWhisperer Husky Glitch Attack Introduction

This introduction will guide you through understanding the fundamentals of glitch attacks
and their configurable parameters on the ChipWhisperer Husky platform. This is your first 
step to learning about clock glitching and voltage glitching techniques, covering what 
parameters are available and how to use them with the ChipWhisperer Husky.

---

## Table of Contents

1. [Clock Glitch Parameters](#clock-glitch-parameters)
2. [Voltage Glitch Parameters](#voltage-glitch-parameters)
3. [Shared Configuration Parameters](#shared-configuration-parameters)
4. [Parameter Mapping to Husky API](#parameter-mapping-to-husky-api)
5. [Quick Reference Card](#quick-reference-card)

---

## Clock Glitch Parameters

### Understanding Clock Glitching

Clock glitching is a fault injection technique that temporarily disrupts the timing of a target device's clock signal. By introducing brief anomalies in the clock, you can cause the processor to execute instructions incorrectly, skip operations, or bypass security checks. The ChipWhisperer Husky generates these clock glitches by manipulating the target's clock signal using precise timing control.

Clock glitches work by creating momentary violations of the processor's timing requirements. When the clock signal is disrupted at just the right moment, the processor may:
- Execute an instruction with incorrect data
- Skip an instruction entirely  
- Corrupt register or memory values
- Bypass conditional checks or loops

The effectiveness of a clock glitch depends on precise timing and the right combination of parameters. Let's explore what parameters you can control on the Husky:

### All Controllable Parameters

| Parameter | Husky API | Type | Range | Supported | Description |
|-----------|-----------|------|-------|-----------|-------------|
| **Width** | `scope.glitch.width` | Continuous | 0 - 4592 (phase steps) | Yes | Duration/strength of the clock glitch. Higher values = stronger glitch but more resets. On Husky, measured in MMCM phase shift steps, NOT percentages. |
| **Offset** | `scope.glitch.offset` | Continuous | 0 - 4592 (phase steps) | Yes | Phase offset of the glitch within a clock cycle. Determines WHERE in the clock cycle the glitch occurs. |
| **Ext_Offset** | `scope.glitch.ext_offset` | Integer | 0 - trig_count | Yes | Number of clock cycles to wait AFTER trigger before injecting glitch. Coarse timing control for hitting the right instruction. |
| **Repeat** | `scope.glitch.repeat` | Integer | 1 - 255 | Yes | Number of consecutive glitch pulses to inject. Higher values increase fault probability but also reset probability. |
| **Clock Source** | `scope.glitch.clk_src` | Discrete | "pll", "clkgen" | Yes | Source clock for the glitch module. PLL recommended for Husky. |
| **Output Mode** | `scope.glitch.output` | Discrete | "clock_xor", "clock_or", "glitch_only", "enable_only" | Yes | How the glitch modifies the clock signal. "clock_xor" is typical for clock glitching. |
| **Trigger Source** | `scope.glitch.trigger_src` | Discrete | "ext_single", "ext_continuous", "manual" | Yes | What triggers the glitch injection. "ext_single" waits for firmware trigger. |
| **Clock Frequency** | `scope.clock.clkgen_freq` | Continuous | 1MHz - 200MHz+ | Yes | Base clock frequency for target. Changing this affects ALL timing relationships. |
| **Phase Shift Steps** | `scope.glitch.phase_shift_steps` | Read-only | 4592 (Husky) | Yes | Maximum available phase shift resolution. Use to normalize width/offset. |
| **Glitch Enabled** | `scope.glitch.enabled` | Boolean | True/False | Yes | Master enable for glitch module. MUST be True for Husky. |
| **HS2 Output** | `scope.io.hs2` | Discrete | "clkgen", "glitch" | Yes | Clock routing to target. "glitch" for clock glitching, "clkgen" for normal operation. |
| **Glitch Polarity** | N/A | N/A | N/A | No | Not exposed - hardware defined |
| **Glitch Shape/Waveform** | N/A | N/A | N/A | No | Cannot specify arbitrary waveforms |
| **Edge Slew Rate** | N/A | N/A | N/A | No | Fixed by hardware design |

---

## Voltage Glitch Parameters

### Understanding Voltage Glitching

Voltage glitching is another fault injection technique that temporarily reduces the power supply voltage to the target device. When the voltage drops below the processor's minimum operating threshold, logic operations can fail or produce incorrect results. The ChipWhisperer Husky implements voltage glitching using crowbar MOSFETs that create brief voltage dips on the target's power rail.

Voltage glitches exploit the relationship between supply voltage and digital logic reliability. When voltage is insufficient, transistors may not switch properly, leading to:
- Logic gates producing incorrect outputs
- Memory cells flipping to wrong states
- Arithmetic operations yielding incorrect results
- Timing-sensitive circuits failing to meet requirements

The Husky provides two different MOSFET circuits (low-power and high-power) that can be used individually or together to create voltage glitches of varying strength. The timing and duration of these glitches can be precisely controlled to target specific operations.

### All Controllable Parameters

| Parameter | Husky API | Type | Range | Supported | Description |
|-----------|-----------|------|-------|-----------|-------------|
| **Width** | `scope.glitch.width` | Continuous | 0 - 4592 (phase steps) | Yes | Duration of voltage dip. Longer = stronger effect but higher reset risk. |
| **Offset** | `scope.glitch.offset` | Continuous | 0 - 4592 (phase steps) | Yes | Phase offset for voltage glitch timing within a clock cycle. |
| **Ext_Offset** | `scope.glitch.ext_offset` | Integer | 0 - trig_count | Yes | Clock cycles delay after trigger before voltage glitch. |
| **Repeat** | `scope.glitch.repeat` | Integer | 1 - 255 | Yes | Number of voltage glitch pulses. |
| **MOSFET Mode** | `scope.vglitch_setup()` | Discrete | "lp", "hp", "both" | Yes | Controls which crowbar MOSFETs are active. "lp" = low power (weaker), "hp" = high power (stronger), "both" = strongest. |
| **LP MOSFET** | `scope.io.glitch_lp` | Boolean | True/False | Yes | Individual low-power MOSFET enable. |
| **HP MOSFET** | `scope.io.glitch_hp` | Boolean | True/False | Yes | Individual high-power MOSFET enable. |
| **Output Mode** | `scope.glitch.output` | Discrete | "glitch_only", "enable_only" | Yes | For voltage glitching, typically use "glitch_only". |
| **Trigger Source** | `scope.glitch.trigger_src` | Discrete | "ext_single", "ext_continuous", "manual" | Yes | What triggers the voltage glitch. |
| **Clock Source** | `scope.glitch.clk_src` | Discrete | "pll", "clkgen" | Yes | Clock source for timing the voltage glitch. |
| **Glitch Reset** | `scope.io.vglitch_reset()` | Method | N/A | Yes | Reset glitch state after injection. Call between glitches if needed. |
| **Glitch Enabled** | `scope.glitch.enabled` | Boolean | True/False | Yes | Master enable for glitch module. |
| **Voltage Depth (DAC)** | N/A | N/A | N/A | No | Strength is via MOSFET selection, not continuous voltage control. |
| **Edge Slew Control** | N/A | N/A | N/A | No | Fixed by hardware. |
| **Baseline VCC** | External | N/A | N/A | External | Requires separate power supply control, not Husky API. |

---

## Shared Configuration Parameters

These parameters affect the overall experiment environment and should typically be
treated as **episode-level configuration**, not per-step RL actions.

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

## How to Configure Parameters in Code

Now let's see how to actually set these parameters in your Python code:

### Setting Up Clock Glitching

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

### Setting Up Voltage Glitching

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

## Quick Reference Card

### Clock Glitch Setup Checklist
- [ ] `scope.glitch.enabled = True`
- [ ] `scope.glitch.clk_src = "pll"`
- [ ] `scope.glitch.output = "clock_xor"`
- [ ] `scope.glitch.trigger_src = "ext_single"`
- [ ] `scope.io.hs2 = "glitch"`
- [ ] Set width, offset, ext_offset, repeat

### Voltage Glitch Setup Checklist
- [ ] `scope.vglitch_setup('both')` or manual MOSFET config
- [ ] `scope.glitch.output = "glitch_only"`
- [ ] Connect SMA cable from Husky crowbar output to target
- [ ] Set width, offset, ext_offset, repeat

### Diagnostic Commands
```python
# Check glitch status
print(f"Enabled: {scope.glitch.enabled}")
print(f"Phase steps: {scope.glitch.phase_shift_steps}")
print(f"HS2: {scope.io.hs2}")
print(f"Output: {scope.glitch.output}")
print(f"Width: {scope.glitch.width}")
print(f"Offset: {scope.glitch.offset}")
print(f"Ext_offset: {scope.glitch.ext_offset}")
print(f"Repeat: {scope.glitch.repeat}")

# Measure trigger window
scope.arm()
target.simpleserial_write("g", bytearray([]))
scope.capture()
print(f"Trigger duration: {scope.adc.trig_count} cycles")
```

---

## References

- ChipWhisperer Husky Documentation
- Fault101 Course Materials
- NewAE Forum Discussions
- Experimental results from SAM4S target testing

---

*Document generated from implementation experience with ChipWhisperer Husky*
*Last updated: 2026-01-18*
