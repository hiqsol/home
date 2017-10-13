let sol_host = {
    \'function_name': 'sol_host',
    \'function_body': [
        \'function sol_host {',
        \'  if [[ $USER = "sol" ]]; then',
        \'      printf "%s@%s %s" $USER $(cat ~/hostname) $HOST',
        \'  fi',
        \'}']}
let notsol_host = {
    \'function_name': 'notsol_host',
    \'function_body': [
        \'function notsol_host {',
        \'  if [[ $USER != "sol" ]]; then',
        \'      printf "%s@%s %s" $USER $(cat ~/hostname) $HOST',
        \'  fi',
        \'}']}
let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a' : [ notsol_host ],
        \'b' : [ sol_host ],
        \'c' : [ '%*' ],
        \'x' : [ '%~' ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'options': {
            \'left_sections' : ['a', 'b', 'c', 'warn'],
            \'right_sections' : ['x', 'y', 'z']}}
