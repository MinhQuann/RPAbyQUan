*** Settings ***
Resource    SettingsCRMLocators.robot
Resource    ../Data/Data.Robot
Resource    LoginPageLocators.robot
Resource    CallCenterLocator.robot
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     RequestsLibrary
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     String
Library     Collections
Library     random
Library     RPA.Salesforce
Library     OperatingSystem
Library     DateTime
Library     Process


*** Variables ***
${PROJECT_ROOT}                 D:/RPA2
# Excel File
${ObjConfig}                    Object Test.xlsx
${GroupName}                    GroupName
${SheetName1}                   Group1
${SheetName2}                   Group2
${SheetName3}                   FieldContact

${DATA}                         SDT 1.xlsx
${SheetName}                    Test1

${DATA2}                        SDT 2.xlsx
${SheetNameee}                  Test2

${DATA3}                        Data1.xlsx
${SheetNameeee}                 Test3

${DATA4}                        DataUserEx2.xlsx
${SheetNameeeeee}                Trang tính1
# RPA CAll API
# ${LinkeđID}    1721622634.191953
# ${ExtentionID}    8014
${API_URL_CTI}                  https://lab.connect247.vn/ucrmapi-cti/cti/call-data
# ${API_URL_CTI}    https://lab.connect247.vn/ucrmapi-ver3/cti/call-data
${API_URL_FIN}                  https://lab.connect247.vn/ucrmapi-cti/finesse-integration/handle-response-from-server
# ${PAYLOADRINGING}    {"LinkedID": "${LinkeđID} ", "QueueID": "", "CallPhone": "0399478262", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "RINGING", "TotalDuration": "0", "BillDuration": "0", "Username": "user8014@email.com", "Hotline": null, "ExtentionID": "${ExtentionID}", "InOutCall": "1", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
# ${PAYLOADRINGING_DICT}=    Evaluate    json.loads('${PAYLOADRINGING}')
${AUTHORIZATION_HEADER_CTI}     Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjIwMzY5ODQyMTMsIlRlbmFudHMiOiJ0bnRfdGVzdGFjZmN0ZXN0OV82NDQyOTMyMiIsIklEIjoiNjY5ODg5NTIyOGM5ZGEyY2RkNjEyYTkyIiwiRW1haWwiOiJ0ZXN0YWNmYzlAeW9wbWFpbC5jb20iLCJJc19BZG1pbiI6dHJ1ZX0.mumhNV909rOtFAUFNKpOharTYWPRNo85S2Zi9QY5bJs
&{HEADERS_CTI}                  Content-Type=application/json    Authorization=${AUTHORIZATION_HEADER_CTI}
${AUTHORIZATION_HEADER_FIN}     Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MDYwMDI5MjEsIlRlbmFudHMiOiJ0bnRfY2FsbGMyNDdzdGFuZGFyZF80MTQ1NzUyMSIsIklEIjoiNjU0OThhNWE0MjEzMTc2YTczOTE3OWZjIiwiRW1haWwiOiJjYWxsYzI0N3N0YW5kYXJkQGdtYWlsLmNvbSIsIklzX0FkbWluIjp0cnVlfQ.RywH1LqP6cjTSoGEJrsTPOl_uhiIWNuntG8ay0mxXx8
&{HEADERS_FIN}
...                             Content-Type=application/x-www-form-urlencoded
...                             Authorization=${AUTHORIZATION_HEADER_FIN}

# *** Tasks ***
# RPACallAPI...    RPACallAPI_CALL_FI    722    8008    RINGING    1    09064533322


*** Keywords ***
RPACallAPI_CALL_CTI
    [Arguments]    ${LinkedID}    ${ExtentionID}    ${CallStatus}    ${Direction}    ${PhoneNumber}    ${username}
    ${PAYLOADRINGING}=    Set Variable
    ...    {"LinkedID": "${LinkedID}", "QueueID": "", "CallPhone": "${PhoneNumber}", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "${CallStatus}", "TotalDuration": "0", "BillDuration": "0", "Username": "${username}", "Hotline": "", "ExtentionID": "${ExtentionID}", "InOutCall": "${Direction}", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}

    ${start_time}=    Get Time    epoch
    Create Session
    ...    api_session
    ...    ${API_URL_CTI}
    ...    headers=&{HEADERS_CTI}
    ${response}=    POST On Session
    ...    api_session
    ...    url=${API_URL_CTI}
    ...    data=${PAYLOADRINGING}
    ${end_time}=    Get Time    epoch
    ${elapsed_time}=    Subtract Time From Date    ${end_time}    ${start_time}    result_format=%S.%f
    Log To Console    Response: ${response} | Time taken: ${elapsed_time} seconds

RPACallAPI_CALL_FI
    [Arguments]    ${LinkedID}    ${ExtensionID}    ${CallStatus}    ${Direction}    ${PhoneNumber}
    &{PAYLOADRINGING}=    Create Dictionary
    ...    LinkedID=${LinkedID}
    ...    CallPhone=${PhoneNumber}
    ...    CallStartTime=2024-07-22 11:30:34
    ...    CallConnectTime=
    ...    CallEndTime=
    ...    CallStatus=${CallStatus}
    ...    Username=${ExtensionID}    ExtentionID=${ExtensionID}    InOutCall=${Direction}
    ${start_time}=    Get Time    epoch
    Create Session    api_session    ${API_URL_FIN}    headers=&{HEADERS_FIN}
    ${response}=    Post Request    api_session    ${API_URL_FIN}    data=&{PAYLOADRINGING}
    ${end_time}=    Get Time    epoch
    ${elapsed_time2}=    Subtract Time From Date    ${end_time}    ${start_time}    result_format=%S.%f
    Log To Console    Response: ${response} | Time taken: ${elapsed_time2} seconds

Generate_Random_Full_Name
    ${first_name}=    Evaluate    random.choice(${NAMES})
    ${last_name}=    Evaluate    random.choice(${LAST_NAMES})
    ${mid_name}=    Evaluate    random.choice(${MID_NAMES})
    ${full_name}=    Set Variable    ${last_name} ${mid_name} ${first_name}
    RETURN    ${full_name}

Generate_Random_Email
    ${EmailName}=    Evaluate    random.choice(${EmailName})
    ${EmailNameMiddle}=    Evaluate    random.choice(${EmailNameMiddle})
    ${Email_Domanins}=    Evaluate    random.choice(${Email_Domanins})
    ${full_email}=    Set Variable    ${EmailName}${EmailNameMiddle}${Email_Domanins}
    RETURN    ${full_email}

Generate_Random_Gender
    ${Gender}=    Evaluate    random.choice(${Gender})
    ${Gender_}=    Set Variable    ${Gender}
    RETURN    ${Gender_}

GET_TEXT_FORM_TAB_NAME
    [Arguments]    ${Locator}
    ${Name}=    RPA.Browser.Selenium.Get Text    ${Locator}
    RETURN    ${Name}

Generate_Street
    ${Street}=    Evaluate    random.choice(${Street})
    ${Street_}=    Set Variable    ${Street}
    RETURN    ${Street}

Generate_Phone
    ${prefix}=    Set Variable    090
    ${phone_number}=    random_number    10000000    99999999
    ${phone}=    Set Variable    ${prefix}${phone_number}
    RETURN    ${phone}
    Log To Console    message: ${phone}
# Loop ListBox

random_number
    [Arguments]    ${min}    ${max}
    ${random_number}=    Evaluate    random.randint(${min}, ${max})
    RETURN    ${random_number}

Generate Random Note
    ${Note}=    Evaluate    random.choice(${Note})
    ${Note_}=    Set Variable    ${Note}
    RETURN    ${Note_}

Try Double Click Or Execute JavaScript From XPath
    [Arguments]    ${xpath}
    # Lấy danh sách phần tử dựa trên xpath
    ${elements}=    RPA.Browser.Selenium.Get WebElements    ${xpath}
    Log To Console    Found elements: ${elements}

    # Kiểm tra nếu danh sách phần tử rỗng
    ${count}=    Get Length    ${elements}
    IF    ${count} == 0
        Fail    No elements found for the given XPath: ${xpath}
    END

    # Lấy chỉ số ngẫu nhiên trong danh sách phần tử
    ${random_index}=    Evaluate    random.randint(0, ${count} - 1)
    Log To Console    Selected random element index: ${random_index}

    # Thực hiện Double Click hoặc sử dụng JavaScript
    TRY
        RPA.Browser.Selenium.Double Click Element    ${elements}[${random_index}]
        Log To Console    Successfully double-clicked element at index ${random_index}.
    EXCEPT    ElementNotInteractableException
        Log To Console    Failed to double-click element at index ${random_index}, using JavaScript instead.
        RPA.Browser.Selenium.Execute Javascript
        ...    arguments[0].dispatchEvent(new MouseEvent('dblclick', { bubbles: true, cancelable: true }));
        ...    ${elements}[${random_index}]
    END

Try Click Element Or Execute JavaScript_index
    [Arguments]    ${elements}    ${index}
    TRY
        # Cố gắng click trực tiếp vào phần tử
        RPA.Browser.Selenium.Click Element    ${elements[${index}]}
    EXCEPT    ElementNotInteractableException
        # Nếu không click được thì fallback sang JavaScript
        RPA.Browser.Selenium.Execute Javascript
        ...    arguments[0].click();
        ...    ${elements[${index}]}
    END

Input Text Or Execute JavaScript
    [Arguments]    ${locator}    ${text}
    TRY
        # Thử nhập văn bản thông thường với Selenium
        RPA.Browser.Selenium.Input Text    ${locator}    ${text}
        Log To Console    Successfully input text using Selenium for locator: ${locator}.
    EXCEPT    ElementNotInteractableException
        # Nếu không nhập được, fallback sang JavaScript
        Log To Console    Failed to input text for locator: ${locator}, using JavaScript instead.
        RPA.Browser.Selenium.Execute Javascript
        ...    var element = document.querySelector(arguments[0]);
        ...    if (element) {
        ...    element.value = arguments[1];
        ...    element.dispatchEvent(new Event('input', { bubbles: true }));
        ...    }
        ...    ${locator}    ${text}
    END

Try Click Element Or Execute JavaScript_Xpath
    [Arguments]    ${xpath}
    TRY
        # Lấy phần tử bằng XPath
        ${element}=    RPA.Browser.Selenium.Get WebElement    ${xpath}
        # Thử click trực tiếp vào phần tử
        RPA.Browser.Selenium.Click Element    ${element}
        Log To Console    Successfully clicked element with xpath: ${xpath}.
    EXCEPT    ElementNotInteractableException
        # Nếu không click được thì fallback sang JavaScript
        Log To Console    Failed to click element with xpath: ${xpath}, using JavaScript instead.
        RPA.Browser.Selenium.Execute Javascript
        ...    var element = document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        ...    if (element) { element.click(); }
        ...    ${xpath}
    END

# Generate Extension

Generate_Extension
    ${Extension}=    Evaluate    random.choice(${Extension1})
    ${Extension_}=    Set Variable    ${Extension}
    RETURN    ${Extension_}

Generate_Random_Email_CALL
    ${EmailName_Call}=    Evaluate    random.choice(${EmailNameCall})
    ${Email_}=    Set Variable    ${EmailName_Call}
    RETURN    ${Email_}

Test
    Open Workbook    ${DATA}
    ${rows}=    Read Worksheet As Table    header=True    name=${SheetName}
    FOR    ${row}    IN    @{rows}
        ${ID1}=    Get From Dictionary    ${row}    ID
        ${SDT1}=    Get From Dictionary    ${row}    SDT

        Sleep    2s
        RPA.Browser.Selenium.Click Element
        ...    xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[1]/div/img
        # RPA.Browser.Selenium.Click Element
        # ...    xpath=xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[2]/span/input
        RPA.Browser.Selenium.Input Text
        ...    xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[2]/span/input
        ...    ${ID1}
        RPA.Browser.Selenium.Press Keys
        ...    xpath=//input[@placeholder='Mã phiếu ghi']
        ...    ENTER
        Sleep    1s
        RPA.Browser.Selenium.Click Element    xpath=//img[@alt='Edit']
        Sleep    1s
        RPA.Browser.Selenium.Wait Until Element Is Visible    xpath=(//div[@class='staging_crm'])[1]    timeout=6s
        RPA.Browser.Selenium.Click Element
        ...    xpath=(//div[@class='staging_crm'])[1]
        Sleep    3s
        RPA.Browser.Selenium.Click Element    //input[@placeholder='Search this list...']
        RPA.Browser.Selenium.Input Text
        ...    //input[@placeholder='Search this list...']    0${SDT1}
        RPA.Browser.Selenium.Press Keys    //input[@placeholder='Search this list...']    ENTER
        Sleep    1s
        ${rows1}=    RPA.Browser.Selenium.Get Web Elements    xpath=(//tbody[contains(@class, 'table-body')])[2]/tr
        Log To Console    message: ${rows1}
        ${row_count}=    Get Length    ${rows1}
        IF    ${row_count} > 0    Action
        IF    ${row_count} == 0    RPA.Browser.Selenium.Reload Page
    END

Action
    RPA.Browser.Selenium.Click Element
    ...    //input[@type='radio' and @class='ant-radio-input']
    RPA.Browser.Selenium.Click Element
    ...    //button[@type='button']//span[text()='Save']
    RPA.Browser.Selenium.Click Element    //*[@id="basic"]/div[4]/button[1]
    RPA.Browser.Selenium.Reload Page

Test2
    Open Workbook    ${DATA2}
    ${rows}=    Read Worksheet As Table    header=True    name=${SheetNameee}
    FOR    ${row1}    IN    @{rows}
        ${ID1}=    Get From Dictionary    ${row1}    ID_2
        ${SDT1}=    Get From Dictionary    ${row1}    SDT

        Sleep    2s
        RPA.Browser.Selenium.Click Element
        ...    xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[1]/div/img
        # RPA.Browser.Selenium.Click Element
        # ...    xpath=xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[2]/span/input
        RPA.Browser.Selenium.Input Text
        ...    xpath=//*[@id="root"]/section/section/section/main/div[3]/div[1]/div/table/thead/tr/th[2]/div/div[2]/span/input
        ...    ${ID1}
        RPA.Browser.Selenium.Press Keys
        ...    xpath=//input[@placeholder='Mã phiếu ghi']
        ...    ENTER
        Sleep    3s
        RPA.Browser.Selenium.Click Element    xpath=//img[@alt='Edit']
        Sleep    2s
        RPA.Browser.Selenium.Wait Until Element Is Visible    xpath=(//div[@class='staging_crm'])[1]    timeout=6s
        RPA.Browser.Selenium.Click Element
        ...    xpath=(//div[@class='staging_crm'])[1]
        Sleep    3s
        RPA.Browser.Selenium.Click Element    //input[@placeholder='Search this list...']
        RPA.Browser.Selenium.Input Text
        ...    //input[@placeholder='Search this list...']    0${SDT1}
        RPA.Browser.Selenium.Press Keys    //input[@placeholder='Search this list...']    ENTER
        Sleep    1s
        ${rows12}=    RPA.Browser.Selenium.Get Web Elements    xpath=(//tbody[contains(@class, 'table-body')])[2]/tr
        Log To Console    message: ${rows12}
        ${row_count}=    Get Length    ${rows12}
        IF    ${row_count} > 0    Action
        IF    ${row_count} == 0    RPA.Browser.Selenium.Reload Page
    END

ConfigCTI
    RPA.Browser.Selenium.Wait Until Element Is Visible    //input[@type='search']    timeout=20s
    RPA.Browser.Selenium.Click Element    //input[@type='search']
    RPA.Browser.Selenium.Input Text    //input[@type='search']    Khách Hàng
    RPA.Browser.Selenium.Press Keys    //input[@type='search']    ENTER
    Sleep    5s
    RPA.Browser.Selenium.Click Element    id:rc-tabs-0-tab-mapping-user

    Open Workbook    ${DATA3}
    ${rows}=    Read Worksheet As Table    header=True    name=${SheetNameeee}
    FOR    ${row2}    IN    @{rows}
        ${Extension}=    Get From Dictionary    ${row2}    Extension
        Sleep    3s
        RPA.Browser.Selenium.Wait Until Element Is Not Visible
        ...    //img[@src='/ucrm-cti/static/media/crmlogo.7904565d.png']
        ...    timeout=25s
        RPA.Browser.Selenium.Wait Until Element Is Visible    id:user_name    timeout=6s

        RPA.Browser.Selenium.Input Text    id:user_name    ${Extension}
        RPA.Browser.Selenium.Press Keys    id:user_name    ENTER
        RPA.Browser.Selenium.Input Text    id:agent_name    ${Extension}
        RPA.Browser.Selenium.Input Text    id:extension    ${Extension}

        RPA.Browser.Selenium.Click Element    (//button[@type='submit'])[2]
    END

How Many User Login And Call API_OpenBROWSER
    [Arguments]    ${number_users}    ${callcurrent}
    ${extension}=    Get From List    ${Extension2}    ${number_users}
    # RPA.Browser.Selenium.Open Headless Chrome Browser    ${urlCTI}
    RPA.Browser.Selenium.Open Browser    ${urlCTI}    chrome
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${BtnLoginOutSide}    timeout=10s
    RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
    ${email}=    Set Variable    user${extension}@email.com
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${email}
    Log    Email nè : ${email}
    RPA.Browser.Selenium.Input Text    ${Pwdlogin}    12345678x@X
    RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}
    RPA.Browser.Selenium.Wait Until Element Is Visible
    ...    //div[@class='ant-empty-description']/p[text()='Hiện chưa có cuộc gọi']
    ...    timeout=30s
    Log To Console    Login Success with extension: ${email}
    How many calls currently and how long does the Popup tab display    ${extension}    ${callcurrent}

Get Selected Users From List
    [Arguments]    ${number_of_users}
    ${selected_users}=    Create List
    FOR    ${index}    IN RANGE    ${number_of_users}
        Append To List    ${selected_users}    ${index}
    END
    RETURN    ${selected_users}
