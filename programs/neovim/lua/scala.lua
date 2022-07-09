require('keys')

local metals_config = require('metals').bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.init_options.statusBarProvider = "on"
metals_config.settings.serverVersion = "0.11.7"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set

-- local capabilities = require('coq').lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



metals_config.capabilities = capabilities


metals_config.on_attach = function(_, _)
  require('metals')
  require('lsp_signature').on_attach()
  require('lsp-status').on_attach()
end


vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require('metals').initialize_or_attach(metals_config)
  end,
  group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
