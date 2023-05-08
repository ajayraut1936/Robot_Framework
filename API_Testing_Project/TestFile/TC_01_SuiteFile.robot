*** Settings ***

Suite Setup         Suite_Setup
Suite Teardown      Suite_Teardown
Resource         ../../API_Testing_Project/API_Keywords/TC_01_Keywords.robot

*** Variables ***
${tc1_url}      http://thetestingworldapi.com
${tc_002_number}=    2662591
${$tc_005_number}=      2662622


*** Test Cases ***
#Student Details
TC_001 Get Student Details [GET]
    ${json1}=            to json     {"USER-ID": "Teri_User_ID", "URL": "http://thetestingworldapi.com"}
    log to console      ${json1}
    tc_001_sample    ${json1['URL']}

