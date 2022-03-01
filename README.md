# 40kTeX
A LaTeX class for creating a 9th edition Warhammer 40,000 Codex lookalike based on the Codex:Aeldari.

## Usage
Tested using **LuaLaTex**. Packages dont work nicely together when building with XeLaTeX or LaTeX.

### Commands
\section{<text>}
  
\subsection{<text>}
  
\pagetitle{<text>}									                                  Large type de-columned title
  
\kw{<text>}											                                      Capitalised, bolded text used for keywords
  
\kwopt{<text>}										                                    Capitalised, bolded text surrounded by <> used for keywords
  
\barsection{<color>}{<left text>}{<right text>}		                    Subtitle with two parts and background colour used for stratagem titles
  
\dsixtable{<title>}{<col 2 name>}{}{}{}{}{}{}		                      D6 results table with title
  
\dthreetable{<title>}{<col 2 name>}{}{}{}			                        D3 results table with title
  
\weapon{<name>}{<Range>}{<type>}{<S>}{<AP>}{<D>}{<Abilities>}         Weapon datasheet table
  
### Environments
twocolumnbody										                                      Main page body with two columns, start a new one if you need to use \newpage (use it between the two twocolumnbody's) or if you want a section that is not seperated into columns
  
fluff												                                          Italicised text used for lore descriptions
  
### Custom Colours
darkgreen
  
gray
  
lightgray
