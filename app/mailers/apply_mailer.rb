class ApplyMailer < ApplicationMailer
    default from: "from@example.com"

    def apply_email(application, job)
        @application = application
        mail(to: 'spidasoftware@sw.com', subject: 'New Application for ' + job.position)
    end
end
