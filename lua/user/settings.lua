-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

-- 插入模式下，按 `jk` 退出到普通模式
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- 主题
settings["colorscheme"] = "vscode"

return settings
