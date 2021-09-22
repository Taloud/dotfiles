set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

:lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

requre'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach, capabilities = capabilities }
require'lspconfig'.html.setup{filetypes = { "html", "twig" }, on_attach=require'completion'.on_attach, capabilities = capabilities }
require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach, init_options = {licenceKey = 'XXXXXXXXXXX'} }
EOF
