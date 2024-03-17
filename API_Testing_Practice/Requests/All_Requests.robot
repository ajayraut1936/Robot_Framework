*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     SeleniumLibrary
Library     JSONLibrary




*** Variables ***
${url}      http://restapi.adequateshop.com
${base_url}     https://reqres.in
${user}     2
${TC5_Base_Url}         http://localhost:3000/
${TC6_Url}              https://reqres.in
${TC7_url}              https://api.instantwebtools.net
${base_url}     https://reqres.in
${user}    2


*** Test Cases ***

TC0_Open browser
    open browser        https://www.facebook.com/         chrome
    maximize browser window
    input text          //input[@name='email']          Ajayraut032@gmail.com
    input text          //input[@name='pass']           Ajay@1998
    click button        //button[@name="login"]
    close browser

TC1_Test_API_Post_Auth
    create session     ajay      ${url}
    ${body}     Set Variable  {'email':'Developer5@gmail.com', 'password':'123456'}
    # ${body}    Convert String To Json    ${body}
    ${header}       create dictionary  Content-Type=application/json    Authorization=Bearer<3030401c-c5a5-43c8-8b73-2ab9e6f2ca22>
    ${res}      POST On Session     ajay     /api/authaccount/login   data=${body}    headers=${header}
    log to console  ${res.content}
    log to console  ${res.status_code}
    log to console  ${res.headers}

    log   ${res.content}
    log   ${res.status_code}
    ${status}=        set variable          ${res.status_code}
    log   ${res.headers}

    # Convert firat into json
    ${jsonresponse}=        Convert String To Json        ${res.content}
    ${String}=      convert to string        ${jsonresponse}
    ${res}          should contain                ${String}         invalid username or password
    ${String}=      convert to string        ${jsonresponse['message']}
    ${res}          run keyword and continue on failure     should be equal as strings    ${String}      invalid username or password
    ${res}          run keyword                             should be equal as strings     ${String}      invalid username or password
    ${res}          run keyword if   "${status}"=="200"    should be equal as strings     ${String}      invalid username or password

    ${res}          run keyword and return status       POST On Session  ajay     /api/authaccount/login   data=${body}    headers=${header}
    ${res}          run keywords


TC2_Get_User_info
    create session  myses   ${base_url}
    ${response}=    GET On Session     myses    /api/users/${user}
    sleep   2
    log to console  ${response.status_code}
    log to console  ${response.content}
    #log to console  ${response.headers}

    #Validations

    ${status_code}=     convert to string   ${response.status_code}
    should be equal    ${status_code}     200

    ${content}=    convert to string   ${response.content}
    should contain     ${content}      Janet


TC3_Get_Request_failed
    create session    ajay    ${base_url}
    ${get_failed_res}=  GET On Session     ajay    /api/users/23

     log to console     ${get_failed_res}
     ${status1}=     convert to string   ${get_failed_res.status_code}
     should contain     ${status1}      404


TC4_Get_Request_List_verification
    create session  ajay1   ${base_url}
    ${get_list}=    GET On Session     ajay1   /api/users?page=2

    #log to console      ${get_list.content}
    log to console      ${get_list.headers}

#TC5_Get_Sample_Json_From_Free api
#    create session   Session_ahe        ${TC5_Base_Url}
#    ${Get_Response}=    GET On Session     Session_ahe     Simple_Json
#    log to console  ${Get_Response}

TC6_Get_List of Ussers Request
    create session  TC6_Session    ${TC6_Url}
    ${Response}=        GET On Session  TC6_Session    /api/users?page=2
    log to console      ${Response}
    LOG                 ${Response.status_code}
    LOG                 ${Response.content}
    LOG                 ${Response.headers}


    #Validations
    ${Json_Response}=       to json         ${Response.content}
    ${response}=            set variable        ${Json_Response['data']}
    LOG         ${response}

TC_07_POST On Session
    #https://api.instantwebtools.net/v1/airlines
    create session      TC_07       ${TC7_url}
    ${header}=       create dictionary       Content-Type=application/json
    ${body}=        create dictionary       name=John Doe   trips=250   airline=5}
    ${res}          POST On Session        TC_07    /v1/airlines   data=${body}      headers=${header}

    log to console      ${res}
    log to console      ${res.content}
    log to console      ${res.headers}
    log      ${res}
    log      ${res.content}
    log      ${res.headers}
    
Get_User_info
    create session  myses   ${base_url}
    ${response}=    GET On Session     myses  /api/users/${user}
    sleep   2
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validations

    ${status_code}=     convert to string   ${response.status_code}
    should be equal    ${status_code}     200

    ${content}=    convert to string   ${response.content}
    should contain     ${content}      Janet


Get_Request_failed
    create session  ajay    ${base_url}
    ${get_failed_res}=  GET On Session     ajay    /api/users/23

     log to console     ${get_failed_res}
     ${status1}=     convert to string   ${get_failed_res.status_code}
     should contain     ${status1}      404


Get_Request_List_verification
    create session  ajay1   ${base_url}
    ${get_list}=    GET On Session     ajay1   /api/users?page=2

    #log to console      ${get_list.content}
    log to console      ${get_list.headers}

Post_Request_New
    create session  mysos   ${base_url}
    ${body}=    create dictionary    name=morpheus job=leader
    ${header}   create dictionary     Content-Type=application/json
    ${res2}=    POST On Session    mysos   /api/users/${user}     data=${body}      headers=${header}
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

