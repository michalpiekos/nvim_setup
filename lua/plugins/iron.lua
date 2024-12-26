return {
  'hkupty/iron.nvim',
  config = function()
    require('iron.core').setup {
      config = {
        repl_definition = {
          python = {
            command = {"ipython", "--matplotlib=qt"}
          }
        },
        repl_open_cmd = 'vertical botright 80 split'
      },
      keymaps = {
        send_motion = "<leader>ts",
        visual_send = "<leader>ts",
      },
    }
  end,
}

