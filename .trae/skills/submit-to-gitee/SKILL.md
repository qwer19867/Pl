---
name: "submit-to-gitee"
description: "Submits (commits and pushes) the current project to Gitee repo https://gitee.com/whalefox/yl2. Invoke when user asks to upload, commit, or push the project to Gitee."
---

# 提交项目到 Gitee

将当前项目提交并推送到 Gitee 仓库 `https://gitee.com/whalefox/yl2`。

## 适用场景

当用户要求将项目上传、提交或推送到 Gitee 时调用此 skill。

## 执行步骤

1. **检查 Git 仓库**：在当前工作目录执行 `git status`。
   - 如果不是 git 仓库（报错 `not a git repository`），执行 `git init` 初始化。

2. **配置 Git 用户信息**（如未配置）：
   - `git config user.name` 检查，若为空则执行 `git config user.name "whalefox"`
   - `git config user.email` 检查，若为空则执行 `git config user.email "whalefox@users.noreply.gitee.com"`

3. **添加文件**：执行 `git add .` 将所有更改加入暂存区。

4. **提交**：执行 `git commit -m "提交项目"`。
   - 如果没有可提交的更改（nothing to commit），跳过此步并继续。

5. **配置远程仓库**：
   - 执行 `git remote -v` 检查是否已有 `origin`。
   - 若无 origin，执行 `git remote add origin git@gitee.com:whalefox/yl2.git`
   - 若已有 origin 但 URL 不对，执行 `git remote set-url origin git@gitee.com:whalefox/yl2.git`
   - > 使用 SSH 地址 `git@gitee.com:whalefox/yl2.git`，需先在 Gitee 配置 SSH 公钥。

6. **推送**：
   - 首次推送：`git push -u origin master`（或 `git push -u origin main`，根据当前分支名）
   - 后续推送：`git push`

7. **验证**：执行 `git log --oneline -5` 确认提交成功。

## 注意事项

- 如遇权限问题，确认 Gitee 已添加 SSH 公钥（`~/.ssh/id_ed25519.pub`）。
- 分支名可能是 `master` 或 `main`，使用 `git branch` 查看当前分支。
- 所有命令使用 PowerShell 语法，路径含空格需用引号。
