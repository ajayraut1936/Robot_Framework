*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn

*** Variables ***
${base_url}     https://reqres.in
${user}     2

*** Test Cases ***

Get_User_info
    create session  myses   ${base_url}
    ${response}=    get request     myses  /api/users/${user}
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
    ${get_failed_res}=  get request     ajay    /api/users/23

     log to console     ${get_failed_res}
     ${status1}=     convert to string   ${get_failed_res.status_code}
     should contain     ${status1}      404


Get_Request_List_verification
    create session  ajay1   ${base_url}
    ${get_list}=    get request     ajay1   /api/users?page=2

    #log to console      ${get_list.content}
    log to console      ${get_list.headers}


