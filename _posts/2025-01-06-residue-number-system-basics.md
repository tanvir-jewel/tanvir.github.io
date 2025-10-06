---
layout: post
title: "Understanding Residue Number Systems: The Basics"
date: 2025-01-06
author: Tanvir Hossain
categories: [hardware-security, cryptography]
tags: [RNS, residue-number-system, mathematics, secure-computing]
excerpt: "An introduction to Residue Number Systems (RNS), covering moduli, dynamic range, and the Chinese Remainder Theorem with practical examples."
---

Residue Number Systems (RNS) offer a fascinating alternative to traditional positional number systems. In my research on hardware security, particularly in the HOACS (Homomorphic Obfuscation Assisted Concealing of Secrets) system, RNS plays a crucial role in keeping sensitive data encoded during execution. This post introduces the mathematical foundations of RNS.

## What is a Residue Number System?

A Residue Number System represents integers using their remainders (residues) with respect to a set of moduli. Instead of representing a number in binary or decimal form, RNS represents it as a tuple of residues.

### Moduli Set

The foundation of RNS is the **moduli set**, denoted as:

$$M = \{m_1, m_2, m_3, \ldots, m_n\}$$

where each modulus $m_i$ is typically a pairwise coprime integer (meaning $\gcd(m_i, m_j) = 1$ for all $i \neq j$).

**Example moduli set:** $M = \{3, 5, 7\}$

## Dynamic Range

The **dynamic range** of an RNS is the range of integers that can be uniquely represented. It is calculated as the product of all moduli:

$$\text{Range} = \prod_{i=1}^{n} m_i = m_1 \times m_2 \times \cdots \times m_n$$

For our example moduli set $M = \{3, 5, 7\}$:

$$\text{Range} = 3 \times 5 \times 7 = 105$$

This means we can uniquely represent integers in the range $[0, 104]$.

## Converting to RNS Representation

To convert a decimal number $X$ to RNS representation, we compute the residue with respect to each modulus:

$$X_{\text{RNS}} = (x_1, x_2, \ldots, x_n)$$

where $x_i = X \mod m_i$

**Example:** Convert $X = 23$ using $M = \{3, 5, 7\}$

- $x_1 = 23 \mod 3 = 2$
- $x_2 = 23 \mod 5 = 3$
- $x_3 = 23 \mod 7 = 2$

Therefore: 23 in decimal = (2, 3, 2) in RNS

## Arithmetic Operations in RNS

One of the powerful features of RNS is that addition and multiplication can be performed independently on each residue.

### Addition

$$(a_1, a_2, \ldots, a_n) + (b_1, b_2, \ldots, b_n) = ((a_1 + b_1) \mod m_1, (a_2 + b_2) \mod m_2, \ldots, (a_n + b_n) \mod m_n)$$

**Example:** Add $23 = (2, 3, 2)$ and $17 = (2, 2, 3)$ in RNS

- $(2 + 2) \mod 3 = 1$
- $(3 + 2) \mod 5 = 0$
- $(2 + 3) \mod 7 = 5$

Result: (1, 0, 5) in RNS

Verification: $23 + 17 = 40$, and 40 = (1, 0, 5) in RNS ✓

### Multiplication

$$(a_1, a_2, \ldots, a_n) \times (b_1, b_2, \ldots, b_n) = ((a_1 \times b_1) \mod m_1, (a_2 \times b_2) \mod m_2, \ldots, (a_n \times b_n) \mod m_n)$$

**Example:** Multiply $7 = (1, 2, 0)$ and $9 = (0, 4, 2)$ in RNS

- $(1 \times 0) \mod 3 = 0$
- $(2 \times 4) \mod 5 = 3$
- $(0 \times 2) \mod 7 = 0$

Result: (0, 3, 0) in RNS

Verification: $7 \times 9 = 63$, and 63 = (0, 3, 0) in RNS ✓

## Chinese Remainder Theorem (CRT)

The **Chinese Remainder Theorem** is the mathematical foundation that allows us to convert from RNS back to decimal representation. It guarantees that for pairwise coprime moduli, there exists a unique solution in the range $[0, \prod m_i)$.

### CRT Formula

Given RNS representation $(x_1, x_2, \ldots, x_n)$, we can recover the decimal value $X$ using:

$$X = \left( \sum_{i=1}^{n} x_i \cdot M_i \cdot y_i \right) \mod M$$

where:
- $M = \prod_{i=1}^{n} m_i$ (total dynamic range)
- $M_i = M / m_i$ (product of all moduli except $m_i$)
- $y_i$ is the modular multiplicative inverse of $M_i$ modulo $m_i$, satisfying $(M_i \times y_i) \mod m_i = 1$

### CRT Example

Let's convert (2, 3, 2) from RNS back to decimal using $M = \{3, 5, 7\}$.

**Step 1:** Calculate $M$

$$M = 3 \times 5 \times 7 = 105$$

**Step 2:** Calculate $M_i$ for each modulus

- $M_1 = 105 / 3 = 35$
- $M_2 = 105 / 5 = 21$
- $M_3 = 105 / 7 = 15$

**Step 3:** Find multiplicative inverses $y_i$

- $y_1$: Find $y_1$ such that $(35 \times y_1) \mod 3 = 1$
  - $35 \mod 3 = 2$, so we need $(2 \times y_1) \mod 3 = 1$
  - $y_1 = 2$ (since $2 \times 2 = 4 \equiv 1 \mod 3$)

- $y_2$: Find $y_2$ such that $(21 \times y_2) \mod 5 = 1$
  - $21 \mod 5 = 1$, so we need $(1 \times y_2) \mod 5 = 1$
  - $y_2 = 1$

- $y_3$: Find $y_3$ such that $(15 \times y_3) \mod 7 = 1$
  - $15 \mod 7 = 1$, so we need $(1 \times y_3) \mod 7 = 1$
  - $y_3 = 1$

**Step 4:** Apply CRT formula

$$X = (2 \times 35 \times 2 + 3 \times 21 \times 1 + 2 \times 15 \times 1) \mod 105$$

$$X = (140 + 63 + 30) \mod 105$$

$$X = 233 \mod 105 = 23$$

Therefore: (2, 3, 2) in RNS = 23 in decimal ✓

## Why RNS Matters for Hardware Security

In my research, RNS provides several security advantages:

1. **Parallel Processing:** Each residue can be computed independently, enabling parallel arithmetic operations.

2. **Information Hiding:** An adversary observing individual residues cannot easily determine the original value without knowing all residues and the moduli set.

3. **Fault Tolerance:** Redundant moduli can be added to detect and correct errors during computation.

4. **Side-Channel Resistance:** The encoded representation makes it harder for attackers to extract sensitive information through power analysis or electromagnetic emissions.

In the HOACS system, we leverage RNS to keep cryptographic keys and sensitive data encoded throughout the entire execution pipeline on untrusted COTS processors, preventing hardware Trojans from accessing raw secret values.

## Conclusion

Residue Number Systems provide a powerful mathematical framework for secure and efficient computation. Understanding the basics of moduli, dynamic range, and the Chinese Remainder Theorem is essential for exploring advanced applications in hardware security and cryptography.

In future posts, I will explore how RNS is applied in practical hardware security scenarios and discuss implementation challenges on modern processors.

---

**References:**
- Soderstrand, M. A., et al. "Residue number system arithmetic: modern applications in digital signal processing." IEEE Press, 1986.
- Omondi, A., and Premkumar, B. "Residue Number Systems: Theory and Implementation." Imperial College Press, 2007.
