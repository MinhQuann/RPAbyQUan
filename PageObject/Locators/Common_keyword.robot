*** Settings ***
Resource    PageObject/Locators/SettingsCRMLocators.robot
Resource    PageObject/Data/Data.robot
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


*** Variables ***
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
# RPA CAll API
# ${LinkeđID}    1721622634.191953
# ${ExtentionID}    8014
${API_URL_CTI}                  https://lab.connect247.vn/ucrmapi-cti/cti/call-data
# ${API_URL_CTI}    https://lab.connect247.vn/ucrm-demo/ucrmapi-ver3-build/cti/call-data
${API_URL_FIN}                  https://lab.connect247.vn/ucrmapi-ver3/finesse-integration/handle-response-from-server
# ${PAYLOADRINGING}    {"LinkedID": "${LinkeđID} ", "QueueID": "", "CallPhone": "0399478262", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "RINGING", "TotalDuration": "0", "BillDuration": "0", "Username": "user8014@email.com", "Hotline": null, "ExtentionID": "${ExtentionID}", "InOutCall": "1", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
# ${PAYLOADRINGING_DICT}=    Evaluate    json.loads('${PAYLOADRINGING}')
${AUTHORIZATION_HEADER_CTI}     Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjIwMzY5ODQyMTMsIlRlbmFudHMiOiJ0bnRfdGVzdGFjZmN0ZXN0OV82NDQyOTMyMiIsIklEIjoiNjY5ODg5NTIyOGM5ZGEyY2RkNjEyYTkyIiwiRW1haWwiOiJ0ZXN0YWNmYzlAeW9wbWFpbC5jb20iLCJJc19BZG1pbiI6dHJ1ZX0.mumhNV909rOtFAUFNKpOharTYWPRNo85S2Zi9QY5bJs
&{HEADERS_CTI}                  Content-Type=application/json    Authorization=${AUTHORIZATION_HEADER_CTI}

# *** Tasks ***

# RPACallAPI_CALL_CTI
# ...    RPACallAPI_CALL_CTI    700000000000    8009    SUCCESS    1    0908776510    user8010@yopmail.com


*** Keywords ***
RPACallAPI_CALL_CTI
    [Arguments]    ${LinkedID}    ${ExtentionID}    ${CallStatus}    ${Direction}    ${PhoneNumber}    ${username}
    ${PAYLOADRINGING}=    Set Variable
    ...    {"LinkedID": "${LinkedID}", "QueueID": "", "CallPhone": "${PhoneNumber}", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "${CallStatus}", "TotalDuration": "0", "BillDuration": "0", "Username": "${username}", "Hotline": "", "ExtentionID": "${ExtentionID}", "InOutCall": "${Direction}", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
    Create Session
    ...    api_session
    ...    ${API_URL_CTI}
    ...    headers=&{HEADERS_CTI}
    ...    verify=False
    ${response}=    POST On Session
    ...    api_session
    ...    url=${API_URL_CTI}
    ...    data=${PAYLOADRINGING}

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

Generate_Street
    ${Street}=    Evaluate    random.choice(${Street})
    ${Street_}=    Set Variable    ${Street}
    RETURN    ${Street}

Generate_Phone
    ${prefix}=    Set Variable    090
    ${phone_number}=    random_number    1000000    9999999
    ${phone}=    Set Variable    ${prefix}${phone_number}
    RETURN    ${phone}
    Log To Console    message: ${phone}
# Loop ListBox

random_number
    [Arguments]    ${min}    ${max}
    ${random_number}=    Evaluate    random.randint(${min}, ${max})
    RETURN    ${random_number}

Get Random Element
    [Arguments]    ${elements}
    ${count}=    Get Length    ${elements}
    Log To Console    message=${count}
    ${random_index}=    Evaluate    random.randint(0, ${count} - 1)
    ${random_element}=    Get From List    ${elements}    ${random_index}
    RETURN    ${random_element}

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

Try Click Element Or Execute JavaScript
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

Generate_EXTENTION
    ${Extension}=    Evaluate    random.choice(${Extension})
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
    Open Workbook    ${DATA3}
    ${rows}=    Read Worksheet As Table    header=True    name=${SheetNameeee}
    FOR    ${row2}    IN    @{rows}
        ${Extension}=    Get From Dictionary    ${row2}    Extension
        Sleep    3s
        RPA.Browser.Selenium.Wait Until Element Is Not Visible
        ...    //img[@src='/ucrm-cti/static/media/crmlogo.7904565d.png']
        ...    timeout=10s
        RPA.Browser.Selenium.Wait Until Element Is Visible    id:user_name    timeout=6s

        RPA.Browser.Selenium.Input Text    id:user_name    ${Extension}
        RPA.Browser.Selenium.Press Keys    id:user_name    ENTER
        RPA.Browser.Selenium.Input Text    id:agent_name    ${Extension}
        RPA.Browser.Selenium.Input Text    id:extension    ${Extension}

        RPA.Browser.Selenium.Click Element    //*[@id="rc-tabs-0-panel-mapping-user"]/form/button
    END
