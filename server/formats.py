

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
  text += "\\address{"
  text += contact[1]
  text += "}\n\n"

  text += "\\begin{resume}\n"

  # Write Education section
  text += "\n% Education section\n\\section{EDUCATION}\n"
  for l in education:
    for m in range(len(l)):
      if (len(l[m])==0):
        continue
      if (m!=0):
        text += " \\\\\n"
      text += l[m]

  # Write Skills section
  text += "\n% Skills section\n\\section{SKILLS}\n"
  for l in skills:
    text += "\\normalsize{\\section{" + l[0] + "}}\n\\begin{itemize}\n"
    text += "  \\item[--] " + l[1] + "\n\\end{itemize}\n"

  # Write Experience section
  text += "\n% Experience section\n\\section{EXPERIENCE}\n"
  for l in experience:
    text += "\\begin{tabular}{p{3.8in} r} \n  "
    text += l[0] + " & " + "TODO DATE" + "\n\\end{tabular} \n\\begin{itemize}\n  \\vspace{1em}\n"
    text += "  \\item[] \\textbf{" + l[1] + "} \n"
    text += "  \\item[] " + l[2] + " \n\\end{itemize}"

  # Add custom fields
  text += "\n\n% Other sections"  # \n\\section{EXPERIENCE}\n"
  for l in others:
    text += "\n\\section{" + l.upper() + "}\n"
    for m in others[l]:
      if (len(m[0]) != 0):
        text += "\n\\begin{tabular}{p{3in} r}\n"
        text += m[0]
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


