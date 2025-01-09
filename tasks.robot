*** Settings ***
Resource    PageObject/Locators/Common_keyword.robot
Resource    PageObject/Locators/LoginPageLocators.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     DateTime


*** Tasks ***
# Test1
#    Open CRM urlPROD
#    Login urlPROD
#    Sleep    2s
#    ${original_tab}=    RPA.Browser.Selenium.Get Window Handles
#    Sleep    2s
#    RPA.Browser.Selenium.Click Element    xpath=//*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[2]
#    Sleep    3s
#    ${new_tabs}=    RPA.Browser.Selenium.Get Window Handles
#    ${new_tab}=    Evaluate    [tab for tab in ${new_tabs} if tab not in ${original_tab}][0]
#    RPA.Browser.Selenium.Switch Window    ${new_tab}
#    Sleep    6s
#    RPA.Browser.Selenium.Click Element
#    ...    xpath=//*[@id="root"]/section/header/div[2]/div[1]/div[2]/div[2]/div/ul/li[2]/div/span

#    Sleep    3s
#    Test

# ConfigCTI
#    Open CRM CTI
#    Login CRM CTI
#    Sleep    2s
#    ConfigCTI
BotCall
    FOR    ${i}    IN RANGE    1000
        ${LINKEDID RANDOM} =    random_number    1    1000000000
        ${RANDOMPHONE} =    Generate_Phone
        ${Extension} =    Generate_Extension
        Log To Console    Phone= ${RANDOMPHONE}
        Log To Console    LinkedID= ${LINKEDID RANDOM}
        Log To Console    Extension= ${Extension}
        Log To Console    Count= ${i}
        RPACallAPI_CALL_CTI
        ...    ${LINKEDID RANDOM}
        ...    ${Extension}
        ...    RINGING
        ...    1
        ...    ${RANDOMPHONE}
        ...    user${Extension}@email.com
    END

# ConFigFI
#     Open CRM CTI
#     Login CRM CTI
#     Sleep    6s
#     ConfigCTI
# BotCall2
#    ${LINKEDID RANDOM} =    random_number    1    1000000000
#    ${RANDOMPHONE} =    Generate_Phone
#    Log To Console    ${RANDOMPHONE}
#    # FOR    ${i}    IN RANGE    30
#    RPACallAPI_CALL_CTI    ${LINKEDID RANDOM}    8008    RINGING    1    ${RANDOMPHONE}    user8008yopmail.com
    # END
