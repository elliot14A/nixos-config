{
  programs.nixvim.plugins.lspconfig.nixd.setup = {
    cmd = {"nixd"};
    settings = {
      formatting = { "alejandra" };
    };
  };
}
