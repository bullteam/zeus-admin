### 从官方仓库 fork 代码

1. 浏览器访问 https://zeus
2. 点击 "Fork" 按钮 (位于页面的右上方)

### 从你自己的仓库 Clone 代码

```bash
cd $NAFTIS
git clone https://github.com/$YOUR_GITHUB_ACCOUNT/zeus
cd naftis
git remote add upstream 'https://zeus'
git config --global --add http.followRedirects 1
```

### 创建分支并修改代码

```bash
git checkout -b my-feature # 创建一个 my-feature 分支
# 修改代码，加入你自己的变更
```

### 让你 fork 仓库和官方仓库同步

```bash
git fetch upstream
git rebase upstream/master
```

### 向你 fork 仓库提交 commits

```bash
git add .
git commit
git push origin my-feature # 推送 my-featur 到你自己的仓库
```
### 提交 PR

```bash
你可以访问 https://github.com/$YOUR_GITHUB_ACCOUNT/zeus 或者  https://zeus 来浏览你的分支 (比如 "my-feature")。

点击 "Compare" 按钮来比较变更, 然后点击你的 "my-feature" 分支旁边的 "Pull request" 按钮来提交 PR。
```

### Review 代码

一个 PR 必须至少有一个人 review，review 无误后由 admin 合并至 master 分支。

## 代码结构

```bash

```
## 代码风格
- [Go: CodeReviewComments](https://github.com/golang/go/wiki/CodeReviewComments)