" Vim syntax file
" Language:	Markdown
" Maintainer:	Ben Williams <benw@plasticboy.com>
" URL:		http://plasticboy.com/markdown-vim-mode/
" Version:	9
" Last Change:  2009 May 18 
" Remark:	Uses HTML syntax file
" Remark:	I don't do anything with angle brackets (<>) because that would too easily
"		easily conflict with HTML syntax
" TODO: 	Handle stuff contained within stuff (e.g. headings within blockquotes)


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn spell toplevel
syn case ignore
syn sync linebreaks=1

"additions to HTML groups
syn region mkdBold     start=/\\\@<!\(^\|\A\)\@=\*\@<!\*\*\*\@!/     end=/\\\@<!\*\@<!\*\*\*\@!\($\|\A\)\@=/   contains=@Spell,mkdItalic
syn region mkdItalic   start=/\\\@<!\(^\|\A\)\@=\*\@<!\*\*\@!/       end=/\\\@<!\*\@<!\*\*\@!\($\|\A\)\@=/      contains=mkdBold,@Spell
syn region mkdBold     start=/\\\@<!\(^\|\A\)\@=_\@<!___\@!/         end=/\\\@<!_\@<!___\@!\($\|\A\)\@=/       contains=mkdItalic,@Spell
syn region mkdItalic   start=/\\\@<!\(^\|\A\)\@=_\@<!__\@!/          end=/\\\@<!_\@<!__\@!\($\|\A\)\@=/        contains=mkdBold,@Spell

" [link](URL) | [link][id] | [link][]
syn region mkdLink matchgroup=mkdDelimiter      start="\!\?\[" end="\]\ze\s*[[(]" contains=@Spell nextgroup=mkdURL,mkdID skipwhite oneline
syn region mkdID matchgroup=mkdDelimiter        start="\["    end="\]" contained
syn region mkdURL matchgroup=mkdDelimiter       start="("     end=")"  contained

" Link definitions: [id]: URL (Optional Title)
" TODO handle automatic links without colliding with htmlTag (<URL>)
syn region mkdLinkDef matchgroup=mkdDelimiter   start="^ \{,3}\zs\[" end="]:" oneline nextgroup=mkdLinkDefTarget skipwhite
syn region mkdLinkDefTarget start="<\?\zs\S" excludenl end="\ze[>[:space:]\n]"   contained nextgroup=mkdLinkTitle,mkdLinkDef skipwhite skipnl oneline
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+"+     end=+"+  contained
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+'+     end=+'+  contained
syn region mkdLinkTitle matchgroup=mkdDelimiter start=+(+     end=+)+  contained

"define Markdown groups
syn match  mkdLineContinue ".$" contained
syn match  mkdRule      /^\s*\*\s\{0,1}\*\s\{0,1}\*$/
syn match  mkdRule      /^\s*-\s\{0,1}-\s\{0,1}-$/
syn match  mkdRule      /^\s*_\s\{0,1}_\s\{0,1}_$/
syn match  mkdRule      /^\s*-\{3,}$/
syn match  mkdRule      /^\s*\*\{3,5}$/
syn match  mkdListItem  "^\s*[-*+]\s\+"
syn match  mkdListItem  "^\s*\d\+\.\s\+"
syn match  mkdCode      /^\s*\n\(\(\s\{4,}[^ ]\|\t\+[^\t]\).*\n\)\+/
syn match  mkdLineBreak /  \+$/
syn region mkdCode      start=/\\\@<!`/                   end=/\\\@<!`/
syn region mkdCode      start=/\s*``[^`]*/          end=/[^`]*``\s*/
syn region mkdBlockquote start=/^\s*>/              end=/$/                 contains=mkdLineBreak,mkdLineContinue,@Spell
syn region mkdCode      start="<pre[^>]*>"         end="</pre>"
syn region mkdCode      start="<code[^>]*>"        end="</code>"

"HTML headings
syn region mkdH1       start="^\s*#"                   end="\($\|#\+\)" contains=@Spell
syn region mkdH2       start="^\s*##"                  end="\($\|#\+\)" contains=@Spell
syn region mkdH3       start="^\s*###"                 end="\($\|#\+\)" contains=@Spell
syn region mkdH4       start="^\s*####"                end="\($\|#\+\)" contains=@Spell
syn region mkdH5       start="^\s*#####"               end="\($\|#\+\)" contains=@Spell
syn region mkdH6       start="^\s*######"              end="\($\|#\+\)" contains=@Spell
syn match  mkdH1       /^.\+\n=\+$/ contains=@Spell
syn match  mkdH2       /^.\+\n-\+$/ contains=@Spell

"highlighting for Markdown groups
hi def link mkdString	     String
hi def link mkdCode          String
hi def link mkdBlockquote    Comment
hi def link mkdLineContinue  Comment
hi def link mkdListItem      Identifier
hi def link mkdRule          Identifier
hi def link mkdLineBreak     Todo
hi def link mkdLink          Underlined
hi def link mkdURL           String
hi def link mkdID            Identifier
hi def link mkdLinkDef       mkdID
hi def link mkdLinkDefTarget mkdURL
hi def link mkdLinkTitle     String
hi def      mkdBold          term=bold cterm=bold gui=bold
hi def      mkdItalic        term=italic cterm=italic gui=italic
hi def      mkdH1            term=bold ctermfg=blue guifg=blue ctermbg=white guibg=white
hi def      mkdH2            term=bold ctermfg=green guifg=green
hi def link mkdH3            Title
hi def link mkdH4            mkdH3
hi def link mkdH5            mkdH4
hi def link mkdH6            mkdH5

hi def link mkdDelimiter     Delimiter

let b:current_syntax = "mkd"

" vim: ts=8
