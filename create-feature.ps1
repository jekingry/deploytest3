# Create feature
$Env:PR_NUMBER = ([int]$Env:PR_NUMBER) + 1
$pr = $Env:PR_NUMBER
$branchName = "feature/change-$pr"

git checkout -b $branchName main
Add-Content -Path "$pr.txt" -Value $pr
git add "$pr.txt"

$title = "[PL-$pr] Feature $pr"
git commit -m $title
git push -u origin $branchName
gh pr create --base main --head $branchName --fill
gh pr merge $branchName --squash --delete-branch