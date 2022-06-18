set shortmess+=c
set shortmess-=F
set completeopt=menuone,noinsert,noselect


lua << EOF

local metals_config = require('metals').bare_config()
local coc = require('coq')
-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

metals_config.init_options.statusBarProvider = "on"
metals_config.settings.serverVersion = "0.11.6"
-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = coq.lsp_ensure_capabilities(capabilities)
-- require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Debug settings if you're using nvim-dap

metals_config.on_attach = function(client, bufnr)
  require('metals')
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

EOF





