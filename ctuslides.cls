% Copyright (c) CTU  - All Rights Reserved
% Created on: 6/7/19
%     Author: Vladimir Petrik <vladimir.petrik@cvut.cz>
%
% Available options, i.e. \documentclass[option1,option2,..]{ctuslides}
%       nofoot - don't display footer
% Available commands:
%   for title page:
%       \titlecolor - text color for title page [white for presentation, ctubluelight for handout]
%       \titlebackground [ctubluelight for presentation, white for handout]
%       \titlelogo - ctulogo by default [white for presentation, ctubluelight for handout]
%       \ctutitlenote - the text at the title bottom [empty by default]
%
%       \ctutiltepage - render title page from the above parameters
%       \ctutitlepage{text} - add given text at the bottom of the page (usefull e.g. for note)
%
%   for footer setting:
%       \ctufootertext{left top text}{left bottom text}{right top text}{right bottom text}
%           default values are: LT: title; LB: grey author name; RT: empty; RB: slide number
%
%   other:
%        \clickableimage[width=0.5\textwidth]{fig/img.png}
%           includes image twice: on the required slide and at the end of presentation[fullscreen];
%           they points to each other by hyperref
%
%
% Versions and changelog:
%   2019-06-14
%       reversed color for title page (blue text on white bg)
%       default aspect ration changed to 1610
%   2019-06-12
%       Defined default titlenote
%   2019-06-11
%       Initial version released
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ctuslides}
\RequirePackage{lastpage}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{pgfpages}
\usepackage[absolute,overlay]{textpos}

\RequirePackage{ctustyle} % for ctu colors and logos

% command for title setting
\newcommand{\titlecolor}{white}
\newcommand{\titlebackground}{\color{ctubluelight}\rule{\paperwidth}{\paperheight}}
\newcommand{\titlelogo}{\resizebox{!}{2.0cm}{\ctulogo[white]}\\}
\def\titlenote{}
\newcommand\ctutitlenote[1]{\def\titlenote{#1}}

% command for footer setting
\newcommand\ctufootertext[4]{\def\footelemlt{#1}\def\footelemlb{#2}\def\footelemrt{#3}\def\footelemrb{#4}}
%\ctufootertext{\beamer@shorttitle}{{\color{gray} \beamer@shortauthor}}{}{\insertframenumber~/~\inserttotalframenumber}
\ctufootertext{\insertsectionhead}{{\color{gray} \beamer@shortauthor}}{}{\insertframenumber~/~\inserttotalframenumber}

\newif\iffooter\footertrue

% Set default aspect ration to 1610
\RequirePackage{kvoptions}
\DeclareStringOption[1610]{aspectratio}
\ProcessKeyvalOptions{ctuslides}\relax
\PassOptionsToClass{aspectratio=\ctuslides@aspectratio}{beamer}

% Other options
\DeclareOption{nofoot}{\footerfalse} % don't display footer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}} % Pass unknown options to Beamer class
\ProcessOptions
\LoadClass{beamer}

\mode<handout>{
    \renewcommand{\titlecolor}{ctubluelight}
    \renewcommand{\titlebackground}{\color{white}\rule{\paperwidth}{\paperheight}}
    \renewcommand{\titlelogo}{\resizebox{!}{2.0cm}{\ctulogo[ctubluelight]}\\}
}

% SOME CUSTOMIZATION
\newlength\ctuframemargin \setlength{\ctuframemargin}{0.8cm}
\setbeamertemplate{navigation symbols}{} % Remove navigation symbols
\setbeamertemplate{frametitle continuation}[from second]
\setbeamersize{text margin left=\ctuframemargin, text margin right=\ctuframemargin}
\setbeamertemplate{frametitle}{\vspace{0.4cm}\insertframetitle}
\iffooter\setbeamertemplate{footline}{\vspace{1.1cm}}\fi

\setbeamerfont{title}{size=\Large, series=\bfseries}
\setbeamerfont{frametitle}{size=\Large, series=\bfseries}
\setbeamerfont{alerted text}{series=\bfseries}

% Set colors
\setbeamercolor{structure}{fg=ctubluelight}
\setbeamercolor{alerted text}{fg=ctubluelight}
\setbeamercolor{example text}{fg=ctubluelight}

% FOOTER
\newlength\ctufooterplace \setlength\ctufooterplace{0.90\beamer@paperheight}
\newlength\ctufooterruleheight \setlength\ctufooterruleheight{2.5pt}
\newlength\ctufooterrulewidth \setlength\ctufooterrulewidth{0.9375\beamer@paperwidth}
\newlength\ctusymbolheight \setlength\ctusymbolheight{0.08\beamer@paperheight}%
\newlength\ctusymbolwidth \setlength\ctusymbolwidth{1.546875\ctusymbolheight}%

\usebackgroundtemplate{
\iffooter
\begin{minipage}{\paperwidth}%
    \centering %
    \begin{minipage}{\ctufooterrulewidth}%
        \vspace{\ctufooterplace}{\color{ctubluelight}\rule{\ctufooterrulewidth}{\ctufooterruleheight}}
        \footnotesize \bfseries %
        \begin{minipage}{\ctusymbolwidth}%
            \resizebox{!}{\ctusymbolheight}{\ctusymbol}
        \end{minipage}%
        \begin{minipage}[t]{\ctufooterrulewidth-\ctusymbolwidth}%
            \vspace{-0.5\ctusymbolheight}
            \footelemlt \hfill \footelemrt\\
            \footelemlb \hfill \footelemrb
        \end{minipage}
    \end{minipage}
\end{minipage}%
\fi
}

% Title frame
\newlength\ctutitlesep \setlength\ctutitlesep{0.4cm}
\newlength\ctutitleentrysep \setlength\ctutitleentrysep{0.2cm}

\newcommand{\ctutitleframe}[1][]{
{\usebackgroundtemplate{\titlebackground}
\frame[t]{
\centering
\vspace{0.6cm}
\titlelogo
\vspace{1.2cm}
{\color{\titlecolor}
{\bfseries \Large \inserttitle}  \\[\ctutitlesep]
\footnotesize \insertsubtitle \\[\ctutitlesep]
{\bfseries \insertauthor} \\[\ctutitleentrysep]
\footnotesize \insertinstitute \\[\ctutitleentrysep]
\insertdate \\[\ctutitleentrysep]
\titlenote #1
}}}}

% Defines \clickableimage[]{} environment
\newcounter{ctuimg}
\newcounter{cturef}

\newcommand{\clickableimage}[2][width=1.\textwidth]{%
\hyperlink{ctu:clickimg:ref:\thectuimg}{\includegraphics[#1]{#2}}\label{ctu:clickimg:img:\thectuimg}%
\refstepcounter{ctuimg}%
\AtEndDocument{%
\usebackgroundtemplate{}%
\begin{frame}[plain]%
    \label{ctu:clickimg:ref:\thecturef}%
    \centering%
    \begin{textblock*}{\paperwidth}(0\paperwidth,0\paperheight)
    \centering
    \vbox to 0.95\paperheight {
    \vfil{
    \hyperlink{ctu:clickimg:img:\thecturef}{\includegraphics[width=\beamer@paperwidth,height=\beamer@paperheight,keepaspectratio]{#2}}%
    \refstepcounter{cturef}
    }
    \vfil
    }
    \end{textblock*}
\end{frame}%
}}

\mode<handout>{
\setbeameroption{show notes on second screen=bottom}
\setbeamertemplate{note page}{\vspace{1cm}\insertnote}
\renewcommand{\clickableimage}[2][width=1.\textwidth]{\includegraphics[#1]{#2}} %back to standard include in handout
}