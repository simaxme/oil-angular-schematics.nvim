# oil-angular-schematics.nvim
A simple plugin that allows the creation of angular schematics inside your oil window.

## Installing the plugin
Add this plugin to your favorite package manager, e.g. in lazy.nvim:
```lua
{
    "simaxme/oil-angular-schematics.nvim",

    version = "*" -- for stable releases
}
```

## How to use this plugin

In your oil configuration, simply add a keymap to create the schematic:
```lua
require("oil").setup({
    -- ...

    keymaps = {
        -- ...

        ["<Leader>ng"] = {
            mode = "n",
            callback = function()
                require("oil-angular-schematics").create_angular_schematic()
            end
        }

        -- ...
    }

    -- ...
})
```

Now, each time you press `<Leader>ng`, you will be asked which schematic should be created.
