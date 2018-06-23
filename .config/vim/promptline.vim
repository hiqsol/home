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
        \'  local BR=$(git rev-parse --abbrev-ref HEAD)',
        \'  if [[ $ok = "✔" ]] && [[ $BR = "master" ]]; then',
        \'      printf "✔"',
        \'  fi',
        \'}']}
let notok_git_status = {
    \'function_name': 'notok_git_status',
    \'function_body': [
        \'function notok_git_status {',
        \'  local ok=$(__promptline_git_status)',
        \'  local BR=$(git rev-parse --abbrev-ref HEAD)',
        \'  if [[ $ok != "✔" ]] || [[ $BR != "master" ]]; then',
        \'      printf " %s  %s" $BR $ok',
        \'  fi',
        \'}']}

let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a' : [ notsol_host, promptline#slices#jobs() ],
        \'b' : [ sol_host ],
        \'c' : [ '%*' ],
        \'x' : [ '%~' ],
        \'y' : [ ok_git_status ],
        \'z' : [ notok_git_status ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'options': {
            \'left_sections' : ['a', 'b', 'c', 'warn'],
            \'right_sections' : ['x', 'y', 'z']}}
