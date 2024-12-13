*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections


*** Variables ***
# Call Center
# Trường hợp new Contact
# Multi Detail Contact
${NewCustomerTab} =     id:ucrm_callcenter_0
${NewCustomerName} =    (//*[@id="ucrm_multiDetails_0"]/div)[1]
${PhoneNumber}=         (//*[@id="ucrm_multiDetails_0"]/div)[4]
${Email}=               (//*[@id="ucrm_multiDetails_2"]/div)[1]
${Settings}=            id:ucrm_multiDetail_setting
${EditRecord}=          id:ucrm_multiDetails_EDITRECORD
${EditRecordBtn}=       //*[@id="ucrm_multiDetails_EDITRECORD"]

# Form Contact
${FieldName}=           id:fld_contact_first_name_00000001_form_interaction
${FieldEmail}=          id:fld_contact_email_00000001_form_interaction
${FieldDepartment}=     id:fld_contact_department_00000001_form_interaction
${FieldGender}=         //*[@id="basic_fld_contact_gender_00000001"]
${FỉeldOtherPhone1}=    ${EMPTY}
${FieldOtherPhone2}=    ${EMPTY}
${SaveContact}=         //*[@id="basic"]/div[4]/button[1]

# TicketHistory
${+}                    id:
${link}                 ${EMPTY}


*** Keywords ***
# GET_TEXT_FORM_TAB_NAME
#    GET_TEXT_FORM_TAB_NAME    ${NewCustomerTab}

EditContactInfo_1_TH_0_ContactCRM
    # RPA.Browser.Selenium.Wait Until Element Is Visible    ${NewCustomerTab}
    Sleep    5s
    RPA.Browser.Selenium.Click Element    ${Settings}
    Sleep    4s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EditRecord}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EditRecordBtn}
    RPA.Browser.Selenium.Click Element    ${EditRecordBtn}
    ${RandomName}=    Generate_Random_Full_Name
    Sleep    5s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${FieldName}
    FOR    ${i}    IN RANGE    0    50
        ${current_value}=    RPA.Browser.Selenium.Get Element Attribute    ${FieldName}    value
        IF    '${current_value}' != ''
            RPA.Browser.Selenium.Click Element    ${FieldName}
            RPA.Browser.Selenium.Press Keys    ${FieldName}    CONTROL+A
            RPA.Browser.Selenium.Execute JavaScript
            ...    document.getElementById("fld_contact_first_name_00000001_form_interaction").value = ''
        END
        Sleep    1s
        ${current_value}=    RPA.Browser.Selenium.Get Element Attribute    ${FieldName}    value
        IF    '${current_value}' == ''    BREAK
    END
    RPA.Browser.Selenium.Input Text    ${FieldName}    ${RandomName}
    ${RandomEmail}=    Generate_Random_Email
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${FieldEmail}
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldEmail}    ${RandomEmail}
    ${RandomGender}=    Generate_Random_Gender
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldGender}    ${RandomGender}
    RPA.Browser.Selenium.Press Keys    ${FieldGender}    Enter
    ${RandomDepartment}=    Generate_DepartMent
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldDepartment}    ${RandomDepartment}
    RPA.Browser.Selenium.Click Element    ${SaveContact}



# CreateTicket
