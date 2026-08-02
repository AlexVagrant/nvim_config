-- 注册 LSP server 配置中引用但 nvim 未识别的文件类型
-- 解决 :checkhealth vim.lsp 的 "Unknown filetype" 警告
-- 来源: clangd (c.doxygen/cpp.doxygen 为手动设置场景, 不注册)、
--       tailwindcss/html (模板文件扩展名)、yamlls (docker-compose/gitlab-ci/helm)
--
-- 说明:
-- - 扩展名映射让 nvim 能识别这些文件, 使 tailwindcss/html LSP 可以 attach
-- - 点号 filetype (如 yaml.docker-compose) 会回退到基础类型 yaml 的高亮/ftplugin
-- - erb/hbs 在 nvim 中已有映射 (eruby/handlebars), 通过修改 LSP filetypes 处理 (见 lsp.lua)
vim.filetype.add({
  extension = {
    mdx = 'mdx',
    ejs = 'ejs',
    njk = 'njk',
    nunjucks = 'nunjucks',
    slim = 'slim',
    edge = 'edge',
    jade = 'jade',
    leaf = 'leaf',
    gohtml = 'gohtml',
    gohtmltmpl = 'gohtmltmpl',
    postcss = 'postcss',
    sugarss = 'sugarss',
  },
  filename = {
    ['docker-compose.yml'] = 'yaml.docker-compose',
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['.gitlab-ci.yml'] = 'yaml.gitlab',
    ['values.yaml'] = 'yaml.helm-values',
  },
})
