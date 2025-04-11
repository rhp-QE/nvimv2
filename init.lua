if not vim.g.vscode then
	require("core")
end

-- 光标粒子效果模式
vim.g.neovide_cursor_vfx_mode = "" -- 可设置为 "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe", 或空字符串 ""

-- 光标轨迹大小
vim.g.neovide_cursor_trail_size = 1.5

-- 行间距
vim.g.neovide_line_height = 10