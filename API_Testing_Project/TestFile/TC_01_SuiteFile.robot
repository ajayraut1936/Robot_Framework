*** Settings ***

Suite Setup         Suite_Setup
Suite Teardown      Suite_Teardown
Resource         ../../API_Testing_Project/API_Keywords/TC_01_Keywords.robot
Resource       ../API_TestData/TC_01_TestData.json

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


TC_02
    # Get Posts 
     ${header}       create dictionary    Content-Type=application/json
     Create Session    TC_02     https://jsonplaceholder.typicode.com
    ${response}    GET On Session   TC_02    /posts     headers=${header}
    log    ${response}
    log    ${response.text}
    log    ${response.content}
    log    ${response.status_code}
    log    ${response.headers}

#    Get Comments 
    log   Get Comments 
     ${header}       create dictionary    Content-Type=application/json
     Create Session    TC_02     https://jsonplaceholder.typicode.com
    ${response}    GET On Session   TC_02    /posts/1/comments     headers=${header}
    log    ${response}
    log    ${response.text}
    log    ${response.content}
    log    ${response.status_code}
    log    ${response.headers}


TC_02_Post
    ${json_content} =  Load JSON From File  ../API_TestData/TC_01_TestData.json
    ${json_body} =  Get Value From Json   ${json_content}    $.TC_post   
    Log To Console    ${json_body}
     ${json_body}     Convert Json To String      ${json_body}

     ${header}       create dictionary    Content-Type=application/json    
     Create Session    TC_02     https://reqres.in/
    ${response}    POST On Session   TC_02    /api/users     headers=${header}   data=${json_body}
    log    ${response}
    log    ${response.text}
    log    ${response.content}
    log    ${response.status_code}
    log    ${response.headers}
    