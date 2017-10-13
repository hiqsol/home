let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a' : [  ],
        \'b' : [ '$(whoami)@$(cat ~/hostname) $(hostname)' ],
        \'c' : [ '%*' ],
        \'x' : [ '%~' ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'options': {
            \'left_sections' : ['a', 'b', 'c', 'warn'],
            \'right_sections' : ['x', 'y', 'z']}}
