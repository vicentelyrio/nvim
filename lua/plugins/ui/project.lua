return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup({
      manual_mode = false,
      detection_methods = { 'pattern' },
      patterns = { '.git', 'package.json', 'yarn.lock' },
      on_attach = function()
        if vim.fn.getcwd() ~= vim.fn.expand('%:p:h') then
          vim.cmd('silent! cd ' .. vim.fn.getcwd())
        end
      end
    })
  end
}
