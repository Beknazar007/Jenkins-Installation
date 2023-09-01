def call(Map config = [:]) {
    loadLinuxScript (name: 'hello-world.sh')
    sh "./hello-world.sh  My name is ${config.name} ${config.surname}."
}