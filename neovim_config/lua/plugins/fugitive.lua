return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local fugitive_cmd = vim.api.nvim_create_augroup("fugitive_cmd", {})

        local autocmd = vim.api.nvim_create_autocmd
        -- Define a new autocmd that will be triggered after the buffer is displayed
        autocmd("BufWinEnter", {
            group = fugitive_cmd,
            pattern = "*",
            callback = function()
                -- end function if the buffer scoped option (vim.bo) filetype is not fugitive
                -- (i.e. if not in the fugutive buffer)
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    print("Executing PUSH")
                    vim.cmd.Git('push')
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })


        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end
}
