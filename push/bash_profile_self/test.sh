

#!/bin/bash
branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) 
if [ "${branch_name}" = "" ]; then
    echo "Not In Git Repo."
    exit 1
elif [ "${branch_name}" = "HEAD" ]; then
    echo "Detached HEAD."
    exit 1
fi
echo "branch: ${branch_name}"



remote_name=$(git config "branch.${branch_name}.remote")
if [ "${remote_name}" == "" ]; then
    echo "Remote Not Set"
    exit 1
fi
echo "remote: ${remote_name}"

merge_name=$(git config branch.${branch_name}.merge)
merge_branch=${merge_name##refs/heads/}

echo "git push ${remote_name} ${branch_name}:refs/for/${merge_branch}"
git push ${remote_name} ${branch_name}:refs/for/${merge_branch}%r=zhuxiaofei2@guazi.com,r=liuyuxi@guazi.com


