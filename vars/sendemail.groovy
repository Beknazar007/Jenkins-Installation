def call(Map config = [:]) {
    mail bcc: '', body: "${config.body}", cc: '', from: '', replyTo: '', subject: "${config.subj}", to: 'saitovbeknazar6@gmail.com'

    // mail bcc: '', body: 'Please make sure that you started your build', cc: '', from: '', replyTo: '', subject: 'Your build started', to: 'esenbaevnurmuhamed7@gmail.com' 
}