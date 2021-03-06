" macros for ruby-based usage in vim

" for class, module, and method definition
function RubyDefBlock(block, name)
  exe 'normal! i' . a:block . ' ' . a:name . "\<cr>\<cr>end\<esc>ki#\<esc>k3==jwcw"
endfunction

" for blocks that require a "do"
function RubyDoBlock(block, name)
  exe 'normal! i' . a:block . ' ' . a:name . " do\<cr>\<cr>end\<esc>ki#\<esc>k3==jwcw"
endfunction

function RubyBlock(block)
  if a:block != "def-init" && a:block != "subject" && a:block != "file-write"
    let name = input('Enter ' . a:block . ' name: ')
  endif
  if a:block == "class"
    let method_name = "initialize"
    exe "call RubyDefBlock('" . a:block . "', '" . name ."')"
    exe "call RubyDefBlock('def', '" . method_name ."')"
  elseif a:block == "module"
    let method_name = input('Enter a method name for the module: ')
    exe "call RubyDefBlock('" . a:block . "', '" . name ."')"
    exe "call RubyDefBlock('def', '" . method_name ."')"
  elseif a:block == "rspec"
    let name = "'". name . "'"
    exe "call RubyDoBlock('RSpec.describe', \"" . name . "\")"
  elseif a:block == "rspec-model"
    exe "call RubyDoBlock('RSpec.describe', '" . name . "')"
  elseif a:block == "rspec-file"
    let rails_app = input('Is this a Rails app? (y/n)')
    let name = "'". name . "'"
    if rails_app == "y"
      exe "normal! irequire 'rails_helper'\<cr>\<cr>"
    else
      exe "normal! irequire 'spec_helper'\<cr>\<cr>"
    endif
    exe "call RubyDoBlock('RSpec.describe', \"" . name . "\")"
    exe "call RubyDoBlock('context', \"'context'\")"
    exe "call RubyDoBlock('it', \"'test'\")"
  elseif a:block == "context"
    let name = "'". name . "'"
    let it_name = input('Enter a string for the first test: ')
    let it_name = "'". it_name . "'"
    exe "call RubyDoBlock('context', \"" . name . "\")"
    exe "call RubyDoBlock('it', \"" . it_name . "\")"
  elseif a:block == "it" || a:block == "describe"
    let name = "'". name . "'"
    exe "call RubyDoBlock('". a:block . "', \"" . name . "\")"
  elseif a:block == "let"
    let value = input('Enter the basic value: ')
    exe "normal! ilet(:" . name . ")\<space>{\<space>" . value . "\<space>}\<esc>=="
  elseif a:block == "subject"
    exe "normal! isubject\<space>{\<space>described_class\<space>}\<esc>=="
  elseif a:block == "def-init"
    exe "call RubyDefBlock('def', 'initialize')"
  elseif a:block == "file-write"
    let file_name = input('Enter the filename to write to: ')
    let var_name = input('Enter the variable name you want to capture: ')
    exe "normal! iFile.open('" . file_name . "', 'w+')\<space>{\<space>|file|\<space>file.write\<space>" . var_name . "\<space>}\<esc>=="
  else
    exe "call RubyDefBlock('" . a:block . "', '" . name ."')"
  endif
endfunction

let ruby_blocks = {
      \'cls' :  'class',
      \'mod' :  'module',
      \'de'  :  'def',
      \'di'  :  'def-init',
      \'rsp' :  'rspec',
      \'rsm' :  'rspec-model',
      \'frs' :  'rspec-file',
      \'dsc' :  'describe',
      \'it'  :  'it',
      \'con' :  'context',
      \'let' :  'let',
      \'sub' :  'subject',
      \'file':  'file-write'
      \}

for [shortcut, block_type] in items(ruby_blocks)
  exe "nmap \<leader>" . shortcut . " \<esc>:call RubyBlock('" . block_type . "')\<cr>"
  exe "vmap \<leader>" . shortcut . " \<esc>:call RubyBlock('" . block_type . "')\<cr>"
  exe "imap \<leader>" . shortcut . " \<esc>:call RubyBlock('" . block_type . "')\<cr>"
endfor

" shortcut for binding.pry
nmap <leader>pry ibinding.pry<esc>==^
vmap <leader>pry ibinding.pry<esc>==^
imap <leader>pry binding.pry<esc>==^

" shortcut for byebug
nmap <leader>bye ibyebug<esc>==^
vmap <leader>bye ibyebug<esc>==^
imap <leader>bye byebug<esc>==^

" shortcut for frozen_string_literal 
nmap <leader>frz i# frozen_string_literal: true<esc>o<esc>x
vmap <leader>frz i# frozen_string_literal: true<esc>o<esc>x
imap <leader>frz # frozen_string_literal: true<esc>o<esc>x
nmap <leader>fsl i# frozen_string_literal: true<esc>o<esc>x
vmap <leader>fsl i# frozen_string_literal: true<esc>o<esc>x
imap <leader>fsl # frozen_string_literal: true<esc>o<esc>x
