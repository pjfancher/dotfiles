" =============================================================================
" Filename: ~/.vim/lightline-colors/peej.vim
" Author: PJ Fancher
" License: MIT License
" Last Change: 3/2017
" =============================================================================
let s:base03  = [ '#151513', 233 ]
let s:base02  = [ '#30302C', 236 ]
let s:base01  = [ '#4E4E43', 239 ]
let s:base00  = [ '#666656', 242  ]
let s:base0   = [ '#808070', 244 ]
let s:base1   = [ '#949484', 246 ]
let s:base2   = [ '#A8A897', 248 ]
let s:base3   = [ '#E8E8D3', 253 ]
let s:yellow  = [ '#DEE251', 229 ]
let s:orange  = [ '#D78700', 172 ]
let s:red     = [ '#D68787', 124 ]
let s:magenta = [ '#DF5F87', 168 ]
let s:peach   = [ '#D7AFAF', 181 ]
let s:blue    = [ '#87AFAF', 109 ]
let s:cyan    = [ '#87D7D7', 23 ]
let s:green   = [ '#87AF87', 108 ]
let s:white   = [ '#D0D0D0', 252 ]


let s:p                 = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:base02, s:blue ], [ s:blue, s:base01 ] ]
let s:p.normal.right    = [ [ s:base02, s:blue ], [ s:blue, s:base01 ] ]
"let s:p.normal.middle   = [ [ s:blue, s:base02 ] ]
let s:p.normal.middle   = [ [ s:base03, s:blue ] ]

let s:p.insert.left     = [ [ s:base02, s:yellow ], [ s:yellow, s:base01 ] ]
let s:p.insert.right    = [ [ s:base02, s:yellow ], [ s:yellow, s:base01 ] ]
"let s:p.insert.middle   = [ [ s:yellow, s:base02 ] ]
let s:p.insert.middle   = [ [ s:base03, s:yellow ] ]

let s:p.replace.left    = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.replace.right   = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
"let s:p.replace.middle  = [ [ s:magenta, s:base02 ] ]
let s:p.replace.middle  = [ [ s:base03, s:magenta ] ]

let s:p.visual.left     = [ [ s:base02, s:orange ], [ s:orange, s:base01 ] ]
let s:p.visual.right    = [ [ s:base02, s:orange ], [ s:orange, s:base01 ] ]
"let s:p.visual.middle   = [ [ s:orange, s:base02 ] ]
let s:p.visual.middle   = [ [ s:base03, s:orange ] ]

let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]

let s:p.tabline.left    = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel  = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right   = copy(s:p.normal.right)
let s:p.normal.error    = [ [ s:red, s:base02 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]


" Production Server Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://jonasjacek.github.io/colors/
let s:db_fg  = [ '#000000', 000 ]
let s:db_bg  = [ '#FF5F00', 202 ]
let s:da_fg  = [ '#121212', 233 ]
let s:da_bg  = [ '#D787AF', 175 ]
let s:pr_fg  = [ '#FF5FD7', 206 ]
let s:pr_bg  = [ '#3A3A3A', 237 ]
let s:cd_fg  = [ '#8A8A8A', 245 ]
let s:cd_bg  = [ '#000087', 18 ]
let s:bc_fg  = [ '#EEEEEE', 255 ]
let s:bc_bg  = [ '#5F8700', 64 ]
let s:cr_fg  = [ '#DADADA', 253 ]
let s:cr_bg  = [ '#5F5F87', 60 ]
let s:dc_fg  = [ '#000000', 000 ]
let s:dc_bg  = [ '#D78700', 172 ]
let s:ha_fg  = [ '#EEEEEE', 255 ]
let s:ha_bg  = [ '#AF5F00', 130 ]
let s:gvs_fg = [ '#00AFD7', 38 ]
let s:gvs_bg = [ '#3A3A3A', 237 ]

let hostname = hostname()
let servernames = {
    \'db': 'digitalbrands', 
    \'da': 'datingadvice', 
    \'pr': 'printaholic', 
    \'cd': 'cd-master-web', 
    \'bc': 'badcredit', 
    \'cr': 'cardrates', 
    \'dc': 'dealcrunch', 
    \'ha': 'hostingadvice', 
    \'gvs': 'gainesvilleshows', 
\}

for [key, val] in items(servernames)
    if( hostname =~ val )
        let s:p.normal.right  = [ [ s:white, s:red ], [ s:{key}_fg, s:{key}_bg ] ]
        let s:p.normal.left  = [ [ s:white, s:red ], [ s:{key}_fg, s:{key}_bg ] ]
        let s:p.insert.right  = [ [ s:white, s:red ], [ s:{key}_fg, s:{key}_bg ] ]
        let s:p.insert.left  = [ [ s:white, s:red ], [ s:{key}_fg, s:{key}_bg ] ]
        let s:p.insert.middle = [ [ s:white, s:red ] ]
    end
endfor

let g:lightline#colorscheme#peej#palette = lightline#colorscheme#flatten(s:p)
