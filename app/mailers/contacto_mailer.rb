class ContactoMailer < ActionMailer::Base
  def contactar(email)
   @email=email
   mail(:subject => "Contacto formulario web",:to => "juanantonioruz@gmail.com",:from => "redmuseos@olearum.es")
   mail(:subject => "Contacto formulario web",:to => "arquibernardo@gmail.com",:from => "redmuseos@olearum.es")
   mail(:subject => "Contacto formulario web",:to => "marionn.pa@gmail.com",:from => "redmuseos@olearum.es")
#   mail(:to=>email.email,:subject => "Contacto formulario web",:to => "arquibernardo@gmail.com")
#   mail(:to=>email.email,:subject => "Contacto formulario web",:to => "marionn.pa@gmail.com")
  end
end
