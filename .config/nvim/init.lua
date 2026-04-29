require('config.options')
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.defer_fn(function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end, 10)

function source_matugen()
  -- Update this with the location of your output file
  local matugen_path = os.getenv("HOME") .. "/.config/nvim/colors.lua"  -- dofile doesn't expand $HOME or ~

  local file, err = io.open(matugen_path, "r")
  -- If the matugen file does not exist (yet or at all), we must initialize a color scheme ourselves
  if err ~= nil then
    -- Some placeholder theme, this will be overwritten once matugen kicks in
    vim.cmd('colorscheme base16-catppuccin-mocha')

    -- Optionally print something to the user
    vim.print("A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!")
  else
    dofile(matugen_path)
    io.close(file)
  end
end

local function source_colors()
  local json_path = vim.fn.expand("~/.cache/skwd-wall/last-wallpaper.json")

  local ok, content = pcall(vim.fn.readfile, json_path)
  if ok and content then
    local decoded = vim.fn.json_decode(table.concat(content, "\n"))

    local wall = decoded.path or ""
    local name = vim.fn.fnamemodify(wall, ":t")

    if name:match("rezero") then
      vim.cmd.colorscheme("miasma")
    elseif name:match("pink") then
      vim.cmd.colorscheme("rose-pine-main")
    elseif name:match("anime") or name:match("car") or name:match("japan") or name:match("tokyonight") or name:match("satella") or name:match("moewalls") then
      vim.cmd.colorscheme("catppuccin-macchiato")
    elseif name:match("Everest") then
      vim.cmd.colorscheme("nord")
    else
      source_matugen()
    end
  else
    source_matugen()
  end
end

source_colors()
