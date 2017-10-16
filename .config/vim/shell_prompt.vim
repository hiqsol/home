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
let ok_git_status = {
    \'function_name': 'ok_git_status',
    \'function_body': [
        \'function ok_git_status {',
        \'  local ok=$(__promptline_git_status)',
        \'  if [[ $ok = "✔" ]]; then',
        \'      printf "%s" $ok',
        \'  fi',
        \'}']}
let notok_git_status = {
    \'function_name': 'notok_git_status',
    \'function_body': [
        \'function notok_git_status {',
        \'  local ok=$(__promptline_git_status)',
        \'  if [[ $ok != "✔" ]]; then',
        \'      printf "%s" $ok',
        \'  fi',
        \'}']}

let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a' : [ notsol_host ],
        \'b' : [ sol_host ],
        \'c' : [ '%*' ],
        \'x' : [ '%~' ],
        \'y' : [ promptline#slices#vcs_branch(), ok_git_status ],
        \'z' : [ notok_git_status ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'options': {
            \'left_sections' : ['a', 'b', 'c', 'warn'],
            \'right_sections' : ['x', 'y', 'z']}}
