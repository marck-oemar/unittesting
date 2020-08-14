
function func1() {
    return 1
}

function func2() {
    if [ ${ENV_GRASS} = "green" ]
    then
        touch colors.conf
        echo 'grass="green"' > colors.conf
    fi
}