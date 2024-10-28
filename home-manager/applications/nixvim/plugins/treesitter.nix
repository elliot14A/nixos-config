{
 programs.nixvim.plugins.treesitter = {
   enable = true;
   settings = {
     auto_install = false;
     ensure_installed = [
       "go"
       "rust"
       "toml"
       "json"
       "javascript"
       "typescript"
       "gomod"
       "gowork"
       "gosum"
     ];
     indent = {
       enable = true;
     };
     highlight = {
       additional_vim_regex_highlighting = true;
       enable = true;
     };
     incremental_selection = {
       enable = true;
       keymaps = {
         init_selection = false;
         node_decremental = "grm";
         node_incremental = "grn";
         scope_incremental = "grc";
       };
     };
     parser_install_dir = {
       __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
     };
     sync_install = false;
   };
 };
}
