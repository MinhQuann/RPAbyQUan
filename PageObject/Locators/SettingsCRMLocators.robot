*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium


*** Variables ***
${User} =                   id:ucrm_setting_0_0
${Role} =                   id:ucrm_setting_0_1
${Profile} =                id:ucrm_setting_0_2
${Group} =                  id:ucrm_setting_0_3
${Sharing} =                id:ucrm_setting_0_4
${CriteriaSharing} =        id:ucrm_setting_0_5
${BrandName&Theme} =        id:ucrm_setting_0_6
${AssignmentRule} =         id:ucrm_setting_0_7
${ObjectManagement} =       id:ucrm_setting_1_0
${Object&Layout} =          id:ucrm_setting_1_1
${CreateTempRecord} =       id:ucrm_setting_1_2
${FormSetting} =            id:ucrm_setting_1_3
${RelatedObject} =          id:ucrm_setting_1_4
${PickListDependency} =     id:ucrm_setting_1_5
${DisplayKanban} =          id:ucrm_setting_1_6
${HighlightSetting} =       id:ucrm_setting_1_7
${CampaignSetting} =        id:ucrm_setting_1_8
${DuplicateRules} =         id:ucrm_setting_1_9
${KNB} =                    id:ucrm_setting_1_10
${DroplistSetting} =        id:ucrm_setting_1_14
${WorkFlow} =               id:ucrm_setting_2_0
${SLASetting} =             id:ucrm_setting_2_1
${DynamicButton} =          id:ucrm_setting_2_2
${ApprovalProcess} =        id:ucrm_setting_2_3
${ActionLog} =              id:ucrm_setting_2_4
${EmailTemplate} =          id:ucrm_setting_3_0
${EmailIncom} =             id:ucrm_setting_3_1
${EmailOut} =               id:ucrm_setting_3_2
${Consolidatedview} =       id:ucrm_setting_5_0


*** Keywords ***
Click User
    RPA.Browser.Selenium.Click Element    ${User}

Click Role 
   RPA.Browser.Selenium.Click Element   ${Role}

Click Profile
    RPA.Browser.Selenium.Click Element   ${Profile}

Click Group
    RPA.Browser.Selenium.Click Element    ${Group}

Click Sharing
    RPA.Browser.Selenium.Click Element    ${Sharing}

Click CriteriaSharing
    RPA.Browser.Selenium.Click Element    ${CriteriaSharing}

Click BrandName&Theme
    RPA.Browser.Selenium.Click Element   ${BrandName&Theme}

Click AssignmentRule
    RPA.Browser.Selenium.Click Element   ${AssignmentRule}

Click ObjectManagement
    RPA.Browser.Selenium.Click Element   ${ObjectManagement}

Click Object&Layout
    RPA.Browser.Selenium.Click Element    ${Object&Layout}

Click CreateTempRecord
    RPA.Browser.Selenium.Click Element    ${CreateTempRecord}

Click FormSetting
    RPA.Browser.Selenium.Click Element    ${FormSetting}

Click RelatedObject
    RPA.Browser.Selenium.Click Element    ${RelatedObject}

Click PickListDependency
    RPA.Browser.Selenium.Click Element    ${PickListDependency}

Click DisplayKanban
    RPA.Browser.Selenium.Click Element    ${DisplayKanban}

Click HighlightSetting
   RPA.Browser.Selenium.Click Element    ${HighlightSetting}

Click CampaignSetting
    RPA.Browser.Selenium.Click Element    ${CampaignSetting}

Click DuplicateRules
    RPA.Browser.Selenium.Click Element    ${DuplicateRules}

Click KNB
    RPA.Browser.Selenium.Click Element    ${KNB}

Click DroplistSetting
    RPA.Browser.Selenium.Click Element    ${DroplistSetting}

Click WorkFlow
    RPA.Browser.Selenium.Click Element    ${WorkFlow}

Click SLASetting
    RPA.Browser.Selenium.Click Element    ${SLASetting}

Click DynamicButton
    RPA.Browser.Selenium.Click Element    ${DynamicButton}

Click ApprovalProcess
    RPA.Browser.Selenium.Click Element    ${ApprovalProcess}

Click ActionLog
    RPA.Browser.Selenium.Click Element    ${ActionLog}

Click EmailTemplate
    RPA.Browser.Selenium.Click Element    ${EmailTemplate}

Click EmailIncom
    RPA.Browser.Selenium.Click Element    ${EmailIncom}

Click EmailOut
    RPA.Browser.Selenium.Click Element    ${EmailOut}

Click Consolidatedview
    RPA.Browser.Selenium.Click Element    ${Consolidatedview}
