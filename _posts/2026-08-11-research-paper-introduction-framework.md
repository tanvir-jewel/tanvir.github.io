---
layout: post
title: "How to Write a Strong Research Paper Introduction"
subtitle: "A Four-Part Framework for Clearer Research Writing"
date: 2026-08-11
author: Tanvir Hossain
type: technical
categories: [academic-writing, research]
tags: [research-writing, introduction, paper-writing, academic-writing]
excerpt: "A practical four-part framework for research paper introductions: Context → Define Variables → Gaps and Aims → Contributions, with worked examples from Attention Is All You Need and fault-injection research."
---

Writing the Introduction is often one of the most difficult parts of a research paper. The problem is usually not that we do not know enough about our research. In fact, the opposite is often true. After spending months or years working on a problem, we know *too much*. We know the literature, the technical details, the experimental challenges, the failed attempts, the competing methods, and every small design decision. Then we open a blank document and have to answer a deceptively simple question:

**How do I explain all of this to a reader in one or two pages?**

A common response is to treat the Introduction as a compressed literature review:

> X has become important in recent years. Several researchers have investigated X. Smith et al. proposed A. Jones et al. proposed B. However, there are still challenges. In this paper, we propose C.

This structure is common, but it often produces introductions that are technically correct and still difficult to remember. I find it more useful to think about the Introduction in a different way:

<div class="post-figure">
  <div class="alert border-0 mb-0 post-callout" style="background: #f5f5f5; border-left: 4px solid #e8000d !important; color: #333333; text-align: left;">
    <strong style="color: #e8000d;">Core idea.</strong>
    A research Introduction is not primarily a summary of your topic. It is an <strong>argument for why your paper needs to exist</strong>.
  </div>
</div>

By the time readers reach the end of the Introduction, they should understand four things:

1. **Why does this problem matter?**
2. **What exactly is the technical problem?**
3. **Why are existing approaches insufficient?**
4. **What does this paper contribute?**

I organize these questions using a simple four-part framework:

<div class="post-figure post-figure--wide">
  <div class="row justify-content-center">
    <div class="col-md-3 col-6 mb-3">
      <div class="card h-100 border-0 shadow-sm" style="border-top: 4px solid #e8000d !important;">
        <div class="card-body text-center py-3">
          <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width:2rem;height:2rem;background:#e8000d;color:#fff;font-weight:600;font-size:0.9rem;">1</div>
          <div class="font-weight-bold" style="color:#e8000d;">Context</div>
          <small class="text-muted d-block mt-1">Where are we, and why should we care?</small>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="card h-100 border-0 shadow-sm" style="border-top: 4px solid #e8000d !important;">
        <div class="card-body text-center py-3">
          <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width:2rem;height:2rem;background:#e8000d;color:#fff;font-weight:600;font-size:0.9rem;">2</div>
          <div class="font-weight-bold" style="color:#e8000d;">Define Variables</div>
          <small class="text-muted d-block mt-1">What exactly are we studying?</small>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="card h-100 border-0 shadow-sm" style="border-top: 4px solid #e8000d !important;">
        <div class="card-body text-center py-3">
          <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width:2rem;height:2rem;background:#e8000d;color:#fff;font-weight:600;font-size:0.9rem;">3</div>
          <div class="font-weight-bold" style="color:#e8000d;">Gaps &amp; Aims</div>
          <small class="text-muted d-block mt-1">Where does existing knowledge break down?</small>
        </div>
      </div>
    </div>
    <div class="col-md-3 col-6 mb-3">
      <div class="card h-100 border-0 shadow-sm" style="border-top: 4px solid #e8000d !important;">
        <div class="card-body text-center py-3">
          <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width:2rem;height:2rem;background:#e8000d;color:#fff;font-weight:600;font-size:0.9rem;">4</div>
          <div class="font-weight-bold" style="color:#e8000d;">Contributions</div>
          <small class="text-muted d-block mt-1">What changes because this paper exists?</small>
        </div>
      </div>
    </div>
  </div>
</div>

I call it a **four-paragraph framework**, but the word *paragraph* should not be interpreted too literally. In a short conference paper, each stage might occupy approximately one paragraph. In a longer journal article, Context or Gap may require several paragraphs. What matters is not having exactly four paragraphs. What matters is that the Introduction performs these **four intellectual jobs in the correct order**.

---

## 1. Context: Where Are We, and Why Should We Care?

The first part of the Introduction establishes the world in which your research exists. Before discussing your algorithm, architecture, framework, attack, dataset, material, or experimental platform, answer a more fundamental question:

> **Why is this research problem worth the reader's attention?**

This is the **Context**. A useful progression is:

<div class="post-figure">
  <span class="badge badge-pill px-3 py-2 mr-1 mb-1" style="background:#f5f5f5;color:#e8000d;">Broader problem</span>
  <span class="text-muted mx-1">→</span>
  <span class="badge badge-pill px-3 py-2 mr-1 mb-1" style="background:#f5f5f5;color:#e8000d;">Importance</span>
  <span class="text-muted mx-1">→</span>
  <span class="badge badge-pill px-3 py-2 mr-1 mb-1" style="background:#f5f5f5;color:#e8000d;">Technical landscape</span>
  <span class="text-muted mx-1">→</span>
  <span class="badge badge-pill px-3 py-2 mr-1 mb-1" style="background:#f5f5f5;color:#e8000d;">Specific research area</span>
</div>

For example, imagine a paper about hardware security. A weak opening could be:

> Fault injection attacks have received significant attention in recent years.

There is nothing grammatically wrong with the sentence. The problem is that it gives the reader almost no reason to care. A more purposeful opening might look like this:

> Embedded processors increasingly perform security-critical operations in automotive systems, edge devices, industrial controllers, payment systems, and other computing platforms. The security of these systems therefore depends not only on software correctness but also on whether the underlying hardware continues to operate correctly when subjected to physical manipulation.

Now the reader understands the **larger consequence** before being introduced to fault injection.

<div class="post-figure">
  <div class="alert border-0 mb-0 post-callout" style="background: #f5f5f5; border-left: 4px solid #e8000d !important; text-align: left;">
    <strong style="color:#e8000d;">Principle.</strong>
    Start with the problem's importance, not with your proposed solution.
  </div>
</div>

Your first paragraph should essentially tell the reader: **“Here is the world we are operating in, and here is why something happening in this world matters.”**

### Context Is Not a History Lesson

One mistake I frequently see is turning the first paragraph into a chronological history of the research field:

> Technique A was introduced in 2008. Technique B was introduced in 2010. Technique C improved B in 2013. Technique D was proposed in 2017...

That information may be useful, but much of it probably belongs in the **Background** or **Related Work** section. The Introduction has a different job. You only need enough history to establish the **current research landscape that makes your problem important**. Think of the Introduction as a camera: at the beginning the lens is wide, you show the reader the broader landscape, and then you gradually zoom toward the exact technical problem your paper addresses.

---

## 2. Define Variables: What Exactly Are We Studying?

Once the reader understands why the general area matters, the next question becomes:

> **What exactly is the technical situation we are studying?**

I call this stage **Define Variables**. The term *variables* should be interpreted broadly. They do not have to be mathematical variables such as \(x\) and \(y\). Depending on the discipline, your variables might be systems, mechanisms, actors, assumptions, parameters, measurements, theoretical constructs, architectural properties, attack capabilities, environmental conditions, or relationships between different components.

Suppose, for example, that your paper studies fault injection. Your important “variables” might be:

<div class="post-figure post-figure--wide">
  <div class="table-responsive">
    <table class="table table-bordered mb-0 text-left">
      <thead style="background:#f5f5f5;">
        <tr>
          <th style="color:#e8000d; width:30%;">Role</th>
          <th style="color:#e8000d;">Example</th>
        </tr>
      </thead>
      <tbody>
        <tr><td><strong>Target</strong></td><td>an embedded processor</td></tr>
        <tr><td><strong>Input</strong></td><td>a controlled physical disturbance</td></tr>
        <tr><td><strong>Parameters</strong></td><td>glitch amplitude, timing offset, pulse width, trigger position</td></tr>
        <tr><td><strong>Observable outputs</strong></td><td>normal execution, reset, crash, or faulty computation</td></tr>
        <tr><td><strong>Objective</strong></td><td>producing a security-relevant and reproducible fault</td></tr>
      </tbody>
    </table>
  </div>
</div>

Now your reader has a mental model of the problem. This part of the Introduction should answer questions such as: **What system are we studying?** **What mechanism controls the behavior that matters?** **What assumptions do existing systems make?** **What relationship between these concepts creates the research problem?**

### Define Only What the Reader Needs

This section can easily become too long because researchers naturally want to explain everything they know. Suppose your paper involves power side-channel analysis. You probably do not need to explain transistor switching, CMOS dynamic power, Hamming-weight leakage, Pearson correlation, trace alignment, and key hypothesis generation in the Introduction. Some of those concepts may belong in the Background section. A useful test is:

> **If I remove this explanation, can the reader still understand the research gap?**

If the answer is yes, that information may not belong in the Introduction. Define only what is necessary to understand the **problem you are about to expose**.

---

## 3. Gaps and Aims: Where Does Existing Knowledge Break Down?

This is often the most important part of the Introduction. You have established the problem area and explained the relevant mechanisms. Now you need to answer:

> **Why is another research paper necessary?**

This is where you establish the **research gap**. A useful logical structure is:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong style="color:#e8000d;">Existing research can do X.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">Researchers have improved Y.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">However, limitation Z remains.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">Because of Z, capability Q is still missing.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">Therefore, this work investigates A, B, and C.</strong></p>
  </div>
</div>

The word **however** often becomes one of the most important words in your Introduction. It marks the transition from **what we already know** to **why what we already know is not enough**.

### A Missing Paper Is Not Automatically a Research Gap

One of the weakest ways to establish a research gap is:

> Few studies have investigated X.

That statement may be true, but it does not automatically justify a research project. Why should more people investigate X? What happens because X remains unexplored? A stronger gap explains the **consequence of the missing knowledge or capability**. For example:

> Existing fault-injection campaigns can identify vulnerable operating conditions through exhaustive or predefined parameter exploration. However, the search space grows rapidly as additional dimensions such as voltage, temporal offset, pulse width, and trigger alignment are introduced. Consequently, thousands of physical experiments may be required even when security-relevant faults occupy only a small region of the available parameter space.

Now there is a real problem. The gap is no longer “nobody has applied Algorithm X to fault injection.” Instead, the gap is:

> **Existing exploration strategies are inefficient because useful faults occupy a small region of an increasingly large physical search space.**

That is much stronger. Your new algorithm can now emerge as a response to a **research need**, rather than as an algorithm looking for an application.

### Your Aims Should Grow Directly from the Gap

Once the gap is clear, the aims should feel almost inevitable. For example:

> To address these limitations, this study aims to (A) formulate fault-injection exploration as a sequential optimization problem, (B) develop an adaptive strategy that uses previous experimental outcomes to guide subsequent injections, and (C) determine whether feedback-guided exploration can identify reproducible faults using fewer physical experiments than conventional search approaches.

There is a logical sequence:

<div class="post-figure">
  <span class="badge px-3 py-2 mr-1" style="background:#e8000d;color:#fff;">Formulate</span>
  <span class="text-muted mx-1">→</span>
  <span class="badge px-3 py-2 mr-1" style="background:#e8000d;color:#fff;">Develop</span>
  <span class="text-muted mx-1">→</span>
  <span class="badge px-3 py-2 mr-1" style="background:#e8000d;color:#fff;">Evaluate</span>
</div>

The aims are not simply three experiments the authors happened to perform. Each aim addresses a specific part of the problem established immediately before it. That connection is important.

---

## 4. Contributions: What Changes Because This Paper Exists?

Finally, the reader arrives at the question:

> **What did you actually contribute?**

This is the last major component of the Introduction. A contribution is different from an activity. Consider:

> We performed experiments using three microcontrollers.

That tells me what you **did**. Compare it with:

> We demonstrate that feedback-guided parameter selection can identify vulnerable fault regions while substantially reducing unnecessary physical experiments.

That tells me what you **learned or enabled**. Similarly, “We implemented an algorithm using Python” is an implementation detail, but the following is a conceptual contribution:

> We formulate physical fault exploration as a closed-loop optimization problem in which observations from each experiment guide subsequent parameter selection.

A strong contribution statement usually communicates some combination of three things:

<div class="post-figure post-figure--wide">
  <div class="row justify-content-center">
    <div class="col-md-4 mb-2">
      <div class="p-3 h-100 rounded text-center" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
        <div class="font-weight-bold mb-1" style="color:#e8000d;">Novelty</div>
        <small class="text-muted">What is new?</small>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="p-3 h-100 rounded text-center" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
        <div class="font-weight-bold mb-1" style="color:#e8000d;">Mechanism</div>
        <small class="text-muted">What did you develop, discover, formulate, or demonstrate?</small>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="p-3 h-100 rounded text-center" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
        <div class="font-weight-bold mb-1" style="color:#e8000d;">Evidence</div>
        <small class="text-muted">How did you establish that the contribution works or matters?</small>
      </div>
    </div>
  </div>
</div>

The contribution paragraph should therefore not simply become a table of contents (“Section II presents the background. Section III describes the method. Section IV presents results.”). Tell readers what intellectual value they will gain from reading the paper.

---

## A Worked Example: *Attention Is All You Need*

A useful way to understand this framework is to examine a real and highly influential research paper. Consider **Vaswani et al., “Attention Is All You Need,” published at NeurIPS 2017**, the paper that introduced the Transformer architecture. Its Introduction is particularly interesting because the authors construct a very compact argument. They do not use the headings *Context*, *Define Variables*, *Gap*, and *Contributions*. Nevertheless, the rhetorical progression of the Introduction closely resembles this framework.

### Context: What Is the Existing Research Landscape?

The paper begins by establishing the dominant paradigm. At the time, recurrent neural networks, including LSTMs and gated recurrent networks, were established approaches for sequence modeling and sequence transduction problems such as machine translation. The authors position their research against this existing architectural landscape before explaining their proposed architecture. Conceptually, the opening argument is:

> **Sequence modeling is important, and recurrent architectures are a dominant way of solving it.**

This establishes the Context. Notice what the paper does **not** do. It does not immediately begin:

> We propose a Transformer architecture containing multi-head self-attention...

The reader first needs to understand the architectural world in which the proposed contribution exists. The logic is **Important problem → Established solution → Current research landscape**. Only then can a limitation of that landscape become meaningful.

### Define Variables: What Property of the Existing Approach Matters?

The Introduction then becomes more technical. The authors explain an important property of recurrent architectures: computation proceeds sequentially across positions because the hidden representation at one position depends on the preceding state. That dependency constrains how much computation can be parallelized during training. In simplified form: **State₁ → State₂ → State₃ → State₄**.

The important issue is not merely that RNNs exist. The important relationship is:

> **Recurrence → sequential dependency → limited parallelization**

This is exactly what the **Define Variables** stage should accomplish. The authors do not attempt to teach every aspect of recurrent neural networks. They isolate the architectural property that matters to the argument they are constructing. That distinction is extremely important when writing an Introduction.

### Gap and Aim: What Has Existing Research Not Fundamentally Solved?

Now the argument develops tension. The authors acknowledge that significant research had attempted to improve the efficiency of recurrent models. But there is a deeper issue: even after those improvements, the underlying requirement for sequential computation remains. The Introduction describes this as the **“fundamental constraint of sequential computation.”** This is an excellent research gap because it does not pretend that previous researchers ignored the problem. The argument is more sophisticated:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong>Researchers have improved recurrent architectures.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Those improvements provide real benefits.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>However, recurrence still imposes sequential computation.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Therefore, the fundamental architectural limitation remains.</strong></p>
  </div>
</div>

Then the paper introduces another important observation. Attention mechanisms already existed and could model dependencies between positions in a sequence. However, in most previous architectures, attention was still being used **together with recurrent networks** rather than replacing recurrence altogether. Now the research opportunity becomes obvious:

- **Recurrence produces a sequential-computation bottleneck.**
- **Attention can model dependencies between sequence elements.**
- **But attention is still generally attached to recurrent architectures.**

This naturally leads to the deeper research question:

> **What if recurrence is not necessary?**

Notice how much stronger this is than writing “Few researchers have studied attention-only neural networks.” The paper establishes **why removing recurrence could matter**. That is what transforms an observation in the literature into a meaningful research gap.

### Contributions: What Does the Paper Do About the Gap?

Only after building that argument do the authors introduce the Transformer. The proposed architecture relies on attention mechanisms while dispensing with recurrence and convolutions. The experiments demonstrate strong machine-translation performance while also providing substantially greater parallelizability and reduced training requirements compared with the recurrent architectures motivating the work.

Now look at the intellectual structure. The contribution is not simply “We invented a new neural-network architecture.” The deeper contribution is:

> **We remove the architectural mechanism responsible for the limitation identified earlier and demonstrate that sequence transduction can instead be performed using an attention-based architecture.**

That contribution feels important because the preceding paragraphs have already explained **why removing recurrence matters**.

### The Entire Introduction in Four Questions

We can compress the argumentative structure of *Attention Is All You Need* into the same four questions.

<div class="post-figure post-figure--wide">
  <div class="table-responsive">
    <table class="table table-bordered mb-0 text-left">
      <thead style="background:#f5f5f5;">
        <tr>
          <th style="width:22%; color:#e8000d;">Stage</th>
          <th style="color:#e8000d;">Question</th>
          <th style="color:#e8000d;">In the Transformer paper</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><span class="badge" style="background:#e8000d;color:#fff;">Context</span></td>
          <td>What is the current world?</td>
          <td>Recurrent architectures are established approaches for sequence modeling and machine translation.</td>
        </tr>
        <tr>
          <td><span class="badge" style="background:#e8000d;color:#fff;">Define Variables</span></td>
          <td>What property of that world matters?</td>
          <td>Recurrence creates sequential computational dependencies that restrict parallelization.</td>
        </tr>
        <tr>
          <td><span class="badge" style="background:#e8000d;color:#fff;">Gaps &amp; Aims</span></td>
          <td>What has existing work not fundamentally solved?</td>
          <td>Efficiency improvements still retain sequential computation, while attention is generally incorporated into architectures that continue to use recurrence.</td>
        </tr>
        <tr>
          <td><span class="badge" style="background:#e8000d;color:#fff;">Contributions</span></td>
          <td>What changes because of this paper?</td>
          <td>The Transformer removes recurrence and builds sequence transduction around attention, providing a more parallelizable architecture while achieving strong translation performance.</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

Or, even more simply:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border-left: 4px solid #e8000d;">
    <p><strong>RNNs dominate sequence modeling</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>RNNs require sequential computation</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Existing approaches have not removed that fundamental limitation</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>So remove recurrence and build the architecture around attention</strong></p>
  </div>
</div>

That is an Introduction doing its job.

---

## The Four-Part Framework as a Research Story

The framework can therefore be reduced to a very simple narrative.

### Paragraph 1: Context

> **Here is an important problem.**

X is increasingly important because of Y. Existing systems commonly rely on Z to address this problem.

### Paragraph 2: Define Variables

> **Here is the mechanism that matters.**

Z operates through A and B. Because A interacts with B in a particular way, the system exhibits behavior C.

### Paragraph 3: Gaps and Aims

> **Here is where our current capability breaks down.**

Existing approaches improve A and B, but they still rely on assumption C. Consequently, they cannot efficiently address D. Therefore, this study investigates E.

### Paragraph 4: Contributions

> **Here is what we add.**

We introduce E, demonstrate F, and evaluate it under G. The results establish H and provide a new approach to addressing D.

If you can write these four statements clearly **before writing the full Introduction**, you probably understand the research story of your paper. If you cannot, the problem may not yet be your writing: the research narrative itself may still need clarification.

---

## A Hypothetical Example: Fault-Injection Optimization

To make the structure more concrete, imagine a paper on automated physical fault injection.

<div class="post-figure">
  <div class="card border-0 shadow-sm text-left" style="border-left: 4px solid #e8000d !important;">
    <div class="card-body">
      <h5 class="h6 font-weight-bold mb-2" style="color:#e8000d;">Context</h5>
      <p class="mb-0">Physical fault injection is increasingly used to evaluate whether embedded processors remain secure when their operating conditions are intentionally disturbed. By manipulating voltage, clock timing, electromagnetic conditions, or other physical parameters, attackers may induce computation errors capable of altering security-critical operations. Evaluating the susceptibility of modern embedded devices to such faults is therefore an important component of hardware-security testing.</p>
    </div>
  </div>
</div>

<div class="post-figure">
  <div class="card border-0 shadow-sm text-left" style="border-left: 4px solid #e8000d !important;">
    <div class="card-body">
      <h5 class="h6 font-weight-bold mb-2" style="color:#e8000d;">Define Variables</h5>
      <p class="mb-0">A fault-injection campaign typically explores combinations of parameters such as glitch amplitude, temporal offset, pulse width, and trigger position. Each physical experiment produces an observable response such as normal execution, reset, crash, or a security-relevant faulty output. These parameter combinations form a search space in which only particular regions may produce useful and reproducible faults.</p>
    </div>
  </div>
</div>

<div class="post-figure">
  <div class="card border-0 shadow-sm text-left" style="border-left: 4px solid #e8000d !important;">
    <div class="card-body">
      <h5 class="h6 font-weight-bold mb-2" style="color:#e8000d;">Gap and Aims</h5>
      <p class="mb-0">Conventional campaigns frequently explore this space using manual tuning, predefined parameter sweeps, or other largely static search procedures. However, the number of possible configurations grows rapidly as additional parameters and finer resolutions are introduced, while useful faults may occupy only a small fraction of the search space. The challenge is therefore not simply generating glitches, but efficiently learning <strong>where security-relevant faults occur</strong>. This study investigates whether outcomes from previous experiments can guide subsequent injections toward increasingly promising operating regions.</p>
    </div>
  </div>
</div>

<div class="post-figure">
  <div class="card border-0 shadow-sm text-left" style="border-left: 4px solid #e8000d !important;">
    <div class="card-body">
      <h5 class="h6 font-weight-bold mb-2" style="color:#e8000d;">Contributions</h5>
      <p class="mb-0">We introduce a closed-loop fault-injection framework in which each physical experiment informs subsequent parameter selection. The framework integrates observable device responses with adaptive search and evaluates whether feedback-guided exploration can discover useful fault regions with fewer physical injections than conventional parameter exploration. More broadly, the approach reframes fault injection from a static search problem into a sequential experimental-optimization problem.</p>
    </div>
  </div>
</div>

Look at the progression:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong>Fault injection matters</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Fault injection involves searching a physical parameter space</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>That search becomes inefficient and mostly produces useless experiments</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Therefore, use feedback from previous experiments to guide the search</strong></p>
  </div>
</div>

Again, the proposed solution feels natural because the Introduction has **constructed the need for it first**.

---

## Useful Tests for Your Introduction

### Test 1: Remove Your Proposed Method

Temporarily remove the paragraph describing the proposed method, then read everything before it. Ask:

> **Based only on these paragraphs, can I predict approximately what kind of solution the authors need?**

If yes, your problem formulation is probably strong. For the Transformer example, after reading **recurrent architectures dominate → recurrence imposes sequential computation → attention can model dependencies → attention is still generally combined with recurrence**, a reader can almost predict:

> Someone should try building the architecture without recurrence.

That is exactly where you want the reader to be. Your contribution should feel like a **logical response to the problem**, not a surprise inserted at the end of the Introduction.

### Test 2: Can You Draw Arrows Between the Paragraphs?

A strong Introduction should have causal or logical connections between paragraphs. Try writing one sentence for each paragraph and connect them:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong>A matters because B.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>B depends on mechanism C.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>C creates limitation D.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Existing approaches cannot adequately resolve D.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Therefore, we develop E.</strong></p>
  </div>
</div>

If you cannot explain why Paragraph 3 follows Paragraph 2, you may have a structural problem. For example, this is weak:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong>Cybersecurity is important.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Machine learning has become popular.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Fault injection attacks exist.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>We propose reinforcement learning.</strong></p>
  </div>
</div>

Every sentence may individually be true, but there is no research argument connecting them. Compare that with:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5; border: 1px solid #d0d0d0;">
    <p><strong>Fault-injection testing is necessary for evaluating physical hardware security.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Testing requires searching combinations of physical injection parameters.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Useful faults occupy only small regions of increasingly large search spaces.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>Static exploration therefore wastes large numbers of physical experiments.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong>We investigate adaptive learning that uses experimental feedback to guide future injections.</strong></p>
  </div>
</div>

Now every statement creates the reason for the next one.

---

## Common Mistakes in Research Introductions

<div class="post-mistake">
  <h3 class="post-mistake-title"><span class="post-mistake-num">1</span> Starting Too Broadly</h3>
  <p>Opening with “Technology has become an essential part of modern society” usually contributes almost nothing. Start broad enough to establish significance, but close enough to your actual research problem that every sentence matters.</p>
</div>

<div class="post-mistake">
  <h3 class="post-mistake-title"><span class="post-mistake-num">2</span> Turning the Introduction into Related Work</h3>
  <p>You do not need to discuss every previous approach before stating your problem. The Introduction should explain the <strong>categories of existing solutions and their limitations</strong>. Detailed paper-by-paper comparison can come later.</p>
</div>

<div class="post-mistake">
  <h3 class="post-mistake-title"><span class="post-mistake-num">3</span> Presenting a Gap Without a Consequence</h3>
  <p>Avoid relying only on “Very little research has investigated X.” Instead explain: existing techniques assume X; because that assumption fails under Y, they cannot provide Z. Now the gap has a consequence.</p>
</div>

<div class="post-mistake">
  <h3 class="post-mistake-title"><span class="post-mistake-num">4</span> Introducing the Solution Before Establishing the Problem</h3>
  <p>Researchers naturally become excited about their solution. But if you introduce your framework too early, readers have no benchmark for understanding why it is important. First make them understand the pain. Then present the cure.</p>
</div>

<div class="post-mistake">
  <h3 class="post-mistake-title"><span class="post-mistake-num">5</span> Confusing Activities with Contributions</h3>
  <p>These are activities:</p>
  <ul>
    <li>We implemented a prototype.</li>
    <li>We collected 10,000 traces.</li>
    <li>We trained five models.</li>
    <li>We evaluated three devices.</li>
  </ul>
  <p>They may be important parts of the research, but they are not necessarily contributions. Ask instead: What did the prototype enable? What did the traces reveal? What did the models demonstrate? What did evaluating the devices establish?</p>
</div>

---

## The Most Important Principle

The Introduction should not simply move from **general information to specific information**. It should move from **one logical necessity to another**. That is a subtle but important distinction.

A weak Introduction says:

> Here is some information about the field.  
> Here is some more specific information.  
> Here are several papers.  
> Here is our method.

A strong Introduction says:

<div class="post-figure">
  <div class="post-flow" style="background:#f5f5f5;">
    <p><strong style="color:#e8000d;">This problem matters.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">This particular mechanism determines the problem.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">That mechanism creates a limitation existing approaches cannot adequately overcome.</strong></p>
    <p class="post-flow-arrow">↓</p>
    <p><strong style="color:#e8000d;">Therefore, this paper addresses that limitation in this particular way.</strong></p>
  </div>
</div>

This is why I like to summarize the four-part framework with an even shorter version:

<div class="post-figure">
  <div class="text-center p-4 rounded" style="background:#e8000d; color:#fff;">
    <div class="h5 mb-0 font-weight-bold" style="letter-spacing: 0.02em;">
      Context → Mechanism → Tension → Resolution
    </div>
  </div>
</div>

Where:

- **Context** tells us why the world matters.
- **Mechanism** explains what controls the relevant behavior.
- **Tension** exposes where current knowledge or capability becomes insufficient.
- **Resolution** explains what your paper contributes.

That is the research story.

---

## A Final Checklist for Writing Your Introduction

Before submitting a paper, I would ask these questions.

<div class="post-figure post-figure--wide">
  <div class="row justify-content-center">
    <div class="col-md-6 mb-3">
      <div class="card h-100 border-0 shadow-sm text-left" style="border-top: 3px solid #e8000d !important;">
        <div class="card-body">
          <h5 class="h6 font-weight-bold" style="color:#e8000d;">Context</h5>
          <ul class="mb-0 pl-3">
            <li>Does the reader understand why the broader problem matters?</li>
            <li>Have I reached my actual research area quickly?</li>
            <li>Did I avoid unnecessary history?</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <div class="card h-100 border-0 shadow-sm text-left" style="border-top: 3px solid #e8000d !important;">
        <div class="card-body">
          <h5 class="h6 font-weight-bold" style="color:#e8000d;">Define Variables</h5>
          <ul class="mb-0 pl-3">
            <li>Does the reader understand the system, mechanism, or relationship central to my problem?</li>
            <li>Have I defined important terminology?</li>
            <li>Am I explaining only what is needed to understand the gap?</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <div class="card h-100 border-0 shadow-sm text-left" style="border-top: 3px solid #e8000d !important;">
        <div class="card-body">
          <h5 class="h6 font-weight-bold" style="color:#e8000d;">Gaps and Aims</h5>
          <ul class="mb-0 pl-3">
            <li>Have I clearly explained what existing approaches already accomplish?</li>
            <li>Have I identified what they still cannot accomplish?</li>
            <li>Have I explained <strong>why that limitation matters</strong>?</li>
            <li>Do my research aims directly address that limitation?</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <div class="card h-100 border-0 shadow-sm text-left" style="border-top: 3px solid #e8000d !important;">
        <div class="card-body">
          <h5 class="h6 font-weight-bold" style="color:#e8000d;">Contributions</h5>
          <ul class="mb-0 pl-3">
            <li>Is it obvious what is new?</li>
            <li>Am I describing contributions rather than activities?</li>
            <li>Does each contribution connect directly to a previously established gap?</li>
            <li>Does the reader understand what becomes possible or known because this paper exists?</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

If you can answer **yes** to those questions, your Introduction is probably doing more than summarizing your research. It is building an argument for it.

---

## Final Thought

When reviewers read an Introduction, you do not want their reaction at the end to be:

> “Okay, so this is what the authors decided to work on.”

You want something closer to:

> **“Given the problem they just described, this is exactly the research that needed to be done.”**

That is the difference between describing a contribution and **creating intellectual necessity for a contribution**. So the next time you struggle with the opening of a research paper, do not begin by asking *How should I summarize my work?* Instead, ask four questions:

1. **Why does this matter?**
2. **What exactly creates the problem?**
3. **Why is what we already have not enough?**
4. **What changes because of my work?**

Then build the Introduction around the answers: **Context → Define Variables → Gaps and Aims → Contributions**. Or, if you want the version that is easiest to remember: **Context → Mechanism → Tension → Resolution**.

A strong Introduction does not simply tell readers what your paper contains. **It makes them understand why the paper needs to exist.**
