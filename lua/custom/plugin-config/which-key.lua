-- document existing key chains
require('which-key').register {
    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = '[R]e-<action>', _ = 'which_key_ignore' },
    ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
    ['<leader>l'] = { name = '[L]ocallist', _ = 'which_key_ignore' },
    ['<leader>p'] = { name = '[P]review', _ = 'which_key_ignore' },
}
