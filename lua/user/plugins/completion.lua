local completion = {}
local use_copilot = require("core.settings").use_copilot

completion["github/copilot.vim"] = {
	lazy = true,
}

completion["Mofiqul/vscode.nvim"] = {
	lazy = false,
	config = function()
        require("vscode").setup({
            style = "dark", 
            --transparent = true, -- 关闭透明模式
            italic_comments = true, -- 注释斜体
        })

        -- 自定义背景色（可选覆盖）
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "#262626" })
    end
}

completion["Pocco81/auto-save.nvim"] = {
	lazy = false,
	config = function()
        require("auto-save").setup({
            enable = true,
            debounce_delay = 0,
            trigger_events = { "TextChanged" }
        })
    end
}

return completion
