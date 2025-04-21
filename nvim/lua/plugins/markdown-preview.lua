return  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" };
        vim.g.mkdp_port = 9999;
        vim.g.mkdp_echo_preview_url = 1;
    end,
    config = function ()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function ()
                vim.opt_local.wrap = false;
                vim.opt_local.textwidth = 0;
                vim.opt_local.formatoptions:remove({ "t" });
                vim.opt_local.colorcolumn = "96"
            end
        })
    end,
    ft = { "markdown" },
}

