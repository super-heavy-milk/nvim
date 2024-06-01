# Plugin Configs

You're probably thinking:

> _Why have the configuration separate from the plugin specs?_

Putting plugin configuration in a separate file makes it quick to iterate with the following workflow:

1. Adjust some settings.
1. Execute the file (see below).
1. See the results of your adjustment - without having to exit/restart vim.

How to execute the file:

```lua
-- in ftplugin/lua.lua
vim.keymap.set('n', '<leader>x', '<cmd>w | source %<CR>', { desc = 'Execute the current file' })
```
