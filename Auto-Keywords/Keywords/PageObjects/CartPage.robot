*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot

*** Variables ***

${YourCartText}                   //div[text()='Your Cart']
${ContinueShoppinglink}           //a[@class='btn_secondary']
${ItemNameText}                   //a[contains(@id,'_title_link')]/div
${ItemPriceText}                  //a[contains(@id,'_title_link')]/following-sibling::div[@class='item_pricebar']/div
${CheckOutLink}                   //a[text()='CHECKOUT']
${RemoveButton}                   //button[text()='REMOVE']
*** Keywords ***

verify Cart is loaded
    Wait Until Page Contains Element   ${YourCartText}              ${DURATION_S}
    PAGE SHOULD CONTAIN ELEMENT        ${ContinueShoppinglink}
    log to console                     cart is loaded

verify name and price of Item added to cart
     Element Text Should Be             ${ItemNameText}             ${PRODUCT_NAME}
     log to console                     the product added is ${PRODUCT_NAME}
     log to console                      the price of product from product page is ${PRICE}
     ${cartprice}         GetText       ${ItemPriceText}
     log to console                     price in cart is      ${ItemPriceText}

move to product checkout
    Click Element        ${CheckOutLink}
    Verify checkout page is loaded

Remove products from cart
    log to console       removing product from cart
    ${productsinCart}    Get Element Count       ${RemoveButton}

    Run keyword If       ${productsinCart}>1
    ...     Run Keywords
    ...     log to console        ${productsinCart} products in cart
    ...     AND
    ...     Remove all products   ${productsinCart}
    ...     ELSE
    ...     Click Element         ${RemoveButton}
    ${productsinCart}    Get Element Count       ${RemoveButton}
    Should Be Equal As Integers      ${productsinCart}       0
    log to console       product successfully removed

Remove all products
    [Arguments]     ${count}
    @{ProductsInCart}      Get WebElements      ${RemoveButton}
    FOR    ${element}    IN    @{ProductsInCart}
         Run Keywords
         click Element      ${element}
    END
    log to console              ${count} products removed from cart


