import smtplib
from email.mime.text import MIMEText
import sys


def inviaEmail():



    destinatario = sys.argv[1]

    oggetto = "Subject: Recupero password\n\n"
    contenuto = "Password temporanea: " + sys.argv[2]
    
    messaggio = oggetto + contenuto

    # messaggio = oggetto + conprova



    username = "progettoltw0@gmail.com"
    password = "Prova.1234"

    # destinatario = "ciarpaglini.lorenzo@gmail.com"

    email = smtplib.SMTP("smtp.gmail.com",587)
    email.ehlo()
    email.starttls()

    email.login(username,password)
    email.sendmail(username,destinatario,messaggio)

    email.quit()
    return

inviaEmail();
