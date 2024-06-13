#!/bin/bash
# 参数配置 ----------------------
export TZ='Asia/Hong_Kong'
ACCTIME=$(date +"%Y年%m月%d日 %A %Z %T")
LAB="origin"
MESSAGE="提交图片"
BRANCH="main"
GHMDTOCPATH="/Users/zac421/nerozac_arxiv_v2/nokron/8-Toolkits/7-gh-md-toc/gh-md-toc"
# ------------------------------
source ~/.zshrc
if [ "$GHMDTOCPATH" != "" ]; then
  echo "  【MarkDown】检测到自定义Github TOC工具，更新README文档中......"
   $GHMDTOCPATH --insert --no-backup README.md
fi
echo "  【SUBMIT】检查当前分支:"
git branch
sleep 0.1
echo "  【SUBMIT】开始运行git任务!"
sleep 0.1
echo "  【SUBMIT】LAB选项: $LAB"
if [ "$LAB" = "both" ]; then
    echo "  【SUBMIT】    开始 pull workgit ..."
    git pull workgit "$BRANCH" --allow-unrelated-histories
    sleep 0.1
    echo "  【SUBMIT】    完成 pull workgit !"
    sleep 0.1
    echo "  【SUBMIT】    开始 pull homegit ..."
    git pull homegit "$BRANCH" --allow-unrelated-histories
    sleep 0.1
    echo "  【SUBMIT】    完成 pull homegit !"
    sleep 0.1
elif [ "$LAB" = "home" ]; then
    echo "  【SUBMIT】    开始 pull homegit ..."
    git pull homegit "$BRANCH" --allow-unrelated-histories
    sleep 0.1
    echo "  【SUBMIT】    完成 pull homegit !"
    sleep 0.1
elif [ "$LAB" = "work" ]; then
    echo "  【SUBMIT】    开始 pull workgit ..."
    git pull workgit "$BRANCH" --allow-unrelated-histories
    sleep 0.1
    echo "  【SUBMIT】    完成 pull workgit !"
    sleep 0.1
elif [ "$LAB" = "origin" ]; then
    echo "  【SUBMIT】    开始 pull origin ..."
    git pull origin "$BRANCH" --allow-unrelated-histories
    sleep 0.1
    echo "  【SUBMIT】    完成 pull origin !"
    sleep 0.1
fi
sleep 0.1
cpe
sleep 0.1
cde
sleep 0.1
cipynb
sleep 0.1
echo ""
echo "  【SUBMIT】--- 添加文件 ---"
echo ""
git add .
git status
git commit -m "$ACCTIME : $MESSAGE"
sleep 0.1
if [ "$LAB" = "both" ]; then
    echo "  【SUBMIT】    开始推送到workgit..."
    git push workgit "$BRANCH"
    sleep 0.1
    echo "  【SUBMIT】    完成推送到workgit!"
    sleep 0.1
    echo "  【SUBMIT】    开始推送到homegit..."
    git push homegit "$BRANCH"
    sleep 0.1
    echo "  【SUBMIT】    完成推送到homegit!"
    sleep 0.1
elif [ "$LAB" = "home" ]; then
    echo "  【SUBMIT】    开始推送到homegit..."
    git push homegit "$BRANCH"
    sleep 0.1
    echo "  【SUBMIT】    完成推送到homegit!"
    sleep 0.1
elif [ "$LAB" = "work" ]; then
    echo "  【SUBMIT】    开始推送到workgit..."
    git push workgit "$BRANCH"
    sleep 0.1
    echo "  【SUBMIT】    完成推送到workgit!"
    sleep 0.1
elif [ "$LAB" = "origin" ]; then
    echo "  【SUBMIT】    开始推送到origin..."
    git push origin "$BRANCH"
    sleep 0.1
    echo "  【SUBMIT】    完成推送到origin!"
    sleep 0.1
fi
sleep 0.1
echo ""
echo "--- 推送成功 ---"
echo ""
