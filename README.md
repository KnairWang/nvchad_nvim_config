- <https://github.com/NvChad/NvChad/tree/v2.5>
- <https://github.com/NvChad/ui/tree/v2.5>

- <https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt>

- <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>

- <https://github.com/nvim-tree/nvim-tree.lua>

## Issues

- rust cannot fold
- rust diagnostics first show must be triggered by saving file
- diagnostics always show last one but now the highest priority one

## TODO

- use NERDTree?
- add hooks (autocmd)?

    ```
    function M.setup()
        local group = vim.api.nvim_create_augroup("trouble.main", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
            group = group,
            callback = function()
                local win = vim.api.nvim_get_current_win()
                local buf = vim.api.nvim_win_get_buf(win)
                if M._valid(win, buf) then
                    M.set(M._info(win))
                end
            end,
        })
        M.set(M._find())
    end
    ```
