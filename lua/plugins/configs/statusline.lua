local theme = require("theme.config.theme")
local gl = require("galaxyline")
local colors = theme.colors
local gls = gl.section

local condition = require("galaxyline.condition")

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gl.short_line_list = { "NvimTree" }

gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                ["^V"] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE",
                t = "TERMINAL",
                s = "SNIPPET"
            }

            vim.api.nvim_command("hi GalaxyViMode guibg=" .. colors.funnyGreen .. " guifg=" .. colors.bg)

            local alias_mode = alias[vim.fn.mode()]
            if alias_mode == nil then
                alias_mode = vim.fn.mode()
            end

            return '  ' .. alias_mode .. ' '
        end,
        separator = " ",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { "StatusLineSeparator", "StatusLineNC" }
    }
}

gls.left[2] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        separator = " ",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bgAlt2 }
    }
}

gls.left[3] = {
    FileName = {
        provider = "FileName",
        condition = condition.buffer_not_empty,
        separator = " ",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { colors.cyan, colors.bgAlt2 }
    }
}

gls.left[4] = {
    RightArrow = {
        provider = function()
            return ""
        end,
        highlight = { colors.bgAlt2, colors.bgAlt }
    }
}

gls.left[5] = {
    Separator = {
        provider = function()
            return ""
        end,
        highlight = { colors.bgAlt, colors.bgAlt }
    }
}

gls.right[1] = {
    LeftArrow = {
        provider = function()
            return ""
        end,
        highlight = { colors.bgAlt2, colors.bgAlt }
    }
}

gls.right[2] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.green, colors.bgAlt2 }
    }
}

gls.right[3] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.yellow, colors.bgAlt2 }
    }
}

gls.right[4] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.red, colors.bgAlt2 }
    }
}

gls.right[5] = {
    GitIcon = {
        provider = function()
			return ""
		end,
        condition = require("galaxyline.condition").check_git_workspace,
        separator = " ",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { colors.magenta, colors.bgAlt2 }
    }
}

gls.right[6] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        separator = " ",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { colors.magenta, colors.bgAlt2 }
    }
}

gls.right[7] = {
    RightArrow = {
        provider = function()
            return ""
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        separator = "",
        separator_highlight = { colors.bgAlt2, colors.bgAlt2 },
        highlight = { colors.bgAlt2, colors.bgAlt }
    }
}

gls.right[8] = {
    LinePercent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { colors.fg, colors.bgAlt }
    }
}
