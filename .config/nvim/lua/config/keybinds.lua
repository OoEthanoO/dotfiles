vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<leader>rr", function()
    local filename = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r")
    if vim.bo.filetype == "cpp" then
        vim.cmd("w")
        local compile_cmd = string.format("g++ -g '%s' -o '%s'", filename, output)
        local compile_result = vim.fn.system(compile_cmd)
        if vim.v.shell_error ~= 0 then
            vim.notify("Compilation failed:\n" .. compile_result, vim.log.levels.ERROR)
            return
        end
        vim.cmd("split | terminal " .. output)
    else
        vim.notify("Not a C++ file", vim.log.levels.WARN)
    end
end, { desc = "Compile & run current C++ file in terminal" })

vim.keymap.set("n", "<leader>rb", function()
    local filename = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r")
    if vim.bo.filetype == "cpp" then
        vim.cmd("w")
        local compile_cmd = string.format("g++ -g '%s' -o '%s'", filename, output)
        local compile_result = vim.fn.system(compile_cmd)
        if vim.v.shell_error ~= 0 then
            vim.notify("Compilation failed:\n" .. compile_result, vim.log.levels.ERROR)
            return
        end
        vim.notify("Build successful: " .. output, vim.log.levels.INFO)
    else
        vim.notify("Not a C++ file", vim.log.levels.WARN)
    end
end, { desc = "Build current C++ file" })

vim.keymap.set("n", "<leader>q", function()
    vim.diagnostic.setloclist({ open = true })
end, { desc = "Show file diagnostics in location list" })