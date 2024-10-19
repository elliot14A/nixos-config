{
    programs.nixvim = {
        plugins.dressing = {
            enable = true;
            input = {
               defaultPrompt = "✅"
            };
            extraConfigLua = ''
                -- Override vim.ui.input and vim.ui.select
                local setup_dressing = function()
                  local function try_require(name)
                    local ok, plugin = pcall(require, name)
                    if ok then return plugin end
                    return nil
                  end
                  local dressing = try_require("dressing")
                  if dressing then
                    vim.ui.input = dressing.input
                    vim.ui.select = dressing.select
                  end
                end
                setup_dressing()
              '';
        };
    };
}
