%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resume class (restyled variant for the Amazon-tailored CV)
%
% Derived from Trey Hunner's "Medium Length Professional CV" class
% (http://www.LaTeXTemplates.com). Same API as the master's resume.cls:
%   \name{...}, \address{...} (1-3x), rSection{TITLE}, rSubsection{org}{dates}{title}{loc}
% Visual changes vs. the master: Charter typeface, navy accent color for the name,
% section titles and rules, icon-based contact header, and hanging-indent bullets.
%
% Copyright (C) 2010 by Trey Hunner. Copying and distribution of this file, with or
% without modification, are permitted in any medium without royalty provided the
% copyright notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2026/09/07 v1.1 Resume class (restyled)]

\LoadClass[10pt,letterpaper]{article}

\usepackage[T1]{fontenc}
\usepackage[scaled=.93]{XCharter}   % Bitstream Charter clone: warm, compact, prints well
\usepackage{microtype}
\usepackage[parfill]{parskip}        % No paragraph indentation
\usepackage{array}
\usepackage{ifthen}
\usepackage{xcolor}
\usepackage{fontawesome5}

\definecolor{accent}{HTML}{1F3A5F}   % deep navy
\definecolor{muted}{HTML}{5A5A5A}    % gray for dates / locations

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=accent,
    filecolor=accent,
    urlcolor=accent,
}

\pagestyle{empty} % No page numbers

%----------------------------------------------------------------------------------------
%	HEADER: name and contact lines
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}
\def \@name {}

% Separator between items on one contact line
\def \addressSep {{\color{muted}\;|\;}}

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% Contact line: centered, small, allowed to wrap (no overfull hbox)
\def \printaddress #1{
  \begingroup
    \centering\small
    % \centering does \let\\\@centercr, so the separator must be defined AFTER it
    \def\\{\addressSep}
    #1\par
  \endgroup
  \addressskip
}

\def \printname {
  \begingroup
    {\centering{\color{accent}\namesize\bfseries\MakeUppercase{\@name}}\par}
    \nameskip
  \endgroup
}

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{
  \sectionskip
  {\color{accent}\large\bfseries\MakeUppercase{#1}}\par
  \vspace{-0.75em}
  % parskip's [parfill] forces 30pt of end-of-line slack, which makes a full-width
  % \rule overfull; zero it locally for the rule paragraph.
  {\setlength{\parfillskip}{0pt}\noindent\textcolor{accent}{\rule{\linewidth}{0.9pt}}\par}
  \vspace{-0.45em}
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
    \setlength{\topsep}{0.1em}
    \setlength{\parsep}{0pt}
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	EXPERIENCE ENTRIES
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{
 {\bfseries #1} \hfill {\color{muted}\small #2}
 \ifthenelse{\equal{#3}{}}{}{
  \\
  {\itshape #3} \hfill {\itshape\small\color{muted} #4}
  }
  \vspace{-0.2em}
  \begin{list}{{\color{accent}\small\textbullet}}{
    \setlength{\leftmargin}{1.15em}
    \setlength{\labelsep}{0.5em}
    \setlength{\labelwidth}{0.65em}
    \setlength{\itemsep}{0.1em}
    \setlength{\topsep}{0.2em}
    \setlength{\parsep}{0pt}
    \setlength{\parskip}{0pt}
  }
  }{
  \end{list}
  \vspace{0.35em}
}

%----------------------------------------------------------------------------------------
%	SPACING
%----------------------------------------------------------------------------------------

\def\namesize{\LARGE}
\def\addressskip{\vspace{0.15em}}
\def\nameskip{\vspace{0.2em}}
\def\sectionskip{\vspace{0.55em}}
