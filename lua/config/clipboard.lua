-- WSL <-> Windows clipboard using win32yank
local function is_wsl()
  return vim.fn.has("wsl") == 1
end

if is_wsl() then
  -- Try to locate win32yank.exe in common places
  local win32yank = vim.fn.exepath("win32yank.exe")
  if win32yank == "" then
    local candidates = {
      "/mnt/c/Windows/System32/win32yank.exe",
      "/mnt/c/Windows/win32yank.exe",
      "/mnt/c/Program Files/win32yank/win32yank.exe",
    }
    for _, p in ipairs(candidates) do
      if vim.fn.filereadable(p) == 1 then
        win32yank = p
        break
      end
    end
  end

  if win32yank ~= "" then
    vim.opt.clipboard = "unnamedplus"

    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = function(lines, _)
          vim.fn.system(win32yank .. " -i --crlf", table.concat(lines, "\n"))
        end,
        ["*"] = function(lines, _)
          vim.fn.system(win32yank .. " -i --crlf", table.concat(lines, "\n"))
        end,
      },
      paste = {
        ["+"] = function()
          local output = vim.fn.system(win32yank .. " -o --lf")
          return vim.split(output, "\n", { plain = true })
        end,
        ["*"] = function()
          local output = vim.fn.system(win32yank .. " -o --lf")
          return vim.split(output, "\n", { plain = true })
        end,
      },
      cache_enabled = 0,
    }
  else
    vim.notify("win32yank.exe not found in WSL. Clipboard integration disabled.", vim.log.levels.WARN)
  end
end
