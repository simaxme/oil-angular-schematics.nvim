local M = {}

M.schematics = require('oil-angular-schematics.schematics')

-- will generate a schematic in the current oil folder by asking the user for input details.
function M.create_angular_schematic()
  local folder = require('oil').get_current_dir()

  -- Ask which schematic should be used.
  vim.ui.select(M.schematics, {
    prompt = 'Select which component you would like to create:'
  }, function(choice)
    -- ask for the name of the schematic
    vim.ui.input({ prompt = "Name of new " .. choice .. ":" }, function(input)
      local command = "cd '" .. folder .. "' && " .. "ng g " .. choice .. " " .. input

      local response = vim.system({ "npx", "-c", command },
        { text = true }):wait()

      if response.code ~= 0 then
        vim.notify("An error occured while generating the angular component: " .. response.stdout, vim.log.levels.ERROR)
      else
        vim.notify(response.stdout)
      end

      -- update oil
      require('oil.actions').refresh.callback()
    end)
  end)
end

return M
