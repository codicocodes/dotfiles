vim.g.lightline = { 
  enable={
    tabline=0,
  },
  colorscheme= 'edge',
  active= {
    left= { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } ,
  },
  component_function = {
    gitbranch = 'gitbranch#name'
  },
}
