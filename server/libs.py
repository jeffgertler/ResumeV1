
inputString = "{{template:2},{p_email:(null)},{secondaries:(1,2,3,4,5,6,7,8)},{{type:Contact},{header:John Smith},{primary:johnsmith@gmail.com \
(111)111-1111},{secondary:123 Broadway \
 New York, NY, 12345}}{{type:Education},{header:Bachelor of Science, Computer Science},{primary:New York University, New York, NY, expected May 2014},{secondary:Minor: Management}}{{type:Employment},{header:Buisiness Applications Programmer, Fall 2013},{primary:Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY},{secondary:*Developed forcasting systems which produce individual reports. \
* Developed iall IFPS programs used for financial reports.}}}"

# Parse the input string
def parseJson(working):
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

print parseJson(inputString[1:-1])





