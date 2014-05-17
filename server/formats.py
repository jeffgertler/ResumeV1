#
#  formats.py
#  ResumeV1 (server)
#
#  Created by George Wong on 5/3/14.
#  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
#

from libs import *


### Style of template one
def styleOne(secondaries, contact, education, experience, skills, others):
  
  # Set up header
  text = ""
  text += "\\documentclass[margin]{res}\n"
  text += "\\topmargin=-0.5in\n\\setlength{\\textheight}{10in}\n\n\\begin{document}\n"

  # Write name & address
  text += "\n% Name section\n\\name{"
  text += contact[0]
  text += "}\n"
  text += "\n\\address{"
  text += contact[1][0]
  text += " \\\\ "
  text += contact[1][1]
  text += "}\n\n"

  text += "\\begin{resume}\n"

  # Write Education section
  if (len(education) != 0):
    text += "\n% Education section\n\\section{EDUCATION}\n"
    for l in education:
      for m in range(len(l)):
        if (len(l[m])==0):
          continue
        if (m!=0):
          text += " \\\\\n"
        text += l[m]

  # Write Skills section
  if (len(skills) != 0):
    text += "\n% Skills section\n\\section{SKILLS}\n"
    for l in skills:
      text += "\\normalsize{\\section{" + l[0] + "}}\n\\begin{itemize}\n"
      text += "  \\item[--] " + l[1] + "\n\\end{itemize}\n"

  # Write Experience section
  if (len(experience) != 0):
    text += "\n% Experience section\n\\section{EXPERIENCE}\n"
    for l in experience:
      date = ""
      if (len(l[3].replace(' ','')) != 0):
        if (len(l[4].replace(' ','')) != 0):
          date = l[3] + " $-$ " + l[4]
        else:
          date = l[3]
      text += l[0] + "\n\\vspace{0.2em} \n\\begin{itemize} \n"
      text += "  \\item[] \\textbf{" + l[1] + "} \hfill " + date + "\n"
      text += "  \\item[] " + l[2] + " \n\\end{itemize} \n\n"


  # Add custom fields
  text += "\n\n% Other sections"  # \n\\section{EXPERIENCE}\n"
  for l in others:
    text += "\n\\section{" + l.upper() + "}\n"
    for m in others[l]:

      date = ""
      if (len(m[3].replace(' ','')) != 0):
        if (len(m[4].replace(' ','')) != 0):
          date = m[3] + " $-$ " + m[4]
        else:
          date = m[3]

      if (len(m[0]) != 0):
        text += "\n\\begin{tabular}{p{4in} r}\n"
        text += m[0] + " & " + date
        text += "\n\\end{tabular}\n"
      if (len(m[1]) != 0):
        text += "\\begin{itemize}\n  \\vspace{0.2em}\n"
        text += "  \\item[] " + m[1]
        text += "\n\\end{itemize}\n"
      else:
        continue
        # Not handled

  # Write end
  text += "\n\n\n\n\\end{resume}\n\\end{document}"

  return text


### Style of template two
def styleTwo(secondaries, contact, education, experience, skills, publications, others):

  # Set up header
  text = ""
  text += "\\documentclass[11pt]{res}\n\\usepackage{latexsym}\n"
  text += "\\setlength{\\textheight}{10in}\n\\topmargin=-0.5in\n\n\\begin{document}\n\n"

  # Write name & address
  text += "\\name{" + contact[0] + "}\n\\address{"
  text += contact[1][1] + " \\\\ " + contact[1][0] + "}\n\n\\begin{resume}\n\n"

  # Write experience section
  if (len(experience) != 0):
    text += "\n% Experience section\n\\section{BUSINESS EXPERIENCE}\n"
    for l in experience:
      date = ""
      if (len(l[3].replace(' ','')) != 0):
        if (len(l[4].replace(' ','')) != 0):
          date = l[3] + " $-$ " + l[4]
        else:
          date = l[3]
      text += "  " + l[0] + " \\\\ \n"
      text += "    \\textbf{ " + l[1] + "} \hfill " + date + " \n"   # TODO (date goes here)
      text += "    \\begin{itemize} \\itemsep -4pt\n"
      text += "      \\item[] " + l[2] + "\n"
      text += "    \\end{itemize}\n\n"

  # Write education section
  if (len(education) != 0):
    text += "\n% Education section\n\\section{EDUCATION}\n"
    for l in education:
      text += "  " + l[0] + " \\\\ \n"
      text += "  {\\it " + l[1] + "}, " # TODO (date)
      text += "\n" 
      text += "  \\begin{itemize} \\itemsep -4pt\n"
      text += "    \\item[] " + l[2] + "\n"
      text += "  \\end{itemize}\n\n"

  # Write Skills section
  if (len(skills) != 0):
    text += "\n% Skills section\n\\section{SKILLS}\n"
    for l in skills:
      text += "  \emph{" + l[0] + "} \\\\"
      text += "  " + l[1] + " \n\n"
      #text += "  " + l[2] + " \n\n"

  # Add custom fields
  text += "\n\n% Other sections"
  for l in others:
    text += "\n\\section{" + l.upper() + "}\n"
    for m in others[l]:
      date = ""
      if (len(m[3].replace(' ','')) != 0):
        if (len(m[4].replace(' ','')) != 0):
          date = m[3] + " $-$ " + m[4]
        else:
          date = m[3]
      if (len(m[0]) != 0):
        text += "\n" + m[0] + " \hfill " + date + " \n" 
      if (len(m[1]) != 0):
        text += "\\begin{itemize}\n  \\vspace{0.2em}\n"
        text += "  \\item[] " + m[1]
        text += "\n\\end{itemize}\n"
      else:
        continue
        # Not handled

  # Write end
  text += "\n\n\\end{resume}\n\\end{document}"

  return text


### Style for template three
def styleThree(secondaries, contact, education, experience, skills, publications, others):

  # Set up header
  text = ""
  text += "\\documentclass{res} \n\\setlength{\\textheight}{9.5in} \n\n\\begin{document}\n\n"

  # Write name & address
  text += "\\name{" + contact[0] + " \\\\ [12pt]}\n"
  text += "" # TODO (present etc. address) \address{\bf  PRESENT ADDRESS\\193 5th Avenue\\Troy, NY 12180\\(518) 274-1234}

  text += "\\begin{resume}\n\n"

  # Write Education section
  if (len(education) != 0):
    text += "\n% Education section\n\\section{EDUCATION}\n"
    for l in education:
      text += "  " + l[0] + " \\\\ \n" # TODO (date)
      text += "  " + l[1] + " \\\\ \n"
      text += "  " + l[2] + " \n\n"

  # Write Experience section
  if (len(experience) != 0):
    text += "\n% Experience section\n\\section{EXPERIENCE}\n\\vspace{-0.1in}\n"
    for l in experience:
      date = []
      if (len(l[3].replace(' ','')) != 0):
        if (len(l[4].replace(' ','')) != 0):
          date.append(l[3] + " $-$")
          date.append(l[4])
        else:
          date.append(l[3])
      position = splitToArray(l[1], 22)
      company = splitToArray(l[0], 32)
      text += "  \\begin{tabbing}\n  \\hspace{2.3in}\\= \\hspace{2.6in}\\= \\kill\n"
      #text += "  {\\bf " + position[0] + " \\hfill " + company[0] + " \\hfill " + date + "\\ \n"
      text += "  {\\bf " + position[0] + "} \\>" + company[0] + " \\> " + date[0]
      for m in range(max(len(position),len(company),len(date))-1):
        text += " \\\\ \n  {\\bf "
        try:
          text += position[m+1]
        except:
          pass
        text += "} \\>"
        try:
          text += company[m+1]
        except:
          pass
        text += " \\>"
        try:
          text += date[m+1]
        except:
          pass
      text += " \n  \\end{tabbing}\\vspace{-20pt}\n"
      text += "  " + l[2] + "\n\n"

  # Write Skills section
  if (len(skills) != 0):
    text += "\n% Skills section\n\\section{SKILLS}\n"
    for l in skills:
      text += "  \emph{" + l[0] + "} \\\\"
      text += "  " + l[1] + " \n\n"
      #text += "  " + l[2] + " \n\n"

  # Add custom fields
  text += "\n\n% Other sections"  # \n\\section{EXPERIENCE}\n"
  for l in others:
    text += "\n\\section{" + l.upper() + "}\n"
    text += "\n\\vspace{0.2em} \n"
    for m in others[l]:
      date = ""
      if (len(m[3].replace(' ','')) != 0):
        if (len(m[4].replace(' ','')) != 0):
          date = m[3] + " $-$ " + m[4]
        else:
          date = m[3]
      if (len(m[0]) != 0):
        text += "\n" + m[0] + " \hfill " + date + "\n"
      if (len(m[1]) != 0):
        text += "\\begin{itemize}\n  \\vspace{0.2em}\n"
        text += "  \\item[] " + m[1]
        text += "\n\\end{itemize}\n"
      else:
        continue
        # Not handled

  # Write end
  text += "\n\\end{resume}\n\\end{document}"

  return text


### Style for template four
def styleFour(secondaries, contact, education, experience, skills, publications, others):

  # Set up header
  text = ""
  text += "\\documentclass[margin,11pt]{res}\n\\begin{document}\n\n"

  # Write name & address
  text += "\\name{" + contact[0] + "\\\\[12pt]}\n\n"
  text += "\\address{{\\bf Permanent} \\\\" + contact[1][1] + " \\\\ "+ contact[1][0] + "}\n"
  # TODO, fix
  text += "\n\\begin{resume}\n"

  # Write Education section
  if (len(education) != 0):
    text += "\n% Education section\n\\section{EDUCATION}\n"
    for l in education:
      text += "  " + l[1] + " \\\\ \n"
      text += "  " + l[0] + " \\\\ \n"
      text += "  " + l[2] + " \n"
      text += "\n" # TODO (date)

  # Write Experience section
  if (len(experience) != 0):
    text += "\n% Experience section\n\\section{EXPERIENCE}\n"
    for l in experience:
      date = []
      try:
        if (len(l[3].replace(' ','')) != 0):
          if (len(l[4].replace(' ','')) != 0):
            date.append(l[3] + " $-$")
            date.append(l[4])
          else:
            date.append(l[3])
      except:
        pass
      position = splitToArray(l[1], 32)
      text += "  {\\bf " + l[0] + "} \\\\ \n"
      text += "  \\begin{ncolumn}{2}\n  \\underline{"
      text += position[0] + "} & " + date[0]
      try:
        text += date[1]
      except:
        pass
      for m in range(len(position)-1):
        text += "\n  \\underline{" + position[m+1] + "}"
      text += "\n  \\end{ncolumn} \n\\vspace{-0.1em}\n"
      text += l[2] + "\n\n"
  
  # Write Skills section
  if (len(skills) != 0):
    text += "\n% Skills section\n\\section{SKILLS}\n"
    for l in skills:
      date = []
      try:
        if (len(l[3].replace(' ','')) != 0):
          if (len(l[4].replace(' ','')) != 0):
            date.append(l[3] + " $-$")
            date.append(l[4])
          else:
            date.append(l[3])
      except:
        pass
      text += "  " + l[0] + " \\vspace{0.1em} \n  \\begin{itemize}"
      text += "\n    \item[] " + l[1] + "\n  \\end{itemize}\n\n"
      #text += "      " + l[2] + " \n\n"

  # Add custom fields
  text += "\n\n% Other sections"  # \n\\section{EXPERIENCE}\n"
  for l in others:
    text += "\n\\section{" + l.upper() + "}\n"
    for m in others[l]:
      date = ""
      if (len(m[3].replace(' ','')) != 0):
        if (len(m[4].replace(' ','')) != 0):
          date = m[3] + " $-$ " + m[4]
        else:
          date = m[3]
      if (len(m[0]) != 0):
        #text += "\n\\begin{tabular}{p{3in} r}\n"
        text += " \n" + m[0] + " \hfill " + date + " \n"
        #text += "\n\\end{tabular}\n"
      if (len(m[1]) != 0):
        text += "\\begin{itemize}\n  \\vspace{0.2em}\n"
        text += "  \\item[] " + m[1]
        text += "\n\\end{itemize}\n"
      else:
        continue
        # Not handled

  # Write end
  text += "\n\n\\end{resume}\n\\end{document}"

  return text


### Generalized style template
def styleTemplate(secondaries, contact, education, experience, skills, publications, others):

  # Set up header
  text = ""

  # Write name & address

  # Write Education section

  # Write Skills section

  # Write Experience section

  # Add custom fields

  # Write end

  return text



