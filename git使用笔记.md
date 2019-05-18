# git使用笔记

## 1.1创建仓库

```
mkdir [project-name]

git init

git init [project-name]

git clone[url]
```



## 1.2提交文件

```
#添加当前目录所有文件到暂存区
git add *
#提交暂存区数据到仓库区
git commit -m [message]
#为远程Git更名为pre 
git remote add pre git@github.com"abcd/tmp.git
#推送此次修改
#首次修改需要加上 -u master是默认的分支
git push -u pre master
```

