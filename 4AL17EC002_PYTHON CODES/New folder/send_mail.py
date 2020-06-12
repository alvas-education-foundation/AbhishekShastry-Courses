from email.mime.text import MIMEText
import smtplib

def send_mail(email, height, avg_height, count):
    from_mail = "anonymous.homosapien.99"
    from_password = "Anony@999"
    to_mail = email

    subject = "Height Data"
    message = "Hey there, Your Height is <strong>%s</strong> cm. <br>Average Height of all is <strong>%s</strong> cm, and that is calculated out of <strong>%s</strong> Homosapiens.<br>Thank You!" % (height, avg_height, count)

    msg = MIMEText(message,'html')
    msg['Subject'] = subject
    msg['To'] = to_mail
    msg['From'] = from_mail

    gmail = smtplib.SMTP('smtp.gmail.com',587)
    gmail.ehlo()
    gmail.starttls()
    gmail.login(from_mail, from_password)
    gmail.send_message(msg)
