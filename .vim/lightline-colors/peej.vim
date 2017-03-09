" =============================================================================
" Filename: ~/.vim/lightline-colors/peej.vim
" Author: PJ Fancher
" License: MIT License
" Last Change: 3/2017
" =============================================================================
let s:base03  = [ '#151513', 233 ]
let s:base02  = [ '#30302c', 236 ]
let s:base01  = [ '#4e4e43', 239 ]
let s:base00  = [ '#666656', 242  ]
let s:base0   = [ '#808070', 244 ]
let s:base1   = [ '#949484', 246 ]
let s:base2   = [ '#a8a897', 248 ]
let s:base3   = [ '#e8e8d3', 253 ]
let s:yellow  = [ '#dee251', 229 ]
let s:orange  = [ '#d7875f', 216 ]
let s:red     = [ '#d68787', 124 ]
let s:magenta = [ '#df5f87', 168 ]
let s:peach   = [ '#d7afaf', 181 ]
let s:blue    = [ '#87afaf', 109 ]
let s:cyan    = [ '#87d7d7', 23 ]
let s:green   = [ '#87af87', 108 ]
let s:white   = [ '#d0d0d0', 252 ]

let s:dbfg    = [ '#FFFFFF', 0 ]
let s:dbbg    = [ '#FFFFFF', 202 ]

let s:p                 = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:base02, s:blue ], [ s:blue, s:base01 ] ]
let s:p.normal.right    = [ [ s:base02, s:blue ], [ s:blue, s:base01 ] ]
let s:p.normal.middle   = [ [ s:blue, s:base02 ] ]

let s:p.insert.left     = [ [ s:base02, s:yellow ], [ s:yellow, s:base01 ] ]
let s:p.insert.right    = [ [ s:base02, s:yellow ], [ s:yellow, s:base01 ] ]
let s:p.insert.middle   = [ [ s:yellow, s:base02 ] ]

let s:p.replace.left    = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.replace.right   = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.replace.middle  = [ [ s:magenta, s:base02 ] ]

let s:p.visual.left     = [ [ s:base02, s:red ], [ s:red, s:base01 ] ]
let s:p.visual.right    = [ [ s:base02, s:red ], [ s:red, s:base01 ] ]
let s:p.visual.middle   = [ [ s:red, s:base02 ] ]

let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]

let s:p.tabline.left    = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel  = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right   = copy(s:p.normal.right)
let s:p.normal.error    = [ [ s:red, s:base02 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]

let hostname = hostname()
let production = 0

if( hostname == 'digitalbrands.com' )
    let production = 1
    let s:p.normal.right    = [ [ s:base02, s:blue ], [ s:dbfg, s:dbbg ] ]
end

if( production == 1 )
    let s:p.normal.middle   = [ [ s:white, s:red ] ]
    let s:p.insert.middle   = [ [ s:white, s:red ] ]
end


let g:lightline#colorscheme#peej#palette = lightline#colorscheme#flatten(s:p)
