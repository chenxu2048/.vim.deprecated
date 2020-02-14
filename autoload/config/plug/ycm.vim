let s:script_path = expand('<sfile>:p:h')
function! config#plug#ycm#init() abort
  " from mensu
  let g:ycm_global_ycm_extra_conf = s:script_path . '/ycm/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf = 1

  let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']

  let g:ycm_auto_trigger = 1
  let g:ycm_min_num_of_chars_for_completion = 2
  let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
  let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
  " 在注释输入中也能补全
  let g:ycm_complete_in_comments = 1
  "在字符串输入中也能补全
  let g:ycm_complete_in_strings = 1
  " 注释和字符串中的文字也会被收入补全
  let g:ycm_collect_identifiers_from_comments_and_strings = 0

  "will put icons in Vim's gutter on lines that have a diagnostic set.
  "Turning this off will also turn off the YcmErrorLine and YcmWarningLine
  "highlighting
  let g:ycm_enable_diagnostic_signs = 1
  let g:ycm_enable_diagnostic_highlighting = 1
  let g:ycm_always_populate_location_list = 1 "default 0
  let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
  let g:ycm_autoclose_preview_window_after_completion = 1

  let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
  let g:ycm_server_python_interpreter = '/usr/bin/python'
  let g:ycm_python_bin_path = '/usr/bin/python'

  let g:ycm_add_preview_to_completeopt = 0
  let g:ycm_show_diagnostics_ui = 0
  let g:ycm_server_log_level = 'info'
  let g:ycm_min_num_identifier_candidate_chars = 2
  let g:ycm_key_invoke_completion = '<M-C>'
  set completeopt=menu,menuone

  let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
  let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
endfunction
