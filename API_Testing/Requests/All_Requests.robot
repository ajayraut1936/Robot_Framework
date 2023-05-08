*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     SeleniumLibrary




*** Variables ***
${url}      http://restapi.adequateshop.com
${base_url}     https://reqres.in
${user}     2
${TC5_Base_Url}         http://localhost:3000/
${TC6_Url}              https://reqres.in
${TC7_url}              https://api.instantwebtools.net
*** Test Cases ***
#TC0_Open browser
#    open browser        https://www.facebook.com/         chrome
#    maximize browser window
#    input text          //input[@name='email']          Ajayraut032@gmail.com
#    input text          //input[@name='pass']           Ajay@1998
#    click button        //button[@name="login"]
#    close browser
TC1_Test_API_Post_Auth
    create session     ajay      ${url}
    ${body}     create dictionary  email=Developer5@gmail.com   password=123456
    ${header}       create dictionary  Content-Type=application/json    Authorization=Bearer<3030401c-c5a5-43c8-8b73-2ab9e6f2ca22>
    ${res}      post request  ajay     /api/authaccount/login   data=${body}    headers=${header}
    log to console  ${res.content}
    log to console  ${res.status_code}
    log to console  ${res.headers}

    log   ${res.content}
    log   ${res.status_code}
    ${status}=        set variable          ${res.status_code}
    log   ${res.headers}

    # Convert firat into json
    ${jsonresponse}=        to json        ${res.content}
    ${String}=      convert to string        ${jsonresponse}
    ${res}          should contain                ${String}         invalid username or password
    ${String}=      convert to string        ${jsonresponse['message']}
    ${res}          run keyword and continue on failure     should be equal as strings    ${String}      invalid username or password
    ${res}          run keyword                             should be equal as strings     ${String}      invalid username or password
    ${res}          run keyword if   "${status}"=="200"    should be equal as strings     ${String}      invalid username or password

    ${res}          run keyword and return status       post request  ajay     /api/authaccount/login   data=${body}    headers=${header}
    ${res}          run keywords


TC2_Get_User_info
    create session  myses   ${base_url}
    ${response}=    get request     myses  /api/users/${user}
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
    create session  ajay    ${base_url}
    ${get_failed_res}=  get request     ajay    /api/users/23

     log to console     ${get_failed_res}
     ${status1}=     convert to string   ${get_failed_res.status_code}
     should contain     ${status1}      404


TC4_Get_Request_List_verification
    create session  ajay1   ${base_url}
    ${get_list}=    get request     ajay1   /api/users?page=2

    #log to console      ${get_list.content}
    log to console      ${get_list.headers}

#TC5_Get_Sample_Json_From_Free api
#    create session   Session_ahe        ${TC5_Base_Url}
#    ${Get_Response}=    get request     Session_ahe     Simple_Json
#    log to console  ${Get_Response}

TC6_Get_List of Ussers Request
    create session  TC6_Session    ${TC6_Url}
    ${Response}=        get request  TC6_Session    /api/users?page=2
    log to console      ${Response}
    LOG                 ${Response.status_code}
    LOG                 ${Response.content}
    LOG                 ${Response.headers}


    #Validations
    ${Json_Response}=       to json         ${Response.content}
    ${response}=            set variable        ${Json_Response['data']}
    LOG         ${response}

TC_07_Post Request
    #https://api.instantwebtools.net/v1/airlines
    create session      TC_07       ${TC7_url}
    ${header}=       create dictionary       Content-Type=application/json
    ${body}=        create dictionary       name=John Doe   trips=250   airline=5}
    ${res}          post request        TC_07    /v1/airlines   data=${body}      headers=${header}

    log to console      ${res}
    log to console      ${res.content}
    log to console      ${res.headers}
    log      ${res}
    log      ${res.content}
    log      ${res.headers}