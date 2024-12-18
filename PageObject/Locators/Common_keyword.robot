*** Settings ***
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Resource    d:/RPA2/PageObject/Data/Data.robot
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     RequestsLibrary
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     String
Library     Collections
Library     random


*** Variables ***
# Excel File
${ObjConfig}                    Object Test.xlsx
${GroupName}                    GroupName
${SheetName1}                   Group1
${SheetName2}                   Group2
${SheetName3}                   FieldContact

# RPA CAll API
# ${LinkeđID}    1721622634.191953
# ${ExtentionID}    8014
${API_URL_CTI}                  https://lab.connect247.vn/ucrmapi-ver3/cti/call-data
${API_URL_FIN}                  https://lab.connect247.vn/ucrmapi-ver3/finesse-integration/handle-response-from-server
# ${PAYLOADRINGING}    {"LinkedID": "${LinkeđID} ", "QueueID": "", "CallPhone": "0399478262", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "RINGING", "TotalDuration": "0", "BillDuration": "0", "Username": "user8014@email.com", "Hotline": null, "ExtentionID": "${ExtentionID}", "InOutCall": "1", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
# ${PAYLOADRINGING_DICT}=    Evaluate    json.loads('${PAYLOADRINGING}')
${AUTHORIZATION_HEADER_CTI}     Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjIwMzY5ODQyMTMsIlRlbmFudHMiOiJ0bnRfdGVzdGFjZmN0ZXN0OV82NDQyOTMyMiIsIklEIjoiNjY5ODg5NTIyOGM5ZGEyY2RkNjEyYTkyIiwiRW1haWwiOiJ0ZXN0YWNmYzlAeW9wbWFpbC5jb20iLCJJc19BZG1pbiI6dHJ1ZX0.mumhNV909rOtFAUFNKpOharTYWPRNo85S2Zi9QY5bJs
&{HEADERS_CTI}                  Content-Type=application/json    Authorization=${AUTHORIZATION_HEADER_CTI}

# *** Test Cases ***
# Test
#    ${randomLinkeđI}=    evaluate    random.randint(0, 1000000)
#    ${randomPhone}=    Generate_Phone
#    ${randomExtention}=    Generate_EXTENTION
#    ${username_}=    Generate_Random_Email_CALL
#    FOR    ${i}    IN RANGE    200
#    RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    RINGING    1    ${randomPhone}    ${username}
#    RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    ANSWER    1    ${randomPhone}    ${username}
#    RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    SUCCESS    1    ${randomPhone}    ${username}
#    END


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
    ${Phone}=    Evaluate    random.choice(${Phone})
    ${Phone_}=    Set Variable    ${Phone}
    RETURN    ${Phone_}

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
