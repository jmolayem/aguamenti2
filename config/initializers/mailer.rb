ActionMailer::Base.smtp_settings = {
	address: "smtop.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "jmmolaye@usc.edu",
	password: "KT-3t24ShOKrPhNjLPY0iQ",
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"