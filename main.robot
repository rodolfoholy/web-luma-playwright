*** Settings ***
Library                            AllureLibrary
Library                            Browser
Library                            Library/BrowserLibraryHelper.py

Resource                           resources/orders_and_returns_keywords.robot

*** Variables ***
${HOME_URL}                        https://magento.softwaretestingboard.com/
${VALID_EMAIL}                     rodolfo.jobsity@gmail.com
${VALID_ORDER_ID}                  000013461
${VALID_ZIP}                       92660
${INVALID_EMAIL}                   rodolfo.jobsity#gmail.com
${INCOMPLETE_ORDER_ID}             13461
${INVALID_ORDER_ID}                Test@@@!
${INVALID_ZIP}                     04345020
${BILLING_LAST_NAME_VALID}         Jobsity
${BILLING_LAST_NAME_INVALID}       Jobsities
${FORM_ERROR_MESSAGE}              You entered incorrect data. Please try again.
${EMAIL_ERROR_MESSAGE}             Please enter a valid email address (Ex: johndoe@domain.com).

*** Keywords ***

Open The Test Browser
    ${isEmpty}                     Run Keyword And Return Status          Variable Should Not Exist       ${browser}
    Run Keyword If                 '${isEmpty}'=='True'                   Set Suite Variable              ${browser}           chromium
    New Browser                    browser=${browser}    headless=False
    New Page                       ${HOME_URL}
    Set Viewport Size              width=2400          height=1600

Back to main page
    Go To                          ${HOME_URL}

Navigate To Guest Form
    Click                          text="Orders and Returns"
    BrowserLibraryHelper.Take Screenshot

Fill And Submit Form
    [Arguments]     ${order_id}    ${last_name}    ${zip_email}    ${find_order_by}
    Wait For Elements State        id=oar-order-id            visible
    Fill Text                      id=oar-order-id            ${order_id}    
    Fill Text                      id=oar-billing-lastname    ${last_name}
    ${find_order_selection}=       Get Select Options         id=quick-search-type-id
    Log                            ${find_order_selection}
    Select Options By              id=quick-search-type-id    label         ${find_order_by}
    IF  '${find_order_by}'=='Email'
        Log    ${zip_email}
        Wait For Elements State    id=oar_email               visible
        Fill Text                  css=input.input-text[name="oar_email"]   ${zip_email}
    ELSE IF    '${find_order_by}'=='ZIP Code'
        Log    ${zip_email}
        Wait For Elements State    id=oar_zip                 visible
        Fill Text                  css=input.input-text[name="oar_zip"]     ${zip_email}
    END
    Click                          css=button.action.submit.primary
    Wait For Response              function(response) { return response.url().includes('form') && response.status() === 200 }
    BrowserLibraryHelper.Take Screenshot

Validate Order Details
    [Arguments]                    ${VALID_ORDER_ID}          ${BILLING_LAST_NAME_VALID}    ${VALID_ZIP}
    ${actual_order_id}             Get Text                   css=span.base[data-ui-id="page-title-wrapper"]
    ${shipping_address}            Get Text                   css=div.box-order-shipping-address div.box-content address
    ${billing_address}             Get Text                   css=div.box-order-billing-address div.box-content address
    Should Contain                 ${actual_order_id}         ${VALID_ORDER_ID}
    Should Contain                 ${shipping_address}        ${BILLING_LAST_NAME_VALID}
    Should Contain                 ${shipping_address}        ${VALID_ZIP}
    Should Contain                 ${billing_address}         ${BILLING_LAST_NAME_VALID}
    Should Contain                 ${billing_address}         ${VALID_ZIP}
    BrowserLibraryHelper.Take Screenshot

Validate form error message
    Wait For Elements State        css=div[data-bind="html: $parent.prepareMessageForHtml(message.text)"]            visible
    ${text}=    Get Text           css=div[data-bind="html: $parent.prepareMessageForHtml(message.text)"]
    Should Contain                 ${text}                    ${FORM_ERROR_MESSAGE}
    BrowserLibraryHelper.Take Screenshot

Validate email error message
    Wait For Elements State        css=#oar_email-error       visible
    ${text}=    Get Text           css=#oar_email-error
    Should Contain                 ${text}                    ${EMAIL_ERROR_MESSAGE}
    BrowserLibraryHelper.Take Screenshot
