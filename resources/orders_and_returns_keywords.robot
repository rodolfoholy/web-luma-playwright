*** Settings ***
Resource        ../main.robot

*** Keywords ***
Given the user will open the main page and scroll down to the Orders and Returns link
    Navigate To Guest Form

When the user fill the form with valid information using Zip Code
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${VALID_ZIP}        ZIP Code

When the user fill the form with valid information using Email
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${VALID_EMAIL}    Email

When the user fill the form using valid Zip Code but select Email
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${VALID_ZIP}      Email

When the user fill the form using valid Email but select Zip Code
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${VALID_EMAIL}    ZIP Code

When the user fill the form with incomplete Order ID
    Fill And Submit Form    ${INCOMPLETE_ORDER_ID}   ${BILLING_LAST_NAME_VALID}      ${VALID_EMAIL}    Email

When the user fill the form with invalid Order ID
    Fill And Submit Form    ${INVALID_ORDER_ID}      ${BILLING_LAST_NAME_VALID}      ${VALID_EMAIL}    Email

When the user fill the form with invalid Billing Last Name
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_INVALID}    ${VALID_EMAIL}    Email

When the user fill the form with invalid Zip Code
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${INVALID_ZIP}    ZIP Code

When the user fill the form with invalid Email
    Fill And Submit Form    ${VALID_ORDER_ID}        ${BILLING_LAST_NAME_VALID}      ${INVALID_EMAIL}  Email

Then the user will see a error about incorrect data above the form
    Validate form error message

Then the user will see a error about incorrect Email below the Email field
    Validate email error message

Then the user will see the Order Details page with valid informations about the Order
    Validate Order Details    ${VALID_ORDER_ID}    ${BILLING_LAST_NAME_VALID}    ${VALID_ZIP}

