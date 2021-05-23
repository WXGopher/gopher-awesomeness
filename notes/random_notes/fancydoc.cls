
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancydoc}[2011/09/01 -- Fancy Document, -- Mark G. Eramian]

\ProcessOptions

\LoadClassWithOptions{article}
\RequirePackage{geometry} 	% for margins and paper size
\RequirePackage[colorlinks,linkcolor=MidnightBlue,citecolor=MidnightBlue,urlcolor=MidnightBlue]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{listings}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amssymb}
\RequirePackage{titlesec}

\geometry{letterpaper}   % Force letter-sized paper.
\geometry{margin={1in,1in}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set base font to Palatino
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[sc]{mathpazo}
\linespread{1.05}         % Palatino needs more leading (space between lines)


\newtheorem{example}{Example}


\titleformat{\section}{\normalfont\LARGE\color{MidnightBlue}}{\bf\thesection}{.5em}{\bf}
\titleformat{\subsection}{\normalfont\Large\color{MidnightBlue}}{\bf\thesubsection}{.5em}{\bf}
\titleformat{\subsubsection}{\normalfont\large\color{MidnightBlue}}{\bf\thesubsubsection}{.5em}{\bf}


