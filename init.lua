if not vim.g.vscode then
	require("core")
end

-- 光标粒子效果模式
vim.g.neovide_cursor_vfx_mode = "" -- 可设置为 "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe", 或空字符串 ""

-- 光标轨迹大小
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_particle_opacity = 0.1

-- init.lua
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor"
