*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Resource    d:/RPA2/PageObject/Locators/LoginPageLocators.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections


*** Test Cases ***
Test1
    Open CRM urlPROD
    Login urlPROD
    Sleep    2s
    ${original_tab}=    RPA.Browser.Selenium.Get Window Handles
    Sleep    2s
    RPA.Browser.Selenium.Click Element    xpath=//*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[2]
    Sleep    3s
    ${new_tabs}=    RPA.Browser.Selenium.Get Window Handles
    ${new_tab}=    Evaluate    [tab for tab in ${new_tabs} if tab not in ${original_tab}][0]
    RPA.Browser.Selenium.Switch Window    ${new_tab}
    Sleep    6s
    RPA.Browser.Selenium.Click Element
    ...    xpath=//*[@id="root"]/section/header/div[2]/div[1]/div[2]/div[2]/div/ul/li[2]/div/span

    Sleep    3s
    Test

Test2
    Open CRM urlPROD2
    Login urlPROD
    Sleep    2s
    ${original_tab}=    RPA.Browser.Selenium.Get Window Handles
    Sleep    2s
    RPA.Browser.Selenium.Click Element    xpath=//*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[2]
    Sleep    3s
    ${new_tabs}=    RPA.Browser.Selenium.Get Window Handles
    ${new_tab}=    Evaluate    [tab for tab in ${new_tabs} if tab not in ${original_tab}][0]
    RPA.Browser.Selenium.Switch Window    ${new_tab}
    Sleep    6s
    RPA.Browser.Selenium.Click Element
    ...    xpath=//*[@id="root"]/section/header/div[2]/div[1]/div[2]/div[2]/div/ul/li[2]/div/span

    Sleep    3s
    Test2
