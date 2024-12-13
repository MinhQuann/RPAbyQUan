*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     Random
Library     BuiltIn


*** Variables ***
# Call Center

# Multi Detail Contact
${NewCustomerTab} =     id:ucrm_callcenter_0
${NewCustomerName} =    (//*[@id="ucrm_multiDetails_0"]/div)[1]
${PhoneNumber}=         (//*[@id="ucrm_multiDetails_0"]/div)[4]
${Email}=               (//*[@id="ucrm_multiDetails_2"]/div)[1]
${Settings}=            id:ucrm_multiDetail_setting
${EditRecord}=          id:ucrm_multiDetails_EDITRECORD
${EditRecordBtn}=       //*[@id="ucrm_multiDetails_EDITRECORD"]
${Search}               //*[@id="basic"]/div[1]/div[2]/div/div/div[1]/div/div/span/span/span[2]/input

# Form Contact
${FieldName}=           id:fld_contact_first_name_00000001_form_interaction
${FieldEmail}=          id:fld_contact_email_00000001_form_interaction
${FieldStreet}=         id:fld_contact_street_00000001_form_interaction
${Description}=         id:fld_contact_description_00000001_form_interaction
${FieldGender}=         //*[@id="basic_fld_contact_gender_00000001"]
${FỉeldOtherPhone1}=    fld_contact_other_phone_00000001_form_interaction
${FieldOtherPhone2}=    fld_contact_other_phone2_00000001_form_interaction
${SaveContact}=         //*[@id="basic"]/div[4]/button[1]

# TicketHistory
${+}                    id:ucrm_ticketlist_addrecord
${test}                 //*[@id="basic"]/div[2]/div[2]/div/div[3]/div/div/div[2]/div/div/div/div
${NgônNgữ}              id:basic_fld_ngon_ngu_01
${PhânLoạiKH}           id:basic_fld_phan_loai_kh_new_01
${Level1}               id:basic_fld_1_spdv_01
${Level2}               id:basic_fld_2_spdv_chi_tiet_01
${Level3}               id:basic_fld_3_chuc_nang_tien_ich_01
${Level4}               id:basic_fld_4_van_de_kh_01
${PhânLoạiYêuCầu}       id:basic_fld_5_phan_loai_yeu_cau_01
${KênhKHthựchiện}       id:basic_fld_kenh_new_01
${KQtưvấnKH}            id:basic_fld_kq_tu_van_kh_01
${Thôngtinbổsung}       id:basic_fld_thong_tin_bo_sung_02
${GhiChú}               id:fld_ghichu_85169728_form_interaction


*** Keywords ***
# GET_TEXT_FORM_TAB_NAME
#    GET_TEXT_FORM_TAB_NAME    ${NewCustomerTab}

Edit_New_Cus_Name
    Sleep    5s
    RPA.Browser.Selenium.Click Element    ${Settings}
    Sleep    2s
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

EditContactInfo
    # RPA.Browser.Selenium.Wait Until Element Is Visible    ${NewCustomerTab}
    ${RandomEmail}=    Generate_Random_Email
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${FieldEmail}
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldEmail}    ${RandomEmail}
    ${RandomGender}=    Generate_Random_Gender
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldGender}    ${RandomGender}
    RPA.Browser.Selenium.Click Element    ${FieldGender}
    RPA.Browser.Selenium.Press Keys    ${FieldGender}    ENTER
    ${Generate_Street}=    Generate_Street
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldStreet}    ${Generate_Street}
    ${Generate_Phone}=    Generate_Phone
    RPA.Browser.Selenium.Input Text    ${FỉeldOtherPhone1}    ${Generate_Phone}
    RPA.Browser.Selenium.Click Element    ${SaveContact}

# Add New Ticket History

Add_New_Ticket_History
    RPA.Browser.Selenium.Click Element    ${+}
    Sleep    3s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${NgônNgữ}
    RPA.Browser.Selenium.Click Element    ${test}
    RPA.Browser.Selenium.Click Element    ${NgônNgữ}
    RPA.Browser.Selenium.Press Keys    ${test}    DOWN
    RPA.Browser.Selenium.Press Keys    ${test}    ENTER
