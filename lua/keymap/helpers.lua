_G._command_panel = function()
	require("telescope.builtin").keymaps({
		lhs_filter = function(lhs)
			return not string.find(lhs, "Þ")
		end,
	})
end

_G._flash_esc_or_noh = function()
	local flash_active, state = pcall(function()
		return require("flash.plugins.char").state
	end)
	if flash_active and state then
		state:hide()
	else
		pcall(vim.cmd.noh)
	end
end

_G._telescope_collections = function(picker_type)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values
	local finder = require("telescope.finders")
	local pickers = require("telescope.pickers")
	picker_type = picker_type or {}

	local collections = vim.tbl_keys(require("search.tabs").collections)
	pickers
		.new(picker_type, {
			prompt_title = "Telescope Collections",
			finder = finder.new_table({ results = collections }),
			sorter = conf.generic_sorter(picker_type),
			attach_mappings = function(bufnr)
				actions.select_default:replace(function()
					actions.close(bufnr)
					local selection = action_state.get_selected_entry()
					require("search").open({ collection = selection[1] })
				end)

				return true
			end,
		})
		:find()
end

_G._toggle_inlayhint = function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled()

	vim.lsp.inlay_hint.enable(not is_enabled)
	vim.notify(
		(is_enabled and "Inlay hint disabled successfully" or "Inlay hint enabled successfully"),
		vim.log.levels.INFO,
		{ title = "LSP Inlay Hint" }
	)
end

local _vt_enabled = require("core.settings").diagnostics_virtual_text
_G._toggle_virtualtext = function()
	if vim.diagnostic.is_enabled() then
		_vt_enabled = not _vt_enabled
		vim.diagnostic[_vt_enabled and "show" or "hide"]()
		vim.notify(
			(_vt_enabled and "Virtual text is now displayed" or "Virtual text is now hidden"),
			vim.log.levels.INFO,
			{ title = "LSP Diagnostic" }
		)
	end
end

local _lazygit = nil
_G._toggle_lazygit = function()
	if vim.fn.executable("lazygit") == 1 then
		if not _lazygit then
			_lazygit = require("toggleterm.terminal").Terminal:new({
				cmd = "lazygit",
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_lazygit:toggle()
	else
		vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end

local _tmux_term = nil
_G._toggle_tmux = function()
  if vim.fn.executable("tmux") == 1 then
    if not _tmux_term then
      _tmux_term = require("toggleterm.terminal").Terminal:new({
        cmd = "tmux new-session -A -s nvim_tmux",  -- 复用名为 nvim_tmux 的会话
        direction = "float",                       -- 浮动窗口
        close_on_exit = false,                     -- 保持窗口（tmux 分离后不关闭）
        hidden = true,                             -- 初始隐藏
        float_opts = {
          border = "curved",                      -- 边框样式
          width = 200,
          height = 40
        },
        on_open = function(term)
          vim.cmd("startinsert!")                  -- 自动进入插入模式
        end
      })
    end
    _tmux_term:toggle()  -- 切换 tmux 终端
  else
    vim.notify("Command [tmux] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
  end
end
