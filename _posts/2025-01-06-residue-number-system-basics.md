---
layout: post
title: "Understanding Residue Number Systems: The Basics"
date: 2025-01-06
author: Tanvir Hossain
categories: [hardware-security, cryptography]
tags: [RNS, residue-number-system, mathematics, secure-computing]
excerpt: "An introduction to Residue Number Systems (RNS), covering moduli, dynamic range, and the Chinese Remainder Theorem with practical examples."
---

Residue Number Systems (RNS) offer a fascinating alternative to traditional positional number systems like binary or decimal. While we typically represent numbers as sequences of digits (like 23 in decimal or 10111 in binary), RNS takes a completely different approach by representing numbers as sets of remainders. In my research on hardware security, particularly in the HOACS (Homomorphic Obfuscation Assisted Concealing of Secrets) system, RNS plays a crucial role in keeping sensitive data encoded during execution. This blog post will walk you through the mathematical foundations of RNS step by step.

## What is a Residue Number System?

Imagine you want to represent a number, but instead of using its binary or decimal form, you use what remains when you divide it by different numbers. That's the core idea behind RNS.

A Residue Number System represents integers using their remainders (residues) with respect to a set of moduli. Think of it like this: instead of saying "the number is 23," we might say "when divided by 3, the remainder is 2; when divided by 5, the remainder is 3; and when divided by 7, the remainder is 2." These three remainders (2, 3, 2) completely and uniquely identify the number 23, as long as we know the divisors (3, 5, 7) being used.

This representation might seem unusual at first, but it has powerful properties that make it valuable for secure computation and parallel processing.

### Moduli Set

The foundation of RNS is the **moduli set**, which is simply the collection of divisors we use to compute remainders. We denote this set as:

$$M = \{m_1, m_2, m_3, \ldots, m_n\}$$

Each number $m_i$ in this set is called a **modulus** (plural: moduli). For RNS to work properly, these moduli should be **pairwise coprime**, meaning any two moduli share no common factors other than 1. Mathematically, we write this as $\gcd(m_i, m_j) = 1$ for all $i \neq j$.

Why do they need to be coprime? This ensures that the Chinese Remainder Theorem (which we'll discuss later) can uniquely reconstruct the original number from its residues. If two moduli shared a common factor, we would lose uniqueness and couldn't reliably convert back to the original number.

**Example moduli set:** $M = \{3, 5, 7\}$

Notice that 3, 5, and 7 are pairwise coprime: gcd(3,5) = 1, gcd(3,7) = 1, and gcd(5,7) = 1. This makes them a valid moduli set for RNS.

## Dynamic Range

Now you might wonder: how many different numbers can we represent using a given set of moduli? This is determined by the **dynamic range** of the RNS.

The dynamic range tells us the total number of unique values we can represent before the pattern of residues starts repeating. It is calculated as the product of all moduli:

$$\text{Range} = \prod_{i=1}^{n} m_i = m_1 \times m_2 \times \cdots \times m_n$$

For our example moduli set $M = \{3, 5, 7\}$:

$$\text{Range} = 3 \times 5 \times 7 = 105$$

This means we can uniquely represent any integer in the range $[0, 104]$. Once we go beyond 104, the residue patterns start repeating. For instance, the number 105 would have the same RNS representation as 0 because $105 \mod 3 = 0$, $105 \mod 5 = 0$, and $105 \mod 7 = 0$.

Think of it like a clock: on a 12-hour clock, 1 PM and 13:00 both show as "1". Similarly, in RNS with range 105, the numbers 0 and 105 look identical in their residue representation.

## Converting to RNS Representation

Now let's see how to convert a regular decimal number into RNS form. The process is straightforward: divide the number by each modulus and take the remainder.

To convert a decimal number $X$ to RNS representation, we compute the residue (remainder) with respect to each modulus:

$$X_{\text{RNS}} = (x_1, x_2, \ldots, x_n)$$

where $x_i = X \mod m_i$

The notation $X \mod m_i$ means "the remainder when $X$ is divided by $m_i$". This is also called the modulo operation.

**Example:** Let's convert the number 23 to RNS using our moduli set $M = \{3, 5, 7\}$

We need to find what remains when we divide 23 by each modulus:

- $x_1 = 23 \mod 3 = 2$ (because $23 = 7 \times 3 + 2$)
- $x_2 = 23 \mod 5 = 3$ (because $23 = 4 \times 5 + 3$)
- $x_3 = 23 \mod 7 = 2$ (because $23 = 3 \times 7 + 2$)

Therefore: **23 in decimal = (2, 3, 2) in RNS**

The tuple (2, 3, 2) is now our encoded representation of 23. Notice how the original number is "hidden" in this representation. Without knowing the moduli set, an observer seeing (2, 3, 2) would have no easy way to determine that this represents 23.

## Arithmetic Operations in RNS

Here's where RNS really shines! One of the most powerful features of RNS is that addition and multiplication can be performed **independently and in parallel** on each residue. You don't need to worry about carries or borrows like in traditional addition.

This property is called **carry-free arithmetic**, and it's incredibly valuable for parallel hardware implementations.

### Addition

To add two numbers in RNS, simply add corresponding residues and take the result modulo each modulus:

$$(a_1, a_2, \ldots, a_n) + (b_1, b_2, \ldots, b_n) = ((a_1 + b_1) \mod m_1, (a_2 + b_2) \mod m_2, \ldots, (a_n + b_n) \mod m_n)$$

Let's see this in action with a concrete example.

**Example:** Add 23 and 17 in RNS

First, let's represent both numbers in RNS using $M = \{3, 5, 7\}$:
- $23 = (2, 3, 2)$ in RNS
- $17 = (2, 2, 3)$ in RNS

Now add each pair of residues:

- $(2 + 2) \mod 3 = 4 \mod 3 = 1$
- $(3 + 2) \mod 5 = 5 \mod 5 = 0$
- $(2 + 3) \mod 7 = 5 \mod 7 = 5$

Result: **(1, 0, 5) in RNS**

Let's verify this is correct by checking in decimal: $23 + 17 = 40$

Converting 40 to RNS: $40 \mod 3 = 1$, $40 \mod 5 = 0$, $40 \mod 7 = 5$, giving us (1, 0, 5) ✓

Notice how each residue was computed completely independently. This means we could perform all three modulo operations simultaneously using parallel hardware, making RNS addition extremely fast.

### Multiplication

Multiplication works exactly the same way as addition. Multiply corresponding residues and take the modulo:

$$(a_1, a_2, \ldots, a_n) \times (b_1, b_2, \ldots, b_n) = ((a_1 \times b_1) \mod m_1, (a_2 \times b_2) \mod m_2, \ldots, (a_n \times b_n) \mod m_n)$$

**Example:** Multiply 7 and 9 in RNS

First, convert to RNS using $M = \{3, 5, 7\}$:
- $7 = (1, 2, 0)$ in RNS (since $7 \mod 3 = 1$, $7 \mod 5 = 2$, $7 \mod 7 = 0$)
- $9 = (0, 4, 2)$ in RNS (since $9 \mod 3 = 0$, $9 \mod 5 = 4$, $9 \mod 7 = 2$)

Now multiply each pair of residues:

- $(1 \times 0) \mod 3 = 0 \mod 3 = 0$
- $(2 \times 4) \mod 5 = 8 \mod 5 = 3$
- $(0 \times 2) \mod 7 = 0 \mod 7 = 0$

Result: **(0, 3, 0) in RNS**

Verification: $7 \times 9 = 63$ in decimal

Converting 63 to RNS: $63 \mod 3 = 0$, $63 \mod 5 = 3$, $63 \mod 7 = 0$, giving us (0, 3, 0) ✓

Again, notice the parallel nature of the computation. Each multiplication happens independently, with no carries between channels.

## Chinese Remainder Theorem (CRT)

So far, we've seen how to convert from decimal to RNS and how to perform arithmetic in RNS. But how do we convert back from RNS to decimal? This is where the **Chinese Remainder Theorem** (CRT) comes in.

The CRT is an ancient mathematical theorem (dating back to Chinese mathematicians in the 3rd century) that provides a formula for reconstructing the original number from its residues. It guarantees that for pairwise coprime moduli, there exists a **unique** solution in the range $[0, \prod m_i)$.

This uniqueness is crucial! It means that within our dynamic range, each RNS representation corresponds to exactly one decimal number, and vice versa. This one-to-one mapping is what makes RNS a valid number system.

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

In the HOACS (Homomorphic Obfuscation Assisted Concealing of Secrets) system, we leverage RNS to keep cryptographic keys and sensitive data encoded throughout the entire execution pipeline on untrusted COTS processors, preventing hardware Trojans from accessing raw secret values. By transforming cryptographic operations to be fully homomorphic using residue number coding, we can perform AES encryption while keeping the secret key perpetually encoded, never exposing it in plaintext form even during computation.

## Conclusion

Residue Number Systems provide a powerful mathematical framework for secure and efficient computation. Understanding the basics of moduli, dynamic range, and the Chinese Remainder Theorem is essential for exploring advanced applications in hardware security and cryptography.

In future posts, I will explore how RNS is applied in practical hardware security scenarios and discuss implementation challenges on modern processors.

---

**References:**
- Hossain, T., Showers, M., Hasan, M., and Hoque, T. "HOACS: Homomorphic Obfuscation Assisted Concealing of Secrets to Thwart Trojan Attacks in COTS Processor." arXiv preprint arXiv:2402.09701, 2024. [Link](https://arxiv.org/abs/2402.09701)
- Soderstrand, M. A., et al. "Residue number system arithmetic: modern applications in digital signal processing." IEEE Press, 1986.
- Omondi, A., and Premkumar, B. "Residue Number Systems: Theory and Implementation." Imperial College Press, 2007.
