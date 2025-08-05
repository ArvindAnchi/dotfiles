return {
    {
        "benlubas/molten-nvim",
        dependencies = { "image.nvim" },
        ft = { "python", "markdown", "quarto" },
        init = function()
            vim.g.molten_open_cmd = "firefox"
            vim.g.python3_host_prog = "~/.virtualenvs/neovim/bin/python3"

            vim.g.molten_auto_open_output = false
            vim.g.molten_image_location = "float"
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_border = { "", "━", "", "" }
            vim.g.molten_output_win_max_height = 12
            vim.g.molten_enter_output_behavior = "open_and_enter"
            vim.g.molten_virt_text_output = true
            vim.g.molten_use_border_highlights = true
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_wrap_output = true
            vim.g.molten_tick_rate = 142
        end,
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader><leader>R", "<Cmd>MoltenEvaluateVisual<CR>")
            vim.keymap.set("n", "<localleader>mi", function()
                local venv = os.getenv("VIRTUAL_ENV")
                if venv ~= nil then
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                end
                vim.cmd("QuartoActivate")
            end, { desc = "Initialize Molten for python3", silent = true, noremap = true })

            vim.api.nvim_create_autocmd("User", {
                pattern = "MoltenInitPost",
                callback = function()
                    -- quarto code runner mappings
                    local r = require("quarto.runner")
                    vim.keymap.set("n", "<localleader>rc", r.run_cell, { desc = "run cell", silent = true })
                    vim.keymap.set("n", "<localleader>ra", r.run_above, { desc = "run cell and above", silent = true })
                    vim.keymap.set("n", "<localleader>rA", r.run_all, { desc = "run all cells", silent = true })

                    -- setup some molten specific keybindings
                    vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
                        { desc = "evaluate operator", silent = true })
                    vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
                        { desc = "execute visual selection", silent = true })
                    vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",
                        { desc = "open output window", silent = true })

                    -- if we're in a python file, change the configuration a little
                    if vim.bo.filetype == "python" then
                        vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
                        vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
                    end
                end,
            })

            -- change the configuration when editing a python file
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "*.py",
                callback = function(e)
                    if string.match(e.file, ".otter.") then
                        return
                    end
                    if require("molten.status").initialized() == "Molten" then
                        vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
                        vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
                    end
                end,
            })

            -- Undo those config changes when we go back to a markdown or quarto file
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = { "*.qmd", "*.md", "*.ipynb" },
                callback = function()
                    if require("molten.status").initialized() == "Molten" then
                        vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", true)
                        vim.fn.MoltenUpdateOption("molten_virt_text_output", true)
                    end
                end,
            })
        end
    },
    {
        "GCBallesteros/jupytext.nvim",
        ft = { "ipynb" },
        lazy = false,
        opts = {
            style = "markdown",
            output_extension = "md",
            force_ft = "markdown",
        },
    },
    {
        "jmbuhr/otter.nvim",
        ft = { "markdown", "quarto" }
    },
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "nvim-lspconfig",
            "nvimtools/hydra.nvim",
            "jmbuhr/otter.nvim",
        },
        ft = { "quarto", "markdown" },
        config = function()
            local quarto = require("quarto")
            quarto.setup({
                lspFeatures = {
                    languages = { "python", },
                    chunks = "all",
                    diagnostics = { enabled = true, triggers = { "BufWritePost" }, },
                    completion = { enabled = true, },
                },
                keymap = {
                    hover = "H",
                    definition = "gd",
                    rename = "<leader>rn",
                    references = "gr",
                    format = "<leader>gf",
                },
                codeRunner = {
                    enabled = true,
                    ft_runners = { bash = "slime", },
                    default_method = "molten",
                },
            })

            vim.keymap.set("n", "<localleader>qp", quarto.quartoPreview,
                { desc = "Preview the Quarto document", silent = true, noremap = true })
            -- to create a cell in insert mode, I have the ` snippet
            vim.keymap.set("n", "<localleader>cc", "i`<c-j>", { desc = "Create a new code cell", silent = true })
            vim.keymap.set("n", "<localleader>cs", "i```\r\r```{}<left>",
                { desc = "Split code cell", silent = true, noremap = true })
        end,
    },
    {
        "benlubas/image-save.nvim",
        cmd = "SaveImage",
    },
    {
        "3rd/image.nvim",
        dependencies = { "https://github.com/leafo/magick" },
        ft = { "markdown" },
        config = function()
            local image = require("image")

            ---@diagnostic disable-next-line: missing-fields
            image.setup({
                backend = "kitty",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = false,
                        only_render_image_at_cursor = false,
                        filetypes = { "markdown", "quarto" }, -- markdown extensions (ie. quarto) can go here
                    },
                },
                max_width = 100,
                max_height = 8,
                max_height_window_percentage = math.huge,
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true,    -- toggles images when windows are overlapped
                editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "fidget", "" },
            })
        end,
    },
    {
        "3rd/diagram.nvim",
        dependencies = { "image.nvim" },
        enabled = false,
        opts = {}
    },
}
