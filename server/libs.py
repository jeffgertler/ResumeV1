#
#  libs.py
#  ResumeV1 (server)
#
#  Created by George Wong on 5/3/14.
#  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
#

inputString1 = "{{template:2},{p_email:(null)},{secondaries:(1,2,3,4,5,6,7,8)},{{type:Contact},{header:John Smith},{primary:johnsmith@gmail.com \
(111)111-1111},{secondary:123 Broadway \
 New York, NY, 12345}}{{type:Education},{header:Bachelor of Science, Computer Science},{primary:New York University, New York, NY, expected May 2014},{secondary:Minor: Management}}{{type:Employment},{header:Buisiness Applications Programmer, Fall 2013},{primary:Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY},{secondary:*Developed forcasting systems which produce individual reports. \
* Developed iall IFPS programs used for financial reports.}}}"
inputString2 = "{{template:2},{p_email:(null)},{secondaries:(6,4,5,2,3,0,1)},{{type:Contact},{header:John Smith},{primary:johnsmith@gmail.com \
(111) 111-1111},{secondary:123 Broadway \
 New York, NY, 12345}},{{type:Awards},{header:Dean's List},{primary:2014, 2015},{secondary:}}{{type:Awards},{header:Salutatorian Medal},{primary:Mayfield Central School, NY},{secondary:2010, 2011, 2012}}{{type:Skills},{header:Operating Systems},{primary:MTS, TSO, UNIX},{secondary:}}{{type:Skills},{header:Languages and Software},{primary:COBOL, IFPS, Focus, Megacalc, Pascal, Modula2, C, APL, SNOBOL, FORTRAN, LISP, SPIRES, BASIC, VSPC Autotab},{secondary:}}{{type:Employment},{header:Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY},{primary:Buisiness Applications Programmer, Fall 2013},{secondary:Developed forcasting systems which produce individual reports. \
Developed iall IFPS programs used for financial reports.}}{{type:Employment},{header:Psychology Department, Rensselaer Polytechnic Institute},{primary:Research Programmer, Summer 2013},{secondary:Performed Computer Aided Statistical analysis of data}}{{type:Education},{header:New York University, New York, NY, expected May 2014},{primary:Bachelor of Science, Computer Science},{secondary:Minor: Management}}}"
inputString3 = "{{template:2},{p_email:(null)},{secondaries:(2,0)},{{type:Contact},{header:John Smith},{primary:johnsmith@gmail.com \
(111) 111-1111},{secondary:123 Broadway \
 New York, NY, 12345}}{{type:Contact},{header:Roger Darling},{primary:johnsmith@gmail.com \
(111) 111-1111},{secondary:123 Broadway \
 New York, NY, 12345}}{{type:Education},{header:New York University, New York, NY, expected May 2014},{primary:Bachelor of Science, Computer Science},{secondary:Minor: Management}}{{type:Employment},{header:Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY},{primary:Buisiness Applications Programmer, Fall 2013},{secondary:Developed forcasting systems which produce individual reports. \
Developed iall IFPS programs used for financial reports.}}{{type:Employment},{header:A & P Supermarket, Madison, NJ},{primary:Meat Department Assistant},{secondary:Assisted department manager with ordering, pricing, and maintaining department inventory.}}{{type:Employment},{header:Psychology Department, Rensselaer Polytechnic Institute},{primary:Research Programmer, Summer 2013},{secondary:Performed Computer Aided Statistical analysis of data}}}"

inputString4 = "{{template:4},{p_email:(null)},{secondaries:(0,3)},{{type:Education},{datetime:},{header:New York University, New York NY},{primary:Ph.D. Baskets},{secondary:This is not the first school I went to.}}{{type:Education},{datetime:},{header:Rensselaer Polytechnic Institute, Troy, NY},{primary:B.S., Electrical Engineering},{secondary:}}{{type:Employment},{datetime:},{header:Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY},{primary:Buisiness Applications Programmer, Fall 2013},{secondary:Developed forcasting systems which produce individual reports. \
Developed iall IFPS programs used for financial reports.}}{{type:Awards},{datetime:},{header:Salutatorian Medal},{primary:Mayfield Central School, NY},{secondary:2010, 2011, 2012}}}"

inputString5 = "{{template:2},{p_email:(null)},{secondaries:(0)},{{type:Skills},{starttime:February - 2014},{endtime:January - -},{header:alckej},{primary:caesojf},{secondary:}}}"

inputString6 = "{{template:1},{p_email:(null)},{secondaries:(0,1,3,2,4,5,6,7)},{{type:Contact},{header:Roger Darling},{primary:johnsmith@gmail.com \
(111) 111-1111},{secondary:123 Broadway \
 New York, NY, 12345},{starttime:  },{endtime:  }}{{type:Education},{header:Rensselaer Polytechnic Institute, Troy, NY},{primary:B.S., Electrical Engineering},{secondary:},{starttime:  },{endtime:  }}{{type:Employment},{header:A & P Supermarket, Madison, NJ},{primary:Meat Department Assistant},{secondary:Assisted department manager with ordering, pricing, and maintaining department inventory.},{starttime:  },{endtime:  }}{{type:Skills},{header:Languages and Software},{primary:COBOL, IFPS, Focus, Megacalc, Pascal, Modula2, C, APL, SNOBOL, FORTRAN, LISP, SPIRES, BASIC, VSPC Autotab},{secondary:},{starttime:  },{endtime:  }}{{type:Awards},{header:Salutatorian Medal},{primary:Mayfield Central School, NY},{secondary:2010, 2011, 2012},{starttime:  },{endtime:  }}{{type:Honors},{header:Dean's List},{primary:Rensselaer Polytechnic Institute},{secondary:},{starttime:  },{endtime:  }}{{type:Honors},{header:United Food and Commercial Workers Union Scholarship},{primary:National Honor Society},{secondary:},{starttime:  },{endtime:  }}{{type:Honors},{header:Clayton and Mary Shelley Scholarship},{primary:Rensselaer Polytechnic Institute},{secondary:},{starttime:  },{endtime:  }}}"

testTemplate1 = "{{template:4},{p_email:(null)},{secondaries:(0,4,2,1,3,5,6,7)},{{type:Contact},{header:Kelly Tripathi},{primary:kpt230@nyu.edu (516)233-0016},{secondary:110 E 7th Street Apt 13, New York NY 10009},{starttime:  },{endtime:  }}{{type:Employment},{header:Forensic Panel},{primary:Active Casework Intern},{secondary:Responsible for background research on psychology reports, appeals, and witness statements to aid an official expert testimony regarding an active death penalty case. Researched various forensic psychology research articles to form an online database.},{starttime:September  2013},{endtime:December  2013}}{{type:Employment},{header:Forensic Panel},{primary:Deprevity Research Intern},{secondary:Assisted in research in project to create an objective sentencing tool to define what constitutes a deprave crime under the direction of Dr. Michael Welner. Responsible for marking the presence of deprave acts through research of witness statements, police reports, defendant statements, and autopsy/medical reports of resolved cases.},{starttime:June  2013},{endtime:September  2013}}{{type:Employment},{header:Brown and Whalen, LLP},{primary:Legal Assistant},{secondary:Assisted assosiates in legal research, fact checking, and organization of documents. Prepared, electronically filed and hand delivered motions to New York Supreme Court. Perfromed various administrative tasks such as answering phone calls, copying, filing and scanning documents.},{starttime:January  2013},{endtime:  }}{{type:Education},{header:New York University},{primary:Bachelor of Science, Chemistry Major; Bachelor of Arts, Honors Politics Major},{secondary:Cummulative GPA 3.8/4.0},{starttime:September  2011},{endtime:May  2015}}{{type:Honors},{header:College of Arts and Science Presidential Honors Scholar},{primary:Selected for program which invites the top five percent of entering class, targeted for students who intend to graduate with honors in their major.},{secondary:},{starttime:September  2011},{endtime:  }}{{type:Honors},{header:Julius Silver Scholarship},{primary:Recipient of merit and need based scholarship provided to students who excel in a scientific major.},{secondary:},{starttime:September  2011},{endtime:  }}{{type:Honors},{header:Lawyer Alumni Mentoring Program},{primary:Selected based on academic achievement and interest in a legal career to be mentored by Christopher Hughes of Cadwalader, Wickersham & Taft LLP.},{secondary:},{starttime:November  2013},{endtime:  }}}"
testTemplate2 = "{{template:2},{p_email:(null)},{secondaries:(0,1,3,4)},{{type:Contact},{header:Kelly Tripathi},{primary:kpt230@nyu.edu (516)233-0016},{secondary:110 E 7th Street Apt 13, New York NY 10009},{starttime:  },{endtime:  }}{{type:Education},{header:New York University},{primary:Bachelor of Science, Chemistry Major; Bachelor of Arts, Honors Politics Major},{secondary:Cummulative GPA 3.8/4.0},{starttime:September  2011},{endtime:May  2015}}{{type:Employment},{header:Forensic Panel},{primary:Deprevity Research Intern},{secondary:Assisted in research in project to create an objective sentencing tool to define what constitutes a deprave crime under the direction of Dr. Michael Welner. Responsible for marking the presence of deprave acts through research of witness statements, police reports, defendant statements, and autopsy/medical reports of resolved cases.},{starttime:June  2013},{endtime:September  2013}}{{type:Employment},{header:Forensic Panel},{primary:Active Casework Intern},{secondary:Responsible for background research on psychology reports, appeals, and witness statements to aid an official expert testimony regarding an active death penalty case. Researched various forensic psychology research articles to form an online database.},{starttime:September  2013},{endtime:December  2013}}{{type:Honors},{header:Julius Silver Scholarship},{primary:Recipient of merit and need based scholarship provided to students who excel in a scientific major.},{secondary:},{starttime:September  2011},{endtime:  }}}"
testTemplate3 = "{{template:2},{p_email:(null)},{secondaries:(0,1,3,4)},{{type:Contact},{header:Kelly Tripathi},{primary:kpt230@nyu.edu (516)233-0016},{secondary:110 E 7th Street Apt 13, New York NY 10009},{starttime:  },{endtime:  }}{{type:Education},{header:New York University},{primary:Bachelor of Science, Chemistry Major; Bachelor of Arts, Honors Politics Major},{secondary:Cummulative GPA 3.8/4.0},{starttime:September  2011},{endtime:May  2015}}{{type:Employment},{header:Forensic Panel},{primary:Deprevity Research Intern},{secondary:Assisted in research in project to create an objective sentencing tool to define what constitutes a deprave crime under the direction of Dr. Michael Welner. Responsible for marking the presence of deprave acts through research of witness statements, police reports, defendant statements, and autopsy/medical reports of resolved cases.},{starttime:June  2013},{endtime:September  2013}}{{type:Employment},{header:Forensic Panel},{primary:Active Casework Intern},{secondary:Responsible for background research on psychology reports, appeals, and witness statements to aid an official expert testimony regarding an active death penalty case. Researched various forensic psychology research articles to form an online database.},{starttime:September  2013},{endtime:December  2013}}{{type:Honors},{header:Julius Silver Scholarship},{primary:Recipient of merit and need based scholarship provided to students who excel in a scientific major.},{secondary:},{starttime:September  2011},{endtime:  }}}"


# Imports
import smtplib
import logging
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.mime.text import MIMEText
from email import Encoders


# Splits input into array with elements of size given
def splitToArray(longString, n):
  a = []
  splitString = longString.split(" ")
  while (len(splitString) > 0):
    tmp = ""
    while (len(tmp)+len(splitString[0]) <= n):
      tmp += splitString[0] + " "
      splitString.remove(splitString[0])
      if (len(splitString) == 0):
        break
    a.append(tmp)

  return a


# Parse the input string
def parseJson(working):
  working = working.replace('&','&')

  json_array = []

  while (len(working)>1):
    startIndex = working.find('{')
    
    # If it's nested, take care of that
    if (working[startIndex+1] == '{'):
      endIndex = 0
      while (working[endIndex+1] != '}'):
        endIndex = working.find('}',endIndex+1)
      endIndex += 1
      json_array.append(parseJson(working[startIndex+1:endIndex]))
      working = working[endIndex+1:]
    
    # Else don't
    else:
      endIndex = working.find('}')
      tmp = working[startIndex+1:endIndex]
      tmp_array = []
      tmp_array.append(tmp[:tmp.find(':')])
      tmp_array.append(tmp[tmp.find(':')+1:])
      json_array.append(tmp_array)
      working = working[endIndex+2:]

  return json_array


### Take JSON, sort, and format according to style
def populateTypes(s):

  secondaries = []
  contact = []
  education = []
  experience = []
  skills = []
  publications = []    # Not used for this template

  others = {}
  
  # Load JSON to print
  indexOfElement = -1
  for l in s:
    indexOfElement += 1
    # Ignore template and email
    if ((l[0] == "template") or (l[0] == "p_email") or (l[0] == "s_email")):
      continue
    # Load secondaries
    if (l[0] == "secondaries"):
      secondaries = l[1][1:-1].split(',')
      for i in range(len(secondaries)):
        secondaries[i] = int(secondaries[i])
    # Continue (if not a list-like field)
    if (type(l[0]) != type(["",""])):
      continue
    # Take care of contact stuff
    if (l[0][1] == "Contact"):
      contact.append(l[1][1].upper()) # Name
      tmp = [l[2][1]]
      try:
        tmp.append( l[3][1] )
      except:
        pass
      contact.append(tmp)
    elif (l[0][1] == "Education"):
      tmp = ["","","",""]  # TODO (take care of date things)
      for m in l:
        if (m[0] == "header"):
          tmp[0] = m[1]
        elif (m[0] == "primary"):
          tmp[1] = m[1]
        elif ((m[0] == "secondary") and (indexOfElement in secondaries)):
          tmp[2] = m[1]
      education.append(tmp)
    elif (l[0][1] == "Skills"):
      tmp = ["topic"]
      for m in l:
        if (m[0] == "header"):
          tmp[0] = m[1]
        elif (m[0] == "primary"):
          tmp.append(m[1])
        else:
          continue # TODO
      skills.append(tmp)
    elif (l[0][1] == "Experience" or l[0][1] == "Employment"):
      # company,position,responsibility,sdate,edate
      tmp = ["company","position","responsibliy","start","end"]
      for m in l:
        if (m[0] == "header"):
          tmp[0] = m[1]
          continue
        elif (m[0] == "primary"):
          tmp[1] = m[1]
        elif ((m[0] == "secondary") and (indexOfElement in secondaries)):
          tmp[2] = m[1]
        elif (m[0] == "starttime"):
          tmp[3] = m[1]
        elif (m[0] == "endtime"):
          tmp[4] = m[1]
        else:
          continue  # TODO
      experience.append(tmp)
    else:
      # Add type to "others" 
      if (not l[0][1] in others):
        others[l[0][1]] = []
      # Add as always
      tmp = ["","","","","",""]
      myType = ""
      for m in l:
        if (m[0] == "type"):
          myType = m[1]
        elif (m[0] == "header"):
          tmp[0] = m[1]
        elif (m[0] == "primary"):
          tmp[1] = m[1]
        elif ((m[0] == "secondary") and (indexOfElement in secondaries)):
          tmp[2] = m[1]
        elif (m[0] == "starttime"):
          tmp[3] = m[1]
        elif (m[0] == "endtime"):
          tmp[4] = m[1]
      others[myType].append(tmp)

  return [secondaries, contact, education, experience, skills, publications, others]


### Given sender & receiver information, returns
### a triple of what needs to be sent
def makeEmail(senderEmail, senderDetail,        \
              receiverEmails, subject, body,    \
              attachmentPath):

  # Create vanilla message
  msg = MIMEMultipart()
  msg['Subject'] = subject
  msg['From'] = senderDetail
  msg['To'] = ', '.join(receiverEmails)
  msg.attach(MIMEText(body, 'plain'))

  # Set up attachment
  part = MIMEBase('application', "octet-stream")
  part.set_payload(open(attachmentPath, "rb").read())
  Encoders.encode_base64(part)
  part.add_header('Content-Disposition', 'attachment; filename="resume.pdf"')

  # Attach attachment
  msg.attach(part)

  return [senderEmail, receiverEmails, msg.as_string()]
