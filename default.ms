.\" **** Custom macro definitions *********************************
.\" * Super/subscript
.\" (https://lists.gnu.org/archive/html/groff/2012-07/msg00046.html)
.ds { \v'-0.3m'\\s[\\n[.s]*9u/12u]
.ds } \s0\v'0.3m'
.ds < \v'0.3m'\s[\\n[.s]*9u/12u]
.ds > \s0\v'-0.3m'
.\" * Horizontal line
.de HLINE
.LP
.ce
\l'20'
..
$if(highlighting-macros)$
.\" * Syntax highlighting macros
$highlighting-macros$
$endif$
.\" **** Settings *************************************************
.\" left margin
.nr PO 2.5cm
.\" text width
.nr LL 21cm
.nr LL -2*\n[PO]u
.\" top margin
.nr HM 2.0cm
.\" bottom margin
.\".nr LL 5.5i
.\".\" left margin
.\".nr PO 1.25i
.\".\" top margin
.\".nr HM 1.25i
.\".\" bottom margin
.nr FM 3cm
.\" header/footer width
.nr LT \n[LL]u
.\" relative lineheight
.nr linescale $if(linescale)$$linescale$$else$1175$endif$
.\" point size
.nr PS $if(pointsize)$$pointsize$$else$10p$endif$
.\" line height
.nr VS $if(lineheight)$$lineheight$$else$\n(PS*\n[linescale]/1000u$endif$
.\" font family: A, BM, H, HN, N, P, T, ZCM
.fam $if(fontfamily)$$fontfamily$$else$T$endif$
.lg 0
.\" paragraph indent
.nr PI $if(indent)$$indent$$else$2m$endif$
.\" interparagraph space
.\"nr PD 0.33v
.\" footnote width
.nr FL \n[LL]u
.\" footnote point size
.if t\{\
.  nr FPS \n(PS*800/1000u
.  nr FVS \n(PS*\n[linescale]/1000*800/1000u
.\}
.if n .nr FPS \n[PS]u
$if(papersize)$
.\" paper size
.ds paper $papersize$
$endif$
.\" color used for strikeout
.defcolor strikecolor rgb 0.7 0.7 0.7
.\" color for links (rgb)
.ds PDFHREF.COLOUR   0.35 0.00 0.60
.\" border for links (default none)
.ds PDFHREF.BORDER   0 0 0
.\" point size difference between heading levels
.nr PSINCR 1p
.\" heading level above which point size no longer changes
.nr GROWPS 2
.\" comment these out if you want a dot after section numbers:
.als SN SN-NO-DOT
.als SN-STYLE SN-NO-DOT
.\" pdf outline fold level
.nr PDFOUTLINE.FOLDLEVEL 3
.\" start out in outline view
.pdfview /PageMode /UseOutlines
.\" ***************************************************************
.\" PDF metadata
.pdfinfo /Title "$title-meta$"
.pdfinfo /Author "$author-meta$"
$if(adjusting)$
.ad $adjusting$
$endif$
$if(hyphenate)$
.nr german-new-hyphenation-patterns 1
.hy
$if(lang)$
.mso $lang$.tmac
$endif$
$else$
.nh \" Turn off hyphenation by default.
$endif$
$if(has-inline-math)$
.EQ
delim @@
.EN
$endif$
$for(header-includes)$
$header-includes$
$endfor$
$if(title)$
.TL
$title$
$endif$
$for(author)$
.AU
$author$
$endfor$
$if(date)$
.ND "$date$"
$endif$
$if(abstract)$
.AB
$abstract$
.AE
$endif$
.\" 1 column (use .2C for two column)
.1C
$for(include-before)$
$include-before$
$endfor$
$body$
$if(toc)$
.TC
$endif$
$for(include-after)$
$include-after$
$endfor$
.pdfsync
