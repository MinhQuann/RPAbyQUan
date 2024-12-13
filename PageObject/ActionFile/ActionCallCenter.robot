*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RPA.Browser.Selenium
Resource    d:/RPA2/PageObject/Locators/LoginPageLocators.robot
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Resource    d:/RPA2/PageObject/Locators/ObjectLocators.robot
Resource    d:/RPA2/PageObject/ActionFile/ActionLogin.robot
Resource    d:/RPA2/PageObject/Locators/CallCenterLocator.robot
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot


*** Tasks ***
TH_Contact_0CRM_0CORE_1
    Open CRM
    Login CRM
    ${original_tab}=    RPA.Browser.Selenium.Get Window Handles
    RPACallAPI_CALL_CTI    1234554    8010    RINGING    1    0906453310
    # Sleep    2s
    # ${all_tab}=    RPA.Browser.Selenium.Get Window Handles
    # RPA.Browser.Selenium.Switch Window    ${original_tab}[0]
    # RPACallAPI_CALL_CTI    1234554    8010    ANSWER    1    0906453310
    # Sleep    1s
    # Edit_New_Cus_Name
    # EditContactInfo
    Sleep    3s
    Add_New_Ticket_History

    # RPACallAPI_CALL_CTI    12    8010    SUCCCESS    1    0906453332
