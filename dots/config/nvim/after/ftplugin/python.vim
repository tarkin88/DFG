let g:python3_host_prog=expand("~/.envs/neovim/bin/python3")

let g:ale_fixers = {
\   'python': ['yapf']
\}

let g:ale_linters = {
\   'python': ['prospector', 'pylint'],
\}
