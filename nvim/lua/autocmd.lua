-- vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]
