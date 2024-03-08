return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  config = function()
    require('bqf').setup({
      preview = {
        win_height = 50,
        win_vheight = 50
      }
    })
  end
}
