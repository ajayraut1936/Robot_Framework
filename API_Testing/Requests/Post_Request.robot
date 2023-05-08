*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn

*** Variables ***
${base_url}     https://reqres.in
${user}    2

*** Test Cases ***
Post_Request_New
    create session  mysos   ${base_url}
    ${body}=    create dictionary    name=morpheus job=leader
    ${header}   create dictionary     Content-Type=application/json
    ${res2}=    post request    mysos   /api/users/${user}     data=${body}      headers=${header}
    ${res_string}    convert to string   ${res2}
    log to console      ${res_string}
    log to console      ${res2.content}
    log to console      ${res2.headers}

    #validations
    ${status}=  convert to string   ${res2.status_code}
    should be equal     ${status}       201

    ${header}  convert to string   ${res2.headers}
    should contain     ${header}    application/json

TC_2_PUT_request
    create session  myajay      ${base_url}
    ${body}=    create dictionary  name=morpheus    job=zion resident
    ${header}   create dictionary  Content-Type=application/json; charset=utf-8
    ${res}=     put request  myajay     /api/users/2    data=${body}     headers=${header}
    log to console   ${res}





