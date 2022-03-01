
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{40kcodex}[2022/03/01 Warhammer 40,000 codex style template]


%%----------------------------------------------------------------------
%%-- Commands
%%
%% \pagetitle{<text>}									Large type de-columned title
%% \kw{<text>}											Capitalised, bolded text used for keywords
%% \kwopt{<text>}										Capitalised, bolded text surrounded by <> used for keywords
%% \barsection{<color>}{<left text>}{<right text>}		Subtitle with two parts and background colour used for stratagem titles
%% \section{<text>}
%% \subsection{<text>}
%% \dsixtable{<title>}{<col 2 name>}{}{}{}{}{}{}		D6 results table with title
%% \dthreetable{<title>}{<col 2 name>}{}{}{}			D3 results table with title
%% \weapon{<name>}{<Range>}{<type>}{<S>}{<AP>}{<D>}{<Abilities>}
%%														Weapon datasheet table
%% 
%%-- Environments
%%
%%  twocolumnbody										Main page body with two columns
%% 	fluff												Italicised text used for lore descriptions
%%
%% 
%%-- Colours
%%
%%  darkgreen
%%  gray
%%  lightgray
%%
%% 

%%----------------------------------------------------------------------
%%-- Core Packages

\LoadClass[]{article}

\RequirePackage{calc}
\RequirePackage{suffix}
\RequirePackage{multicol}
\usepackage{setspace}
\usepackage[]{microtype}
\usepackage{textcase,relsize}
\usepackage{xcolor}
\usepackage{tcolorbox}
\usepackage{array}
\usepackage{booktabs}
\usepackage{colortbl}
\RequirePackage{ifthen}

%% Change the base font to Helvetica Sans
%\RequirePackage[T1]{fontenc}
%\RequirePackage[scaled]{helvet}
%\renewcommand*{\familydefault}{\sfdefault}

%\usepackage{librecaslon}

\usepackage{fontspec}
\setmainfont{Adobe Caslon Pro}

\newfontfamily\Helveticafont[]{TexGyreHeros}

%%----------------------------------------------------------------------
%%-- Change document params
\setlength{\parindent}{0pt}
\setlength{\parskip}{9pt}
\setlength\fboxsep{3pt}
\setlength{\columnsep}{0.6cm}
\setlength\extrarowheight{4pt}

\RequirePackage[margin=2.2cm,footskip=0.25in]{geometry}
\usepackage[none]{hyphenat}
\linespread{1.4}

\usepackage{enumitem}
\setitemize{noitemsep,topsep=3pt,parsep=2pt,partopsep=0pt, leftmargin=*}

\usepackage[pages=all]{background}
\backgroundsetup{
	scale=1,
	color=black,
	opacity=1,
	angle=0,
	contents={%
		\includegraphics[width=\paperwidth,height=\paperheight]{pagebackgroundclean}
	}%
}

%%----------------------------------------------------------------------
%%-- Colours
\definecolor{darkgreen}{RGB}{21, 74, 26} 
\definecolor{gray}{gray}{0.45}
\definecolor{lightgray}{gray}{0.8}

%%----------------------------------------------------------------------
%%-- Utility Functions

\newcommand{\setbodyfontsize}{\fontsize{9pt}{8pt}\selectfont}

\newcommand{\pagetitle}[1]
{
	\twocolumn[
	\begin{@twocolumnfalse}
		\begin{spacing}{2.3}
			{\textls[40]{\bf\fontsize{32}{1}\selectfont\Helveticafont #1}}
		\end{spacing}
		\vspace*{5pt}
	\end{@twocolumnfalse}
	]
}
\newcommand{\kw}[1]{\fontsize{8}{1}\selectfont\textbf{\Helveticafont\textsc{#1}}\setbodyfontsize}

\newcommand{\kwopt}[1]{\fontsize{8}{1}\selectfont\textbf{\Helveticafont\textsc{<#1>}}\setbodyfontsize}

\renewcommand{\section}[1]{\vspace*{12pt}\fontsize{16}{1}\selectfont\textbf{\Helveticafont#1}\setbodyfontsize\vspace*{-6pt}}

\renewcommand{\subsection}[1]{\fontsize{10}{1}\selectfont{\Helveticafont#1}\setbodyfontsize\vspace*{-9pt}}

\newcommand{\barsection}[3]{
	\begin{tcolorbox}[sharp corners,
						rounded corners=southeast,
						colback=#1,
						coltext=white,
						boxsep=0mm,
						boxrule=0mm,
						left=0.7mm,
						right=1mm,
						top=1mm,
						bottom=0.5mm,
						arc=2mm]
		\bf\Helveticafont
		\fontsize{11}{1}\selectfont
		#2
		\hfill
		#3
	\end{tcolorbox}
	\setbodyfontsize
}

% table formatting
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{1}{|c}
\newcolumntype{2}{p{7cm}|}
\newcommand*\tbltitle[1]{\multicolumn{2}{|l|}{\vspace{5pt}\Helveticafont\bfseries\textsc{\fontsize{11}{1}\selectfont\textcolor{white}{#1}}}\setbodyfontsize}
\newcommand*\tblheading[1]{\Helveticafont\bfseries{\textsc{\fontsize{10}{1}\selectfont\textcolor{white}{#1}}}\setbodyfontsize}
\newcommand*\tblbeforeheading{\hline}
\newcommand*\tblafterheading{\hline}
\newcommand*\tblnormalline{}
\newcommand*\tbllastline{\toprule}

\newcommand{\cellwithnewlines}[2][c]{
	\begin{tabular}[#1]{@{}p{7cm}@{}}#2\vspace{3pt}\end{tabular}}

\newcommand{\dsixtable}[8]{
	
	\begin{tcolorbox}[sharp corners,
						rounded corners=northwest,
						colback=black,
						coltext=white,
						boxsep=0mm,
						boxrule=0mm,
						left=1.7mm,
						right=1mm,
						top=1mm,
						bottom=1mm,
						arc=2mm]
		\bf\Helveticafont
		\fontsize{11}{1}\selectfont
		#1
	\end{tcolorbox}
	\setbodyfontsize
	\vspace{-6pt}
	
	\begin{tabular}[C]{12} \tblbeforeheading\rowcolor{gray}
		%\tbltitle{#1}\\\tblafterheading
		\tblheading{D6} & \tblheading{#2} \\\tblafterheading
		1 & \cellwithnewlines[C]{#3} \\\tblnormalline\rowcolor{lightgray}
		2 & \cellwithnewlines[C]{#4} \\\tblnormalline
		3 & \cellwithnewlines[C]{#5} \\\tblnormalline\rowcolor{lightgray}
		4 & \cellwithnewlines[C]{#6} \\\tblnormalline
		5 & \cellwithnewlines[C]{#7} \\\tblnormalline\rowcolor{lightgray}
		6 & \cellwithnewlines[C]{#8} \\\tbllastline
	\end{tabular}	
}

\newcommand{\dthreetable}[5]{
	
	\begin{tcolorbox}[sharp corners,
		rounded corners=northwest,
		colback=black,
		coltext=white,
		boxsep=0mm,
		boxrule=0mm,
		left=1.7mm,
		right=1mm,
		top=1mm,
		bottom=1mm,
		arc=2mm]
		\bf\Helveticafont
		\fontsize{11}{1}\selectfont
		#1
	\end{tcolorbox}
	\setbodyfontsize
	\vspace{-6pt}
	
	\begin{tabular}[C]{12} \tblbeforeheading\rowcolor{gray}
		%\tbltitle{#1}\\\tblafterheading
		\tblheading{D6} & \tblheading{#2} \\\tblafterheading
		1-2 & \cellwithnewlines[C]{#3} \\\tblnormalline\rowcolor{lightgray}
		3-4 & \cellwithnewlines[C]{#4} \\\tblnormalline
		5-6 & \cellwithnewlines[C]{#5} \\\tbllastline
	\end{tabular}	
}

\newcommand{\weapon}[7]{
	\begin{tabular}[C]{p{2.4cm}P{1.2cm}p{1.2cm}P{0.3cm}P{0.3cm}P{0.3cm}}
		\hspace{-5pt}\textbf{\Helveticafont WEAPON} & \textbf{\Helveticafont RANGE} & \textbf{\Helveticafont TYPE} & \textbf{\Helveticafont S} & \textbf{\Helveticafont AP} & \textbf{\Helveticafont D} \\\hline
		\hspace{-5pt}#1 & #2 & #3 & #4 & #5 & #6 \\
	\end{tabular}

	\ifthenelse{\equal{#7}{}}{}{\vspace{-5pt}\textbf{Abilities:} #7}
}

%%----------------------------------------------------------------------
%%-- Environments

\newenvironment{twocolumnbody}{\setbodyfontsize\raggedright}{}

\newenvironment{fluff}{\it}{}
