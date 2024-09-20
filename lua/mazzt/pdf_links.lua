local M = {}

function M.open_pdf_link()
    local line = vim.fn.getline(".")
    local col = vim.fn.col(".") - 1 -- Adjust for 0-indexing

    -- Regex pattern to match Markdown PDF links
    local link_pattern = "!%[%w+%]%(([%w%p%s-]+%.pdf)%)"
    local link_start, link_end = string.find(line, link_pattern)

    if link_start and col >= link_start and col <= link_end then
        local pdf_link = string.match(line, link_pattern)

        -- Construct the full path based on your structure
        local pdf_path = "pdfs/recitations/" .. pdf_link

        -- Check if the file exists
        if vim.fn.filereadable(pdf_path) == 1 then
            local command = string.format("!zathura '%s'", pdf_path)
            vim.cmd(command)
        else
            print("File not found: " .. pdf_path)
        end
    end
end


return M

