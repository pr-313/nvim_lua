local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
    return
end

harpoon.setup({
    global_settings = {
        save_on_toggle = true,
        save_on_change = false,
        enter_on_sendcmd = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = true
    },
    menu = {
        height = 20,
        width = 80
    }
})

--Harpoon
function Harpoon_file_name(idx)
    local name
    name = require("harpoon.mark").get_marked_file_name(idx)
    if name ~= nil then
        return name
    else
        return ""
    end
end

function Harpoon_refresh_names()
    require("which-key").register(
        {
            ["<leader>h"] = {
                name = "+Harpoon Files",
                ["1"] = { ":lua require(\"harpoon.ui\").nav_file(1)<cr>:echom \"File in Harpoon 1\"<CR>",
                    Harpoon_file_name(1) },
                ["2"] = { ":lua require(\"harpoon.ui\").nav_file(2)<cr>:echom \"File in Harpoon 2\"<CR>",
                    Harpoon_file_name(2) },
                ["3"] = { ":lua require(\"harpoon.ui\").nav_file(3)<cr>:echom \"File in Harpoon 3\"<CR>",
                    Harpoon_file_name(3) },
                ["4"] = { ":lua require(\"harpoon.ui\").nav_file(4)<cr>:echom \"File in Harpoon 4\"<CR>",
                    Harpoon_file_name(4) },
                ["5"] = { ":lua require(\"harpoon.ui\").nav_file(5)<cr>:echom \"File in Harpoon 5\"<CR>",
                    Harpoon_file_name(5) },
                ["6"] = { ":lua require(\"harpoon.ui\").nav_file(6)<cr>:echom \"File in Harpoon 6\"<CR>",
                    Harpoon_file_name(6) },
                ["7"] = { ":lua require(\"harpoon.ui\").nav_file(7)<cr>:echom \"File in Harpoon 7\"<CR>",
                    Harpoon_file_name(7) },
                ["8"] = { ":lua require(\"harpoon.ui\").nav_file(8)<cr>:echom \"File in Harpoon 8\"<CR>",
                    Harpoon_file_name(8) },
                ["9"] = { ":lua require(\"harpoon.ui\").nav_file(9)<cr>:echom \"File in Harpoon 9\"<CR>",
                    Harpoon_file_name(9) },
                ["r"] = { ":lua Harpoon_refresh_names()<cr>:echom \"Harpoon Names Refreshed\"<CR>",
                    "Refresh Harpoon Names" },
                ["a"] = { ":lua require(\"harpoon.mark\").add_file()<cr>:echom \"File added to Harpoon\"<CR>",
                    "Add to Harpoon Menu" },
                ["m"] = { ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", "Open Harpoon Menu" }
            }
        })
end

Harpoon_refresh_names()
