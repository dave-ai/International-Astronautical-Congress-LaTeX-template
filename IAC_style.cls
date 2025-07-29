%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IAC_style.cls, v1.0, 2021-10-01
% Developed by
%     Davide Grande (email)
%     Stefano Farì (Github: stefanofari)
%
% This class file enables authors to prepare papers
% according to the manuscript style requested by the
% International Astronautical Federation (IAF) for
% submissions to the International Astronautical
% Congress (IAC)
%
% This file is based on:
% iaf-iac.cls, v0.0 developed by Matt Vernacchia
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IAC_style}[International Astronautical Congress conference paper LaTeX class]

\LoadClass[twocolumn,letter paper,10pt]{article}
\setlength\parskip{0pt} % no spacing at double return carriage

%-----------------------------------------------------
%% ------------ PACKAGES -----------------------------
\RequirePackage[colorlinks]{hyperref}
\RequirePackage{url}
\RequirePackage{graphicx}
%\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{cite}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage[explicit,compact]{titlesec}
\RequirePackage[normalem]{ulem}
\RequirePackage{etoolbox}
\RequirePackage{alphalph}
\RequirePackage{float}
\RequirePackage{orcidlink}
\RequirePackage{tabularx}
\RequirePackage{booktabs} % For \toprule etc. in tables
\RequirePackage[titletoc,toc,title]{appendix}  % For managing appendices
\RequirePackage{ulem}

\renewcommand{\headrulewidth}{0pt}

%-----------------------------------------------------
%% ------------ APPEARANCE ---------------------------
% Document setup
\RequirePackage[margin=2.25cm,top=3.35cm,bottom=3.35cm,headheight=\baselineskip]{geometry} % page layout
\setlength{\columnsep}{0.8cm} % column spacing
% Set Times New Roman
\usepackage[T1]{fontenc}
\usepackage{newtxmath,newtxtext}

% Captions
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,format=hang,indention=-20pt}
%\captionsetup[table]{format=hang,indention=-24pt}

% Sections style
%See end of file.%


\hypersetup{
    colorlinks=false,    % no colored links
    pdfborder={0 0 0}    % no borders around links
}


%-----------------------------------------------------
%% ------------ IAC CUSTOM PART ----------------------

\newcommand{\authormail}[1]{\href{mailto:#1}{\uline{#1}}}

\newcounter{authcount}
\newcommand{\IACauthor}[3]{%
	\stepcounter{authcount}%
	\csdef{iac@author\theauthcount}{#1}%
	\csdef{iac@affiliationidx\theauthcount}{#2}%
	\csdef{iac@iscorrespondingauthor\theauthcount}{#3}%
	}%

\newcounter{affiliationcount}
\newcommand{\IACauthoraffiliation}[1]{%
	\stepcounter{affiliationcount}%
	\csdef{iac@affiliation\theaffiliationcount}{#1}%
	}%

\setlength\parindent{12pt}
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,format=hang,indention=-20pt}
\captionsetup[table]{format=hang,indention=-24pt}

\titlespacing{\section}{0pt}{*3}{*1.5}
\titlespacing{\subsection}{0pt}{*2.5}{*0.5}
\titlespacing{\subsubsection}{12pt}{*2}{*0.5}
\titleformat{\section}{\centering\normalfont}{\Roman{section}. }{0.5em}{\uline{\textsc{#1}}}
\titleformat{\subsection}{\normalfont}{\Roman{section}.\roman{subsection}}{0.5em}{\uline{#1}}
\titleformat{\subsubsection}{\normalfont}{}{0pt}{\uline{#1}}

\renewcommand{\abstract}[1]{\def\iac@abstract{#1}}
\newcommand*{\IACpaperyear}[1]{\def\iac@paperyear{#1}}\IACpaperyear{}
\newcommand*{\IACpapernumber}[1]{\def\iac@papernumber{#1}}\IACpapernumber{}
\newcommand*{\IACconference}[1]{\def\iac@conference{#1}}\IACconference{}
\newcommand*{\IACcopyright}[1]{\def\iac@copyright{#1}}\IACcopyright{}
\newcommand*{\IAClocation}[1]{\def\iac@location{#1}}\IAClocation{}
\newcommand*{\IACdate}[1]{\def\iac@date{#1}}\IACdate{}


\newcommand{\IACcopyrightA}[1]{\def\iac@copyright{Copyright \copyright\iac@paperyear\ by the International Astronautical Federation. All rights reserved.}}
\newcommand{\IACcopyrightB}[1]{\def\iac@copyright{Copyright \copyright\iac@paperyear\ by #1. Published by the IAF, with permission and released to the IAF to publish in all forms.}}
\newcommand{\IACcopyrightC}[1]{\def\iac@copyright{#1}} 
\newcommand\iac@makecopyright{{\iac@copyright}}


\def\@maketitle{%
  \newpage
  \begin{center}%
    \iac@papernumber\par%
    \vskip1em
    {\large \textbf{{\@title}} \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \newcounter{authnum}%
      \setcounter{authnum}{0}
      \whileboolexpr
      { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
        {\stepcounter{authnum}%
      	\normalsize\textbf{\csuse{iac@author\theauthnum}}\textsuperscript{\@alph{\csuse{iac@affiliationidx\theauthnum}}}%
      	{\ifnumcomp{\csuse{iac@iscorrespondingauthor\theauthnum}}{=}{1}{*}{}}%
      	{\ifnumcomp{\value{authnum}}{=}{\theauthcount}{}{,\ }}%
	    }%
    }%
  \end{center}%
  \newcounter{affnum}
    \setcounter{affnum}{0}
    \whileboolexpr
    { test {\ifnumcomp{\value{affnum}}{<}{\theaffiliationcount}} }%
    {\stepcounter{affnum}%
    	\textsuperscript{\@alph{\value{affnum}}} 
    	\normalsize\textit{\csuse{iac@affiliation\theaffnum}}\par%
    	\vskip 1.5ex%
    }
    \setcounter{authnum}{0}
    \whileboolexpr
      { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
      {\stepcounter{authnum}%
		\ifnumcomp{\csuse{iac@iscorrespondingauthor\theauthnum}}{=}{1}{
      * Corresponding author
      \setcounter{authnum}{99}}{}\par% % exit the loop by invalidating the bool condition
		%\vskip 1.5ex%
	  }
%
  \begin{center}
      \textbf{Abstract}
  \end{center}
  \indent\iac@abstract\par%
  \vskip 4.5ex%
  
  }%

% Set header and footer
\pagestyle{fancy}%
\fancyhf{}

% Header
\chead{\footnotesize International Astronautical Congress, {\iac@location}, {\iac@date}.\\ \iac@makecopyright}

% Footer
\setlength{\footskip}{40pt}
\rfoot{Page \thepage\ of \pageref{LastPage}}
\lfoot{\iac@papernumber}


%-----------------------------------------------------
%% ------------ SECTIONS STYLE
% Sections spacing
\titlespacing{\section}{0pt}{15pt}{1pt}%
\titlespacing{\subsection}{0pt}{15pt}{1pt}%
\titlespacing{\subsubsection}{0pt}{15pt}{1pt}%

\titleformat{\section}{\bfseries}{\arabic{section}. }{0.5em}{{#1}}%
\titleformat{\subsection}{\itshape}{\arabic{section}.\arabic{subsection}}{0.5em}{{#1}}%
\titleformat{\subsubsection}{\itshape}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{{#1}}%

% Appendix handling setup
% Customizing the appendix title format
\RequirePackage{titlesec}
% Define hooks to customize the formatting within the appendices
\AtBeginEnvironment{appendices}{%
    \titleformat{\section}
      {\normalfont\bfseries}
      {Appendix \thesection.}
      {1em}
      {#1}
    \titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{3.3ex plus .2ex}
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    \renewcommand{\thefigure}{A\arabic{figure}}
    \renewcommand{\thetable}{A\arabic{table}}
    \renewcommand{\theequation}{A\arabic{equation}}
}

\AtEndEnvironment{appendices}{%
    % Reset the title format to the default or document-wide setting
    \titleformat{\section}
      {\normalfont\Large\bfseries}
      {\thesection}
      {1em}
      {#1}
}


% Biblio handling
\bibliographystyle{unsrt} % or any other style suitable for your document

\let\oldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \oldthebibliography{#1}%
  \vspace{6pt}
  \setlength{\itemsep}{0pt}%
  \urlstyle{same}
  \renewcommand{\UrlFont}{\color{blue}} % Underline and color URLs
}

