## Notes on ltxprimer


### The basics

---

#### Period:

`latex` assumes each period not following an upper case letter ends a sentence. In traditional typesetting, an extra little space is appended. Sometimes we don't want this, so: 

In order to produce 
`Carrots are good for your eyes, since they contain Vitamin A. Have you ever seen a rabbit wearing glasses?`, the correct input should be `Carrots are good for your eyes, since they contain Vitamin A\@. Have you ever seen a rabbit wearing glasses?`.

To produce
`The numbers 1, 2, 3, etc. are called natural numbers. According to Kronecker, they were made by God; all else being the work of Man.`, the correct input should be `The numbers 1, 2, 3, etc.\ are called natural numbers. According to Kronecker, they were made by God;all else being the works of Man.`.

#### Quotes:

To produce "", input ` `` ` and ` '' `, or use `\lq` and `\rq` instead.

#### Hyphenation:


* Hyphen (`-`): separating compound names. e.g., Munthe-Kaas;
* Compound nouns are not hyphenated, but compound adjectives are; e.g., Lie group as opposed to Lie-group method. Compound adjectives that use adverbs are not hyphenated; e.g., "diagonally implicit method" is correct;
* `--` (em-dash): used between two people, e.g., Runge--Kutta;
* `---` (en-dash): connects things that are related to each other by distance, as in the `May–September issue of a magazine`.

#### Accents:

`Él está aquı́`, input `\’{E}l est\’{a} aqu\’{\i}`.

Some special symbols:


| Symbol | Input           |
| ------ | --------------- |
| ~      | \textasciitilde |
| \      | \textbackslash  |
| _      | \\ _            |


#### Fonts

Style (roman, sans serif, etc.), series (medium, boldface, etc.), shape (upright, italic, etc.)

Declaration (`\upshape`) and command (`\textup{}`). The declaration can be used as enviroment names.

Optional arguments are inclosed in `[]`, and mandatory arguments are inclosed in `()`.

### Document

---

#### Page format

* onecolumn/twocolumn
* oneside/twoside (affects position of page number)
* openany(chapters begin on “any” new page)/openright(chapters begin only on new right , that is, odd numbered, page)
* notitlepage/titlepage (whether to separate title page)

#### Page style

* `\pagestyle{...},\thispagestyle{...}`


* plain/empty/headings/myheadings
* `\pagenumbering{...}`
* arabic/roman/Roman/alph/Alph
* `\setcounter{page}{ number }`

#### Forming a document

* `\and` helps you to put authors parallel
* A proper hierarchy:\chapter\section\subsection\subsubsection\paragraph\subparagraph
* `\subsubsection` is not numbered
* A detailed structure, see P24 and 25
* [\Par and "\\\"](https://tex.stackexchange.com/questions/82664/when-to-use-par-and-when-or-blank-lines)


### Bibliography

---

* Bib style packages: harvard, natbib
* With `\nocite{*}` , every entry in all the databases will be included, something that is useful when producing a list of all entries and their keys.
* `aux`: reference auxiliary; `bib`: original bib; `bst`: bib style; `bbl` formatted bib; `blg`: log




### Table of contents, index and glossary

---

* `.toc`: table of contents, `*.lot` list of tables, `*.lof` list of figures 

* > Edit the .toc , lof , lot files and use a \nofiles command to suppress the writing of new versions of the files 

  is the last resort for you to fine-tune TOC

* Use `\addtocontents{ file }{ text }`  or`\addcontentsline{ file }{ type }{ text }` to add sections marked with `*` (will be omitted by default) (Actually `\addcontentsline` is invoked by `\section` or `caption`)

* Fragile argument: [What is the difference between Fragile and Robust commands](https://tex.stackexchange.com/questions/4736/what-is-the-difference-between-fragile-and-robust-commands)

* `minitoc` for mini TOC

* `makeidx`to make index (`*.idx` file)

* `\makeglossary` to make glossary (`*.glo` file)



### Displayed text

---

* Quotation `\begin{quote} \end{quote}` or (for multiple paragraphs) `\begin{quotation} \end{quotation}`
* `verse` environment to quote poem. Use `\\*` to put it within a page. Use `\\[n pt]` to specify line space
* `{\renewcommand{\labelitemi}{$\triangleright$}` (for example, `\labelitemi`, `\labelitemiv`, etc.) to replace default itemize bullets. Use `{}` to enclose `\renewcommand` and anything else for local effect only
* Package `enumerate` for customized enumerate bullets and other formatting styles
* `\renewcommand{\descriptionlabel}[1]{\hspace{1cm}\textsf{#1}}` example to customize description
* `enumerate` can also include description





### Rows and columns

---

* `tabbing` environment for vertical alignment in `enumerate`

* Use parbox to format column cells

* `\multicolumn{1} `can override the position specification of any column set at the beginning of the environment.

* `\arraystretch` to stretch columns

* Use `r@{--}l` for range. Example:

  ```
  \begin{center}
  \begin{tabular}{|c|r@{--}l|}
  \hline
  Height & \multicolumn{2}{c|}{Ideal weight}\\
  (cm)
  & \multicolumn{2}{c|}{(kg)}\\
  \hline
  155 & 53.5 & 64\\
  160 & 56
  & 67\\
  ...............
  190 & 78
  & 92.5\\
  \hline
  \end{tabular}
  \end{center}
  ```



* Enhancement: `array`, `multirow`, `multicol`, `longtable`, `hhline`, `delarray`, `tabularx` etc.




### Mathematics

---

* Text placed within `$$` is in math italic

* TeX has its own spacing rules in math mode

* Inline math: in LaTeX:`\( ... \)` or `\begin{math}\end{math}`); in TeX: `$$`

* Independent line: in LaTeX: `\[\]` or `\begin{displaymath}\end{displaymath}`, in TeX: `$$$$`

* `\;`: thickspace, `\,` thinspace

* `\ldots`: ellipsis (`...`)

* Binary operator:`\mathbin`; relation operator: `\mathrel`

  ```
  x\Box y % produces x\Boxy
  x\mathbin\Box y % produces x \Box y
  ```

* `\newcommand{\vect}[1]{(#1_1,#1_2,\dots,#1_n)}% use \vect{sth}` will substitute 1 to sth (2 and #2, 3 and #3... is the same)

* The `amsmath` package:

  * Multi-line equation: `multline` env; use `split` env and `&` for alignment

  * Multi equations: `gather` env pr `align` env

  * An example: gather two groups of equations together

    * ```
      \begin{equation*}
      	\begin{aligned}
      		\cosˆ2x+sinˆ2x & = 1\\
      		\cosˆ2x-\sinˆ2x & = \cos 2x
      	\end{aligned}
      	\qquad\text{and}\qquad
      	\begin{aligned}
      		\coshˆ2x-\sinhˆ2x & = 1\\
      		\coshˆ2x+\sinhˆ2x & = \cosh 2x
      	\end{aligned}
      \end{equation*}
      ```

  * `\tag{}` for customized equation label; `\notag` to suppress

  * `pmatrix` is enclosed in parentheses,  `bmatrix` is in square brackets, `Bmatrix` is in braces, and `vmatrix` is for determinant

  * `\dotsc`  for dots to be used with commas, `\dotsb` for dots with binary operations (or relations), and `\dotsm` for multiplication dots. There is also a `\dotsi` for dots with integrals

  * `smallmatrix` env for inline matrices (use `\left \right` for appropriate alignment for brackets)

  * `\bigl, \bigr; \biggl, \biggr; \Biggl, \Biggr` to control bracket sizes (if you find using `\left \right` produces too large brackets)

  * `\tfrac` a "tiny" version of `\frac`, `\genfrac` for a customized frac. Note, binomial coefficients `\binom` is a special case of `\genfrac`

  * `\verset` for putting symbols overhead. e.g. `$\overset{\circ}{a}$`

  * `\displaystyle` changes inline expressions to displayed style (as in env).

  * `\substack` for multi-line subscripts.

  * Refer to "Log-like symbols" for math notations that should be typed in Roman (other than usual italic)

  * `\DeclareMathOperator*{\new_operator}{statement}`

  * "The TEX Book": more on typing math

* \newtheorem{user_difined}{displayed_test}[numbering_style]`, for `userdefined` env

* Customized theorem: `amsthm` package



### Boxes

---

* A box is an object that is treated by TEX as a single character. A box cannot be split and broken across lines or pages.

* 3 types of boxes:
  * LR: (left-right) The content of this box are typeset from left to right.
  * Par: (paragraphs) This kind of box can contain several lines, which will be typeset in paragraph mode just like normal text. Paragraphs are put one on top of the other. Their widths are controlled by a user specified value.
  * Rule: A thin or thick line that is often used to separate various logical elements on the output page, such as between table rows and columns and between running titles and the main text.

* LR boxes:

  * ```
    \mbox{ text } % without frame
    \makebox{ width }{ pos }{ text } % without frame
    \fbox{ text } % with frame
    \framebox{ width }{ pos }{ text } % with frame
    % pos arguments: l for left, r for right, c for center, s for stretch (in-text spaces)
    ```

  * `\fboxrule`, `\fboxsep`, and`\raisebox` for determining frame style, box positions(or rotations)

* Par boxes:

  * Use either `\parbox` or `minipage` env (`minipage` is a page itself, i.e., it has footnotes, contains tabular, etc.)
  * `\parbox{ pos }{ height }{ inner pos }{ width }{ text }` or `\begin{minipage}{ pos }{ height }{ inner pos }{ width }`, with `t,b,c,s` for top, bottom, center, stretch

* A rule box is basically a filled-in black rectangle.

* > It is also possible to have a rule box of zero width. This creates an invisible line with the given height. Such a construction is called a strut and is used to force a horizontal box to have a desired height or depth that is different from that of its contents.





### Floats

---

* Figures:


* ```
  \begin{figure}
  	\includegraphics{figure.eps}
  	\caption{This is an inserted EPS graphic} 
  	% use \caption[lof]{description} to produce concise description in list of figures
  	\label{fig1}
  \end{figure}
  ```

  * Figures are not allowed in boxes (`\parbox` or `minipage`)
  * Positional arguments: h for here, t for top, b for bottom and p for page containing only floats (default `[tbp]`)
  * `\clearpage` : This command places unprocessed floats and starts a new page.
  * `\FloatBarrier`: This command causes all unprocessed floats to be processed. This is provided by the `placeins` package. It does not start a new page, unlike `\clearpage `.
  * To place figures within a section: `\usepackage[section]{placeins}`, a less-restrictive one: `\usepackage[below]{placeins}`
  * The `afterpage` package provides the \afterpage command which executes a command at the next naturally-ocurring page break. (`\afterpage{\clearpage} `causes all unprocessed floats to be cleared at the next page break.)
  * Use float placement counters to control number of floats per page: `\setcounter{totalnumber/topnumber/bottomnumber}{n}`
  * Adjust float coverage per page using `\textfraction` etc.
  * Add graphics search path: `\graphicspath{{dir1/}{dir2/}}`
  * `\rotatebox` and `\scalebox` provided by `graphicx` package can rotate and boxes and floats

* `tabular` is actually a `minipage`

  * The `tabular` env:

  * `\begin{ tabular }[ pos ]{ cols } rows \end{ tabular }``

  * ``\begin{ tabular* }{ width }[ pos ]{ cols } rows \end{ tabular* }`

  * Column positioning arguments:

    | cols              | meaning                                  |
    | ----------------- | ---------------------------------------- |
    | l                 | left                                     |
    | r                 | right                                    |
    | c                 | center                                   |
    | { wd }            | The text in this column is set into lines of width wd and the top line is aligned with the other columns. In fact, the text is set in a parbox with the command \parbox[ t ]{ wd }{ column text } . |
    | * { num }{ cols } | The column format contained in cols is reproduced num times, so that *{3}{\|c\|}\| is the same as \|c\|c\|c\| . |





### Cross references

---

* "cross" means both backward AND  forward
* Use `~` in your cross reference to avoid breaking lines
* In floats, `\label` command should be given after the `\caption` command or in its argument
* `\pageref{ key }` refer to page number 
* Package `varioref` (`\vref{key}`) produces "full" reference (position, page number, etc.) using some rules.  (produce `ref` and/or `\pageref` depending on the current page)
* Use package `xr` for external reference: `\usepackage{xr} \externaldocument{ other.tex }`





### Footnotes, marginpars, and endnotes

---

* Use `tabularx`, `longtable` or wrap `tabular` in `minipage` if you want to use footnote inside a `tabular`. Another package called `threeparttable` is also helpful.
* `\setcounter{footnote}{0}` for resetting footnote counter (or use `\@addtoreset{footnote}{section}` in `\makeatletter` or `\makeatother` preamble)
* `\marginpar` for marginal notes. A better version (macro): `\newcommand{\marginlabel}[1] {\mbox{}\marginpar{\raggedleft\hspace{0pt}#1}}`
* Create query for margin notes: `\def\query#1#2{\underline{#1}\marginpar{#2}}`
* Package `endnotes` for endnotes.