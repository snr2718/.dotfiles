-- Adds indentation guides
return { 
  "lukas-reineke/indent-blankline.nvim", 
  main = "ibl", 
  opts = {},
  config = function ()
    require('ibl').setup()
  end
}
