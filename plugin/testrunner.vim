" vim-testrunner - Run tests/specs of Ruby on Rails projects
" Maintainer:   Szymon Wrozynski
" Version:      0.0.1
"
" Installation:
" Place in ~/.vim/plugin/testrunner.vim or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-testrunner.git
"
" License:
" Copyright (c) 2013 Szymon Wrozynski and Contributors.
" Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" help TestRunner
" https://github.com/szw/vim-testrunner/blob/master/README.md

if exists("g:loaded_testrunner") || &cp || v:version < 700
    finish
endif

let g:loaded_testrunner = 1

if !exists('g:testrunner_set_default_mapping')
    let g:testrunner_set_default_mapping = 1
endif

if !exists('g:testrunner_set_mapping_with_bang')
    let g:testrunner_set_mapping_with_bang = 0
endif

if !exists('g:testrunner_default_mapping_key')
    let g:testrunner_default_mapping_key = '<F9>'
endif

command! -bang -nargs=0 RunTests :call s:run_tests(expand('%'), <bang>0)

if g:testrunner_set_default_mapping
    let command = ':RunTests'

    if g:testrunner_set_mapping_with_bang
        let command .= '!'
    endif

    silent! exe 'nnoremap <silent>' . g:testrunner_default_mapping_key command . '<CR>'
endif

fun! s:run_tests(file_name, bang)
    if !exists('g:loaded_dispatch')
        echo 'Vim-Dispatch plugin is required to run tests/specs'
        return
    endif

    let dispatch_command = ':Dispatch '

    if (match(a:file_name, '^spec/.*_spec\.rb$') == 0) && !a:bang
        let dispatch_command .= 'rspec %'
    elseif (match(a:file_name, '^test/.*_test\.rb$') == 0) && !a:bang
        let dispatch_command .= 'rake test:single %'
    elseif isdirectory('spec')
        let dispatch_command .= 'rspec'
    elseif isdirectory('test')
        let dispatch_command .= 'rake test'
    else
        echo 'Cannot run ruby tests: "spec" or "test" directories not found'
        return
    endif

    silent! exe dispatch_command
endfun
