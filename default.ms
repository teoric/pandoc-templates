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
.\" Localization before PIC/TABLE
$if(hyphenate)$
.nr german-new-hyphenation-patterns 1
.hy
$if(lang)$
.mso $lang$.tmac
.ds PH "NIX"
.mso trans.tmac
.\" tm $lang$ \*[\*[locale]-lifg] \*[Lifg]
$endif$
$else$
.nh \" Turn off hyphenation by default.
$endif$
.\" **** PICs *****************************************************
.nr IMAGE 0 1 \" register for image number, autoincrement
.nr TABLE 0 1 \" register for image number, autoincrement
.de ANYPIC  \" macro to be replaced by user with PSPIC or PDFPIC
.  nr PICWIDTH \\$$4
.  nr PICWIDTH_O \\$$4
.  nr PICHEIGHT \\$$5
.  nr PICHEIGHT_O \\$$5
.  nr PICWIDTH (\\n[PICWIDTH] <? (\\n(LL) * 98 / 100))
.  nr PICHEIGHT (\\n[PICHEIGHT] <? (\\n(.p) * 98 / 100))
.  nr REL_HEIGHT (\\n[PICHEIGHT] * 1000 / \\n[PICHEIGHT_O])
.  nr REL_WIDTH (\\n[PICWIDTH] * 1000 / \\n[PICWIDTH_O])
.\"  br
.  nr FILLED_BEFORE \\n[.u]
.  ie \\n[FILLED_BEFORE] .ds ORIENT -L
.  el ds ORIENT -C
.  nf
\\h'\\n[PICWIDTH]u'
.  ie (\\n[REL_HEIGHT] < \\n[REL_WIDTH]) \{\
.  \" from groff_tmac(7)
.  vpt 0
.  sp -1
.  vpt 1
.    tm scaling for height
.    nr PICWIDTH (\\n[REL_HEIGHT] * \\n[PICWIDTH_O] / 1000)
.  \}
.  el \{\
.    tm scaling for width
.    nr PICHEIGHT (\\n[REL_WIDTH] * \\n[PICHEIGHT_O] / 1000)
.  \}
.  tm FILE \\$$3 \\$$4 \\$$5 \" NAME [WIDTH [HEIGHT]]
.  tm FILE \\$$3 \\n[PICWIDTH] \\n[PICHEIGHT] \\n[PICHEIGHT_O]
.  ie !'\\$$2'' \{\
.    ie '\\$$1'F' .KF \" start keep - floating with KF
.    el .KS \" start keep - non-floating with KS
.    PDFPIC \\*[ORIENT] \\$$3 \\n[PICWIDTH]u \\n[PICHEIGHT]u
.\}
.  el \{
.    PDFPIC \\*[ORIENT] \\$$3 \\n[PICWIDTH]u \\n[PICHEIGHT]u
.\}
.\"  nr IMAGE +1
.  ie !'\\$$2'' \{\
.if \\n[FILLED_BEFORE] .fi
.QP
.if '\\*[.T]'pdf' .sp \\n[PICHEIGHT]u
\*[Lifg] \\n+[IMAGE]. \\$$2
.\}
.el .if '\\*[.T]'pdf' .sp \\n[PICHEIGHT]u
.  if '\\$$1'F' .sp 1.5
.  if !'\\$$2'' \{\
.    KE \" end keep
\}
..
.\" **** TABLES *****************************************************
.de TABLESTART
.KS
..
.de TABLELABLE
.sp
.nr TABLE_LABELLED 1
.QP
\*[Litb] \\n+[TABLE]. \\fI\\$$1\\fP
..
.de TABLEEND
.\}
.sp 1.5v
.KE
..
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
.  nr FPS \n(PS*8/10u
.  nr FVS \n(PS*\n[linescale]*8/10/1000u
.\}
.if n .nr FPS \n[PS]u
.\"tm PS: \n(PS, VS: \n(VS
.\"tm FPS: \n[FPS], FVS: \n[FVS]
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
