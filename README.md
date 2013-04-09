vim-testrunner
==============

Runs Ruby/RoR tests or specs.


Installation
------------

Place in *~/.vim/plugin/testrunner.vim* or in case of Pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/szw/vim-testrunner.git


About
-----

TestRunner is a plugin for easy running Ruby/Rails test/specs. It requires
[Vim-Dispatch](https://github.com/tpope/vim-dispatch) plugin by Tim Pope.  It is very useful with
its default mapping to `<F9>` key.


Usage
-----

TestRunner has only one command:

    :RunTests

If the file in active window is a test or spec, only that file will considered to execution. However
this can be altered with the bang. The banged version will force to run all tests despite of the
current file:

    :RunTests!


<div id="configuration"></div>
Configuration
-------------

Here are some plugin options:


* `testrunner_set_default_mapping`

    Whether TestRunner should set default mappings or not:

        let g:testrunner_set_default_mapping = 1


* `testrunner_set_mapping_with_bang`

    Whether TestRunner should set default mappings with banged version or not:

        let g:testrunner_set_mapping_with_bang = 0


* `testrunner_default_mapping_key`

    The default mappings key:

        let g:testrunner_default_mapping_key = '<F9>'


Author and License
------------------

TestRunner was written by Szymon Wrozynski and
[Contributors](https://github.com/szw/vim-testrunner/commits/master). It is licensed under the same
terms as Vim itself.

Copyright &copy; 2013 Szymon Wrozynski. See `:help license`
