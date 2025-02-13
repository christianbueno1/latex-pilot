% (c)  2020 Jumar Martin <jumar@jumart.in> https://jumart.in

%This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sga-bill}[2020-02-24 Elon University Student Government Bill class]

% Base Class
\LoadClass[12pt, onecolumn]{article}
\DeclareOption{twocolumn}{\OptionNotUsed}

\ProcessOptions\relax

%Required Packages
\RequirePackage[letterpaper,
                top=1in, 
                left=1in, 
                right= 1in, 
                bottom=1in]{geometry}
\RequirePackage{mathptmx}
\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{enumitem}
\RequirePackage[utf8]{inputenc}
\RequirePackage[normalem]{ulem}
\RequirePackage{xcolor}

%Variable Initialization
\def\sponsor#1{\def\@sponsor{#1}}
\def\president#1{\def\@president{#1}}
\def\status#1{\def\@status{#1}}
\def\speaker#1{\def\@speaker{#1}}
\def\secretary#1{\def\@secretary{#1}}
\def\second#1{\def\@second{#1}}
\def\aye#1{\def\@aye{#1}}
\def\nay#1{\def\@nay{#1}}
\def\abstain#1{\def\@abstain{#1}}

\def\billtitle#1{
    \def\@billtitle{
            \textbf{%
                \MakeUppercase{A BILL TO #1}
            }
    }
}
\def\billcode#1{\def\@billcode{#1}}


%Support for editing while voting
%\out marks text in red and strikes out text wrapped
%\add marks text in blue and denotes text wrapped added as an amendment
\newcommand{\out}[1]{\textcolor{red}{\sout{#1}}}
\newcommand{\add}[1]{\textcolor{blue}{#1}}

%defines WHEREAS
\newcommand{\whereas}[1]{\noindent\textbf{WHEREAS:} #1;\vspace{12pt}}

%Defines ARTICLE [Numeral]
%TODO: put into enum environment to automatically generate the numeral instead of leaving it to human error
\newcommand{\article}[2]{\noindent\textbf{ARTICLE \expandafter\@slowromancap\romannumeral #1@:} #2\vspace{12pt}}
christianbueno1
how to add space between variables

GitHub Copilot
You can add extra spacing in your signature tabular by increasing the row spread or adding horizontal space. For example:


%Defines Therefore 
\newcommand{\therefore}{
    \noindent
    \textbf{%
        \MakeUppercase{Therefore, be it resolved that:}
    }
    \vspace{12pt}
}

%Creates the correct heading for all bills and title
\renewcommand{\maketitle}{
    \begin{center}
        
        In the Student Senate
        
        S.B. \@billcode
        
        \@date
        
        \vspace{12pt}
        \@billtitle
    \end{center}
}

%Defines sub lists, as A. B. etc.
\newenvironment{sub}
    {\begin{enumerate}[label=\Alph*.]
    }
    {%
      \end{enumerate}  
    }

%Defines the signatures package at the end of every bill. 
%Utilizes the variable defined in the preamble. 
\newcommand{\signatures}{
    \renewcommand{\arraystretch}{1}
    \noindent\begin{tabular}{p{3in}p{3in}}
    \hrulefill & \hrulefill \\
    Author: \@author & Speaker of the Senate: \@speaker \\
    \hrulefill & \hrulefill \\
    Sponsor: \@sponsor & Secretary of the Senate: \@secretary \\
    \hrulefill & \hrulefill \\
    Second By: \@second & Vote: \@aye\quad \@nay\quad \@abstain\quad \\
    \hrulefill & \hrulefill \\
    STATUS: \@status & SGA President: \@president \\
    \end{tabular}
}
% Gobble Page Number
\pagenumbering{gobble}