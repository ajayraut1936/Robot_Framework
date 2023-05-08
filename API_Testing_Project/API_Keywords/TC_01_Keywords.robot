*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     JSONLibrary
Library         json
Library         ../../PythonLib/utilitylibrary.py
Resource        ../Config/CommonData.txt
Library         ./../TestData/testdata_generic.json
Resource        ./../TestData/testdata_generic.json

*** Variables ***
${testdata_generic}                         ./../TestData/testdata_generic.json

*** Keywords ***
Suite_Setup

    log                 Suite_Setup123
    log to console      Suite_Setup123
Suite_Teardown
    log                 Suite_Teardown123
    log to console      Suite_Teardown123
TC_001_SAMPLE
    [Arguments]        ${tc1_url}
    create session   TC_001     ${tc1_url}
    ${res}=    get request      TC_001      /api/studentsDetails/
    log to console      ${res}
    log                 ${res.status_code}
    log                 ${res.headers}
    log                 ${res.content}
    #Validations
    ${res}=     convert to string       ${res.content}
    ${res}=      should contain       ${res}        Test