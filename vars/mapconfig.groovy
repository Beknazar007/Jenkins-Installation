def call(Map config = [:]) {
    sh "echo My name is ${config.name} ${config.surname}."
}