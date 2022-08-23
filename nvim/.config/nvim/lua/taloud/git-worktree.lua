local ok, Worktree = pcall(require, "git-worktree")
if not ok then
  return
end

vim.notify = require("notify")

local function is_figaro(path)
    local name = vim.cmd(":silent !echo /home/taloud/work/fff.git/$(basename $(pwd)")
    local found = path:find(name)
    return type(found) == "number" and found > 0
end

Worktree.on_tree_change(function(op, metadata)
  print(metadata)
  if is_figaro(metadata.path) then
    if op == Worktree.Operations.Switch then
        os.execute("inotifywait.sh " .. metadata.path .. "/ > /dev/null 2>&1 &" )
        vim.notify("sucessfully switch to " .. metadata.path, "info")
    end
    if op == Worktree.Operations.Create then
        vim.notify("sucessfully created branch " .. metadata.branch, "info")
    end
    if op == Worktree.Operations.Delete then
        vim.notify("sucessfully deleted branch " .. metadata.path, "info")
    end
  end
end)

