-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

-- 插入模式下，按 `jk` 退出到普通模式
vim.keymap.set('i', 'fd', '<ESC>', { noremap = true, silent = true })

-- 主题
settings["colorscheme"] = "vscode"

vim.g.neovide_transparency = 0.8  -- 设置窗口整体透明度

vim.opt.autoread = true  -- 启用自动重新加载

return settings
