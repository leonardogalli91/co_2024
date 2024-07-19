%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExerciseSheet}

%%Preliminary definitions, needed by the options

%%This parts handles the options passed to the class.
\newif\if@solution 
\newif\if@hidesolution\@hidesolutiontrue

\DeclareOption{solution}{
	\@solutiontrue
	\@hidesolutionfalse
}
% % Execute default options
\ExecuteOptions{10pt}

\ProcessOptions \relax

\LoadClass[10pt]{article}


\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\setlength{\headheight}{23pt}

%%including the packages
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{comment}
\RequirePackage{xcolor}


\RequirePackage{multirow}
\RequirePackage{fancyhdr}
\RequirePackage{amsthm}

\RequirePackage{enumerate} %for different types of enumerate

\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{caption}

%define set get methods for attributes
\def\setExerciseSheetNumber#1{
	\def\getExerciseSheetNumber{#1}}
	\def\getExerciseSheetNumber{({\textbackslash}setExerciseSheetNumber\{...\} not defined)
	}
 \def\setSubmissionDate#1{
	\def\getSubmissionDate{#1}}
	\def\getSubmissionDate{({\textbackslash}setSubmissionDate\{...\} not defined)
	}
%% Commands for efficient typing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros for efficient typing
%% Nice letters
\newcommand{\abf}{{\bf a}}
\newcommand{\bbf}{{\bf b}}
\newcommand{\dbf}{{\bf d}}
\newcommand{\ebf}{{\bf e}}
\newcommand{\fbf}{{\bf f}}
\newcommand{\gbf}{{\bf g}}
\newcommand{\hbf}{{\bf h}}
\newcommand{\sbf}{{\bf s}}
\newcommand{\ubf}{{\bf u}}
\newcommand{\vbf}{{\bf v}}
\newcommand{\xbf}{{\bf x}}
\newcommand{\ybf}{{\bf y}}
\newcommand{\zbf}{{\bf z}}

\def\Abf{{\mathbf A}}
\def\Bbf{{\mathbf B}}
\def\Ibf{{\mathbf I}}
\def\Xbf{{\mathbf X}}

\newcommand{\bsb}{{\boldsymbol b}}
\newcommand{\bsg}{{\boldsymbol g}}
\newcommand{\bsi}{{\boldsymbol i}}
\newcommand{\bsy}{{\boldsymbol y}}
\newcommand{\bsz}{{\boldsymbol z}}
\newcommand{\bsx}{{\boldsymbol x}}
\newcommand{\bsv}{{\boldsymbol v}}

\newcommand{\C}{\mathord{\mathrm{C^1}}}

\def\Acal{{\mathcal A}}
\def\Bcal{{\mathcal B}}
\def\Ccal{{\mathcal C}}
\def\Dcal{{\mathcal D}}
\def\Fcal{{\mathcal F}}
\def\Gcal{{\mathcal G}}
\def\Hcal{{\mathcal H}}
\def\Ical{{\mathcal I}}
\def\Jcal{{\mathcal J}}
\def\Lcal{{\mathcal L}}
\def\Mcal{{\mathcal M}}
\def\Ocal{{\mathcal O}}
\def\Pcal{{\mathcal P}}
\def\Ucal{{\mathcal U}}
\def\Wcal{{\mathcal W}}
\def\Xcal{{\mathcal X}}
\def\Ycal{{\mathcal Y}}

%% Nice differential calculus
\newcommand{\dif}[1]{\mathrm{d} #1}
\newcommand{\partder}[2]{\frac{\partial #1}{\partial #2}}

%% Some usual operators
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\sign}{sign}
\newcommand{\inner}[2]{\langle #1, #2 \rangle}
\DeclareMathOperator*{\VCdim}{VCdim}
\newcommand{\llbracket}{[\![}
\newcommand{\rrbracket}{]\!]}


%my own comments 
\newcommand{\Exptwo}[2]{\mathbb{E}_{#1}\left[#2\right]}
\newcommand{\Exp}[1]{\mathbb{E}\left[#1\right]}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Rn}{\mathbb{R}^n}
\newcommand{\Sp}[1]{\mathbb{S}^{#1}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Prob}[1]{\mathbb{P}\left[#1\right]}
\newcommand{\Pbb}{\mathbb{P}}
\newcommand{\Ebb}{\mathbb{E}}
\newcommand{\Rbb}{\mathbb{R}}
\newcommand{\Nbb}{\mathbb{N}}


%% Nice writings
\renewcommand{\(}{\left(} % Large parenthesis
\renewcommand{\)}{\right)}






%% Commands for theorems and propositions ... 
\usepackage{amsthm}
\newtheorem{exo}{Exercise}
\newtheorem{problem}{Problem}
\newtheorem{rmk}{Remark}
\newtheorem*{Notation}{Notation}
\newtheorem*{atheorem}{Theorem}
\newtheorem*{adef}{Definition}
\newtheorem{alemma}{Lemma}
\newtheorem{exm}{Example}
\newtheorem{pb}{Exercise}
\newtheorem*{solution}{Solution}
%\if@hidesolution\excludecomment{solution}\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usefull for collaborations
\usepackage{color}                    % For creating coloured text and background
\newcommand{\jlb}[1]{{\color{magenta}{#1}}}
\newcommand{\ideas}[1]{{{\bf Idea:} \color{yellow}{#1}}}
\newcommand{\important}[1]{{\color{red}{CHECK: {#1}}}}


%%%%%%%%%%%%%
% Define Header Section
%%%%%%%%%%%%%%
\AtBeginDocument{
\date{today}

% create two minipages for the names on the right and the semester on the left
\noindent
\begin{minipage}[t]{18 em}
\begin{flushleft}
Dr. Leonardo Galli,\\ Wiebke Bartolomaeus, M.Sc., \\ Maxime Nguegnang, M.Sc.

\end{flushleft}
\end{minipage}\hfill
\begin{minipage}[t]{0.4\textwidth}
\begin{flushright}%
Summer semester 2024
\end{flushright}%
\end{minipage}


\vskip 0.6cm

% Title and submission deadline
\hrule
\begin{center}
\begin{huge}
Continuous Optimization\\
\vskip 0.2cm
 Exercise sheet \getExerciseSheetNumber   \ifsolutions \ - Solutions\fi
\end{huge}

\vskip 0.3cm

\begin{large}
\ifsolutions
\else
The exercise sheet consists of two parts. You should submit the solutions to the Problems via Moodle. We will correct them and give you feedback.\\
The solution to the Exercises will be constructed interactively in the tutorial session, so you are encouraged to read/solve them, but there is no need to submit them.
\vskip 0.3cm
\fi
 \end{large}
\end{center}
\hrule

\vskip 0.6cm

}