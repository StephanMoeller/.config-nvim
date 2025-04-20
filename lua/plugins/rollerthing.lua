return {
    "StephanMoeller/rollerthing",
    dir = "/home/stephan/Projects/rollerthing",
    dev = true,
    config = function()
      roll = require("rollerthing")
      roll.setup();
      vim.keymap.set('n', '<leader>tt', ":DoTheThing<CR>", {})
    end
}
