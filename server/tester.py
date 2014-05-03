

from libs import *
from formats import *


# We'll figure out where to put this later...
def res1(s):

  secondaries = []
  contact = []
  education = []
  experience = []
  skills = []
  # publications = []    # Not used for this template

  others = {}
  
  # Load JSON to print
  for l in s:
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
      tmp = l[2][1]
      try:
        tmp += " \\\\ \n"
        tmp += l[3][1]
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
        elif (m[0] == "secondary"):
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
      tmp = ["company","position","responsibliy","dat?"]
      for m in l:
        if (m[0] == "header"):
          tmp[0] = m[1]
          continue
        elif (m[0] == "primary"):
          tmp[1] = m[1]
        elif (m[0] == "secondary"):
          tmp[2] = m[1]
        else:
          continue  # TODO
      experience.append(tmp)
    else:
      # Add type to "others" 
      if (not l[0][1] in others):
        others[l[0][1]] = []
      # Add as always
      tmp = ["","","","",""]
      myType = ""
      for m in l:
        if (m[0] == "type"):
          myType = m[1]
        elif (m[0] == "header"):
          tmp[0] = m[1]
        elif (m[0] == "primary"):
          tmp[1] = m[1]
        elif (m[0] == "secondary"):
          tmp[2] = m[1]
      others[myType].append(tmp)

  return styleOne(secondaries, contact, education, experience, skills, others)
# End formatting confusion...

### Main test environment

# Parse the input string we've saved in libs.py
parsedJSON = parseJson(inputString2[1:-1])

# Generate the text
t = res1(parsedJSON)

# Open file to write output to
fptr = open("temp.tex",'w')

# Write to file & close
fptr.write(t)
fptr.close()