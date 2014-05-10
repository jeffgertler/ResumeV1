/*
 *  addscript.js
 *  ResumeV1 (server/public)
 * 
 *  Created by George Wong on 5/9/14
 *  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
 * 
 */

var ENTRY_LIST = [];

// TODO
var HTML_list = null;
var HTML_type_label = "TYPE";
var HTML_type_field = null;
var HTML_header_label = "HEADER";
var HTML_header_field = null;
var HTML_primary_label = "PRIMARY";
var HTML_primary_field = null;
var HTML_secondary_label = "SECONDARY";
var HTML_secondary_field = null;

// Internal entry state information
var current_entry_index = -1;
entry_type = null;
header_type = null;
primary_type = null;
secondary_type = null;
stime = null;
etime = null;

// Run at body.onload 
function getHTMLElements () {
  
  // Load fields
  HTML_list             =  document.getElementById("entriesID");
  HTML_type_field       =  document.getElementById("typesID")
  HTML_primary_field    =  document.getElementById("primaryID");
  HTML_header_field     =  document.getElementById("headerID");
  HTML_secondary_field  =  document.getElementById("secondaryID");

  // Load labels
  HTML_type_label       =  document.getElementById("typeLabelID");
  HTML_header_label     =  document.getElementById("headerLabelID");
  HTML_primary_label    =  document.getElementById("primaryLabelID");
  HTML_secondary_label  =  document.getElementById("secondaryLabelID");

  DEBUG_addEntry();
  updateByType();
  updateEntries();
}


// Defines non-custom types
var defaultTypes = { 
          "Contact" : 1,
          "Education" : 1, 
          "Employment" : 1, 
          "Research" : 1, 
          "Skills" : 1, 
          "Awards" : 1, 
          "Honors" : 1 };

// Update as desired
var customHeadings = {
  "NONE"        :   ["Header", "Primary", "Secondary"],
  "Contact"     :   ["Name", "Email and Phone Number", "Address"],
  "Education"   :   ["Institution Name", "Degree", "More Info"],
  "Employment"  :   ["Company", "Position", "Other Info"],
  "Skills"      :   ["Header", "Other Info", "NULL"],
  "Research"    :   ["Organization", "Position", "Other Info"]
};


// Every time a field is updated, run this
function inputChanged () {
  entry_type      = HTML_type_field.value;
  header_type     = HTML_header_field.value;
  primary_type    = HTML_primary_field.value;
  secondary_type  = HTML_secondary_field.value;
  stime           = document.getElementById("stimeID").value;
  etime           = document.getElementById("etimeID").value;

  if (entry_type == "Custom...") {
    document.getElementById("customTypeRow").hidden = false;
  } else {
    document.getElementById("customTypeRow").hidden = true;
  }
}

// TODO
function parseEntry (n) {
  console.log(ENTRY_LIST[n]);

  var parsedString = "";

}

// TODO
function parseAllEntries () {

}

// TODO
function DEBUG_addEntry () {
  ENTRY_LIST.push({
    "type"      : "Contact",
    "header"    : "George Wong",
    "primary"   : "g@nyu.edu 800.555.5555",
    "secondary" : "123 Main Street",
    "starttime" : "",
    "endtime"   : ""
  });
  ENTRY_LIST.push({
    "type"      : "Education",
    "header"    : "New York University",
    "primary"   : "B.A. Mathematics, Physics",
    "secondary" : "",
    "starttime" : "",
    "endtime"   : ""
  });
}

// Updates field labels by type
function updateByType () {
  var type = HTML_type_field.value;
  if (type in customHeadings) { }
  else { type = "NONE"; }

  HTML_header_label.innerHTML     = customHeadings[type][0];
  HTML_primary_label.innerHTML    = customHeadings[type][1];
  HTML_secondary_label.innerHTML  = customHeadings[type][2];

  if (customHeadings[type][2] == "NULL") {
    HTML_secondary_label.hidden = true;
    HTML_secondary_field.hidden = true;
  } else {
    HTML_secondary_label.hidden = false;
    HTML_secondary_field.hidden = false;
  }

  inputChanged();
}

// TODO 
function updateEntries () {
  entriesID.innerHTML = "";
  for (i in ENTRY_LIST) {
    var newString = "<entry onclick=\"displayDetail(" + i + ");\">";
    newString += ENTRY_LIST[i]["header"];
    newString += "</entry><br>\n";
    entriesID.innerHTML += newString;
  }
  entriesID.innerHTML += "<br>\n<input type=\"button\" onclick=\"reset();\" value=\"Reset All\">\n<br><input type=\"button\" onclick=\"getCode();\" value=\"Get Code\"><br>";
}

// TODO
function addEntry () {

  if (HTML_header_field.value == "") { }
  else {
    var newEntry = {
      "type"      : "",
      "header"    : "",
      "primary"   : "",
      "secondary" : "",
      "starttime" : "",
      "endtime"   : ""
    };

    newEntry["type"] = HTML_type_field.value;
    if (newEntry["type"] == "Custom...") {
      newEntry["type"] = document.getElementById("typeID").value;
    }
    newEntry["header"] = HTML_header_field.value;
    newEntry["primary"] = HTML_primary_field.value;
    newEntry["secondary"] = HTML_secondary_field.value;
    newEntry["starttime"] = stime;
    newEntry["endtime"] = etime;

    if (current_entry_index == -1) { 
      ENTRY_LIST.push(newEntry);
    } else { 
      ENTRY_LIST[current_entry_index] = newEntry;
    }
    
  }

  clearFields();

  updateEntries();
}

// Resets all input data field
function clearFields () {
  current_entry_index = -1;
  HTML_type_field.value = "";
  HTML_header_field.value = "";
  HTML_primary_field.value = "";
  HTML_secondary_field.value = "";
  document.getElementById("typeID").value = "";
  inputChanged();
}

// TODO
function reset () {
  // RESET IT ALL!
}

// TODO
function getCode () {

}

// TODO
function displayDetail (n) {

  current_entry_index = n;

  var type = ENTRY_LIST[n]["type"];
  if (type in customHeadings) { }
  else { type = "NONE"; }

  // Take care of main body
  HTML_header_label.innerHTML     = customHeadings[type][0];
  HTML_primary_label.innerHTML    = customHeadings[type][1];
  HTML_secondary_label.innerHTML  = customHeadings[type][2];
  if (customHeadings[type][2] == "NULL") {
    HTML_secondary_label.hidden = true;
    HTML_secondary_field.hidden = true;
  } else {
    HTML_secondary_label.hidden = false;
    HTML_secondary_field.hidden = false;
  }
  if (ENTRY_LIST[n]["type"] in defaultTypes) {
    HTML_type_field.value = ENTRY_LIST[n]["type"];
    document.getElementById("customTypeRow").hidden = true;
  } else {
    document.getElementById("typeID").value = ENTRY_LIST[n]["type"];
    HTML_type_field.value = "Custom...";
    document.getElementById("customTypeRow").hidden = false;
  }
  HTML_header_field.value = ENTRY_LIST[n]["header"];
  HTML_primary_field.value = ENTRY_LIST[n]["primary"];
  HTML_secondary_field.value = ENTRY_LIST[n]["secondary"];
  document.getElementById("stimeID").value = ENTRY_LIST[n]["starttime"];
  document.getElementById("etimeID").value = ENTRY_LIST[n]["endtime"];
  document.getElementById("typeID").value = ENTRY_LIST[n]["type"];
  inputChanged();

  // Take care of modal
  document.getElementById("detail_header").innerHTML       = customHeadings[type][0];
  document.getElementById("detail_primary").innerHTML      = customHeadings[type][1];
  document.getElementById("detail_secondary").innerHTML    = customHeadings[type][2];
  document.getElementById("detail_stime").innerHTML        = "Start Date";
  document.getElementById("detail_etime").innerHTML        = "End Date";
  document.getElementById("detail_header_field").value     = ENTRY_LIST[n]["header"];
  document.getElementById("detail_primary_field").value    = ENTRY_LIST[n]["primary"];
  document.getElementById("detail_secondary_field").value  = ENTRY_LIST[n]["secondary"];
  document.getElementById("detail_stime_field").value      = ENTRY_LIST[n]["starttime"];
  document.getElementById("detail_etime_field").value      = ENTRY_LIST[n]["endtime"];

  // Appropriate changing
  console.log(ENTRY_LIST[n]["type"]);
  if (ENTRY_LIST[n]["type"] in defaultTypes) {
    document.getElementById("detail_type_row").hidden = true;
  } else {
    document.getElementById("detail_type_row").hidden = false;
    document.getElementById("detail_type_field").value = ENTRY_LIST[n]["type"];
  }

  document.getElementById("entryDetail").hidden = false;
}



