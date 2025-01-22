*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RPA.Browser.Selenium
Resource    ./PageObject/Locators/LoginPageLocators.robot
Resource    ./PageObject/Locators/SettingsCRMLocators.robot
Resource    ./PageObject/Locators/ObjectLocators.robot
Resource    ./PageObject/ActionFile/ActionLogin.robot
Resource    ./PageObject/Locators/CallCenterLocator.robot
Resource    ./PageObject/Locators/Common_keyword.robot


*** Tasks ***
TH_Contact_0CRM_0CORE_1
    Open CRM
    Login CRM
    ${original_tab}=    RPA.Browser.Selenium.Get Window Handles
    # Trường hợp KH mới gọi vào
    RPACallAPI_CALL_CTI    700000000000    8010    RINGING    1    0908776510    user8010@yopmail.com
    Sleep    2s
    ${all_tab}=    RPA.Browser.Selenium.Get Window Handles
    RPA.Browser.Selenium.Switch Window    ${original_tab}[0]
    RPACallAPI_CALL_CTI    700000000000    8010    ANSWER    1    0908776510    user8010@yopmail.com
    Sleep    1s
    Edit_New_Cus_Name
    EditContactInfo
    Sleep    3s
    Add_New_Ticket_History
    RPACallAPI_CALL_CTI    700000000000    8010    SUCCCESS    1    0908776510    user8010@yopmail.com
    Sleep    6s
    # Trường hợp KH mượn điện thoại gọi lại

    RPACallAPI_CALL_CTI    8000265225223250522    8010    RINGING    1    0906453336       user8010@yopmail.com
    # RPA.Browser.Selenium.Wait Until Element Is Visible    id:ucrm_callcenter_1    timeout=30s
    # Try Click Element Or Execute JavaScript_Xpath    id:ucrm_callcenter_1
    Sleep    3s
    RPACallAPI_CALL_CTI    8000265225223250522    8010    ANSWER    1    0906453336    user8010@yopmail.com
    Sleep    5s
    Search Contact CRM    0906453315
    Sleep    3s
    Add_New_Ticket_History
    RPACallAPI_CALL_CTI    8000265225223250522    8010    SUCCCESS    1    0906453336    user8010@yopmail.com
    Sleep    2s

    # Trường hợp trùng 2 Contact
    RPACallAPI_CALL_CTI    90007    8010    RINGING    1    0906453332    user8010@yopmail.com
    Sleep    2s
    RPACallAPI_CALL_CTI    90007    8010    ANSWER    1    0906453332    user8010@yopmail.com
    RPA.Browser.Selenium.Execute Javascript
    ...    var element=
    ...    document.evaluate("//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0') and position() > 1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    if(element){
    ...    var event= new MouseEvent('dblclick', { bubbles: true, cancelable: true });
    ...    element.dispatchEvent(event);
    ...    }
    Sleep    4s
    Add_New_Ticket_History
    RPACallAPI_CALL_CTI    90007    8010    SUCCCESS    1    0906453332    user8010@yopmail.com
    Sleep    4s
    # KH có nhiều số điện thoại và gọi vào
    RPACallAPI_CALL_CTI    10003    8010    RINGING    1    0906453335    user8010@yopmail.com
    Sleep    4s
    RPACallAPI_CALL_CTI    10003    8010    ANSWER    1    0906453335    user8010@yopmail.com
    Search Contact CRM    0906453335
    RPA.Browser.Selenium.Execute Javascript
    ...    var element=
    ...    document.evaluate("//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0') and position() > 1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    if(element){
    ...    var event= new MouseEvent('dblclick', { bubbles: true, cancelable: true });
    ...    element.dispatchEvent(event);
    ...    }
    Add_New_Ticket_History
    RPACallAPI_CALL_CTI    10003    8010    SUCCCESS    1    0906453335    user8010@yopmail.com
    Sleep    4s
    # TH KH mong muốn xử lý 2 Yêu cầu Ticket Khác nhau
    RPACallAPI_CALL_CTI    100000    8010    RINGING    1    0906453336    user8010@yopmail.com
    Sleep    4s
    RPACallAPI_CALL_CTI    100000    8010    ANSWER    1    0906453336    user8010@yopmail.com
    Edit_New_Cus_Name
    EditContactInfo
    Sleep    4s
    Add_New_Ticket_History
    Sleep    4s
    Add_New_Ticket_History
    RPACallAPI_CALL_CTI    114    100000    SUCCCESS    1    0906453336    user8010@yopmail.com
    Sleep    4s
    RPA.Browser.Selenium.Close Browser
    # TH KH gọi vào và muôn trao đổi về Ticket cũ (đang fix con)
    # RPACallAPI_CALL_CTI    115    8010    RINGING    1    0906453337
    # Sleep    4s
    # RPACallAPI_CALL_CTI    115    8010    ANSWER    1    0906453337
