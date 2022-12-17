require('dap-go').setup()

local dap = require('dap')

dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {'~/code/vscode-go/dist/debugAdapter.js'};
}

dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    -- NOTE: LOCAL PATH WARNING
    dlvToolPath = "./Users/codico/code/delve/cmd/dlv" -- vim.fn.exepath('dlv')  -- Adjust to where delve is installed
  },
}

require'dapui'.setup()

-- NOTE: LOCAL PATH WARNING
require'dap-python'.setup('~/.venv/debugpy/bin/python')

-- keybindings
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Success", linehl = "", numhl = "" })
