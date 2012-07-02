class ContactoMailer < ActionMailer::Base
  def contactar(email, email_destino)
   @email=email
   mail(:subject => "Contacto formulario web",:to => email_destino,:from => "redmuseos@olearum.es")
#   mail(:to=>email.email,:subject => "Contacto formulario web",:to => "arquibernardo@gmail.com")
#   mail(:to=>email.email,:subject => "Contacto formulario web",:to => "marionn.pa@gmail.com")
  end
end
