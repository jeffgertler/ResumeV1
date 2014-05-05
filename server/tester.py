#
#  tester.py
#  ResumeV1 (server)
#
#  Created by George Wong on 5/3/14.
#  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
#

### Imports
from libs import *
from formats import *


### Main test environment

# Parse the input string we've saved in libs.py
inputToParser = testTemplate3[1:-1]
inputToParser = inputToParser.replace('&','\&')
parsedJSON = parseJson(inputToParser)

# Generate the text
types = populateTypes(parsedJSON)

text = ""
text = styleOne(types[0], types[1], types[2], types[3], types[4], types[6]) # For obvious reasons
text = styleTwo(types[0], types[1], types[2], types[3], types[4], types[5], types[6])
text = styleThree(types[0], types[1], types[2], types[3], types[4], types[5], types[6])
text = styleFour(types[0], types[1], types[2], types[3], types[4], types[5], types[6])

# Open file to write output to
fptr = open("temp.tex",'w')

# Write to file & close
fptr.write(text)
fptr.close()

