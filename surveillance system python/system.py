import cv2
import time
import datetime

import smtplib
import ssl
from email.message import EmailMessage

#Sample For surveillance system

def email_exec_function(subject,message):
    
    # Define email sender and receiver
    email_sender = 'write-email-here'
    email_password = 'write-password-here'
    email_receiver = 'write-email-receiver-here'

    # Set the subject and body of the email
    body = message

    email_context = EmailMessage()
    email_context['From'] = email_sender
    email_context['To'] = email_receiver
    email_context['Subject'] = subject
    email_context.set_content(body)

    # Add SSL (layer of security)
    context = ssl.create_default_context()

    # Log in and send the email
    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(email_sender, email_password)
        smtp.sendmail(email_sender, email_receiver, email_context.as_string())
        
    return False; 

#Function to execute email function 

cap = cv2.VideoCapture(0)
#Acess the Device Camera 

face_pattern = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
#Get The Face Pattern 

body_pattern = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_fullbody.xml")
#Get The Body Pattern 

detection = False
detection_stopped_time = None
timer_started = False
SECONDS_TO_RECORD_AFTER_DETECTION = 5

frame_size = (int(cap.get(3)), int(cap.get(4)))
fourcc = cv2.VideoWriter_fourcc(*"mp4v")

while True:
    _, frame = cap.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_pattern.detectMultiScale(gray, 1.3, 5)
    bodies = body_pattern.detectMultiScale(gray, 1.3, 5)

    if len(faces) + len(bodies) > 0:
        if detection:
            timer_started = False
        else:
            detection = True
            #Proceed to Warn System For The Intruder Detection 

            email_exec_function('Security Detected Intruder','It seems that the system has detected an intruder.'); 
            #Compile The Email Function 

            current_time = datetime.datetime.now().strftime("%d-%m-%Y-%H-%M-%S")
            out = cv2.VideoWriter( f"{current_time}.mp4", fourcc, 20, frame_size)
            #Start The Function To Start Recording Everything That Happens Once The System Detects Someone 

            print("Intruder Has Been Detected"); 
    
    elif detection:
        if timer_started:
            if time.time() - detection_stopped_time >= SECONDS_TO_RECORD_AFTER_DETECTION:
                detection = False
                timer_started = False
                out.release()
                print('Stop Recording!')
        else:
            timer_started = True
            detection_stopped_time = time.time()

    if detection:
        out.write(frame)

    for (x, y, width, height) in faces:
        cv2.rectangle(frame, (x, y), (x + width, y + height), (255, 0, 0), 3)

    cv2.imshow("Camera", frame)

    if cv2.waitKey(1) == ord('q'):
        break

out.release()
cap.release()
cv2.destroyAllWindows()

#CREATED BY THE_LOST_KID
