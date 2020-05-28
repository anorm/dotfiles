jira() {
    task=$1
    if [ -z $task ]; then
        echo "usage: jira TASK_ID" >&2
        return 1
    fi
    key=$(task _get $task.jira)
    url="https://simployer.atlassian.net/browse/$key"
    echo $url

    [ -z $BROWSER ] || $BROWSER "$url"
}
