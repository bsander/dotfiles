-- Git commit message AI generation
-- Automatically generates commit message suggestions based on staged changes

local function get_staged_diff()
  local handle = io.popen('git diff --staged --name-status 2>/dev/null')
  if not handle then
    return nil
  end
  
  local result = handle:read('*a')
  handle:close()
  
  if result == '' then
    return nil
  end
  
  return result:gsub('\n$', '')
end

local function get_staged_files_summary()
  local handle = io.popen('git diff --staged --numstat 2>/dev/null')
  if not handle then
    return nil
  end
  
  local result = handle:read('*a')
  handle:close()
  
  if result == '' then
    return nil
  end
  
  return result:gsub('\n$', '')
end

local function generate_commit_message()
  local staged_diff = get_staged_diff()
  
  if not staged_diff then
    vim.notify('No staged changes found', vim.log.levels.WARN)
    return
  end
  
  vim.notify('Generating commit message with Claude...', vim.log.levels.INFO)
  
  -- Get the actual diff content for better analysis
  local handle = io.popen('git diff --staged 2>/dev/null')
  local full_diff = ""
  if handle then
    full_diff = handle:read('*a')
    handle:close()
  end
  
  -- Create a temporary file with the diff
  local temp_file = vim.fn.tempname()
  local file = io.open(temp_file, 'w')
  if file then
    file:write("Files changed:\n")
    file:write(staged_diff)
    file:write("\n\nDiff:\n")
    file:write(full_diff:sub(1, 8000)) -- Limit diff size
    file:close()
  end
  
  -- Prepare the Claude prompt
  local prompt = string.format([[
Analyze the git changes and generate a concise commit message in imperative mood.

Requirements:
- Use imperative mood (e.g., "Add", "Fix", "Update", not "Added", "Fixed", "Updated")  
- Keep it under 50 characters for the subject line
- Be specific about what changed
- Follow conventional commit style when appropriate
- Only respond with the commit message, nothing else

Changes:
%s

Diff preview:
%s]], staged_diff, full_diff:sub(1, 4000))
  
  -- Write prompt to temp file for claude command
  local prompt_file = vim.fn.tempname()
  file = io.open(prompt_file, 'w')
  if file then
    file:write(prompt)
    file:close()
  end
  
  -- Call Claude via command line (assuming claude CLI is available)
  local claude_cmd = string.format('claude < "%s" 2>/dev/null', prompt_file)
  handle = io.popen(claude_cmd)
  
  local message = ""
  if handle then
    local result = handle:read('*a')
    local exit_code = handle:close()
    
    if exit_code and result and result ~= '' then
      -- Clean up the response - take first line and trim
      message = result:match('^([^\n]+)') or result
      message = message:gsub('^%s+', ''):gsub('%s+$', '') -- trim whitespace
      message = message:gsub('^"', ''):gsub('"$', '') -- remove quotes if present
    else
      -- Fallback to a simple message if Claude fails
      local files = vim.split(staged_diff, '\n')
      if #files == 1 then
        local status, file = files[1]:match('^([AMDRC])\t(.+)$')
        local filename = vim.fn.fnamemodify(file or '', ':t')
        if status == 'A' then
          message = "Add " .. filename
        elseif status == 'M' then
          message = "Update " .. filename
        elseif status == 'D' then
          message = "Remove " .. filename
        else
          message = "Update files"
        end
      else
        message = "Update " .. #files .. " files"
      end
      vim.notify('Claude unavailable, using fallback message', vim.log.levels.WARN)
    end
  else
    vim.notify('Failed to call Claude', vim.log.levels.ERROR)
    return
  end
  
  -- Clean up temp files
  vim.fn.delete(temp_file)
  vim.fn.delete(prompt_file)
  
  if message and message ~= '' then
    -- Insert the message at the beginning of the buffer
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {message})
    
    -- Position cursor at end of first line
    vim.api.nvim_win_set_cursor(0, {1, #message})
    
    vim.notify('Generated commit message: ' .. message, vim.log.levels.INFO)
  else
    vim.notify('Failed to generate commit message', vim.log.levels.ERROR)
  end
end

-- Set up the keybinding for AI commit message generation
vim.keymap.set('n', '<leader>gm', generate_commit_message, {
  buffer = true,
  desc = '[G]it [M]essage - Generate AI commit message'
})

-- Auto-generate message when opening empty commit message buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  buffer = 0,
  callback = function()
    -- Check if buffer is empty or only contains comments
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local has_content = false
    
    for _, line in ipairs(lines) do
      if line ~= '' and not line:match('^#') then
        has_content = true
        break
      end
    end
    
    if not has_content then
      -- Small delay to ensure git information is available
      vim.defer_fn(generate_commit_message, 100)
    end
  end,
})

-- Additional helpful settings for commit messages
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = '50,72'
vim.opt_local.spell = true
vim.opt_local.wrap = true