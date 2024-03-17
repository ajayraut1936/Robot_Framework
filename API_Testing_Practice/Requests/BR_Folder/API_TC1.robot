*** Settings ***
Suite Setup     TC_001 Get Student Details [GET]123
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     SeleniumLibrary
Library     JSONLibrary
Resource     ../../API_Keywords/TC_01_Keywords.robot



*** Variables ***
${tc1_url}      http://thetestingworldapi.com
${tc_002_number}=    2662591
${tc_002_number}=
${$tc_005_number}=      2662622

*** Test Cases ***
#Student Details
TC_001 Get Student Details [GET]
    create session   TC_001     ${tc1_url}
    ${res}=    GET On Session      TC_001      /api/studentsDetails/
    log to console      ${res}
    log                 ${res.status_code}
    log                 ${res.headers}
    log                 ${res.content}
    #Validations
    ${res}=     convert to string       ${res.content}
    ${res}=      should contain       ${res}        Ajay

TC_002 Get Student Details of recoed[GET][2662591]
    create session   TC_002     ${tc1_url}
    ${res}=    GET On Session      TC_001      /api/studentsDetails/${tc_002_number}
    log to console      ${res}
    log                 ${res.status_code}
    log                 ${res.headers}
    log                 ${res.content}
    #Validations
    ${res}=     convert to string       ${res.content}
    ${res}=  run keyword and return status    should contain       ${res}        Gillian

TC_003 Post Student Derails[create new student]
    create session     TC_003       ${tc1_url}
    ${header}=      create dictionary       Content-Type=application/json
    ${body}=        create dictionary       first_name=Ajay     middle_name=Savata  last_name=Raut  date_of_birth=23-05-98
    ${res}     POST On Session        TC_003      api/studentsDetails         data=${body}        headers=${header}
    log to console  ${res}
    log             ${res}
    log             ${res.status_code}
    log             ${res.content}
    log             ${res.headers}

    #Validations
    ${res1}=     convert to string       ${res.content}
    should contain      ${res1}      Ajay
    ${res1}=     to json       ${res.content}
    ${id}=       set variable        ${res1['id']}
    set global variable    ${Post_id123}     ${id}
    ${status}=      convert to string      ${res.status_code}
    should be equal      ${status}     201

TC_005 Put Request Student Data Update
    create session     TC_003       ${tc1_url}
    ${header}=      create dictionary       Content-Type=application/json
    ${body}=        create dictionary       first_name=Vijay     middle_name=Savata  last_name=Raut  date_of_birth=23-05-98
    ${res}     POST On Session         TC_003      api/studentsDetails/${Post_id123}         data=${body}        headers=${header}
    log to console  ${res}
    log             ${res}
    log             ${res.status_code}
    log             ${res.content}
    log             ${res.headers}

    #Validations
    ${res1}=     convert to string       ${res.content}
    should contain      ${res1}      Vijay

    ${status}=      convert to string      ${res.status_code}
    should be equal      ${status}     201

TC_006 Delete Request by Student id
    create session      TC_006      ${tc1_url}
    ${res}=     DELETE On Session      TC_006      api/studentsDetails/${Post_id123}
    log     ${res.status_code}
    log     ${res.content}
    ${data}=    convert to string   ${res.content}
    should contain      ${data}     Delete  data success

*** Keywords ***

TC_001 Get Student Details [GET]123
    create session   TC_001     ${tc1_url}
    ${res}=    GET On Session      TC_001      /api/studentsDetails/
    log to console      ${res}
    log                 ${res.status_code}
    log                 ${res.headers}
    log                 ${res.content}
    #Validations
    ${res}=     convert to string       ${res.content}
