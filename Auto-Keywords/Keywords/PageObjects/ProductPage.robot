*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot

*** Variables ***
${ProductText}             //div[@id='inventory_filter_container']/div
${SortList}                //div[@id='inventory_filter_container']/select
${MenuButton}              //button[text()='Open Menu']
${LogoutLink}              id:logout_sidebar_link
${ProdcuctLink}            //div[text()='PLACEHOLDER_CHANGE_ME']/ancestor::div[@class='inventory_item_label']/following-sibling::div//button
${CartLink}                //div[@id='shopping_cart_container']/a
${ProdcuctPriceText}       //div[text()='PLACEHOLDER_CHANGE_ME']/ancestor::div[@class='inventory_item_label']/following-sibling::div/div
${PRICE}
${AllAddToCartButtons}     //button[text()='ADD TO CART']
*** Keywords ***

Verify Product Page is Loaded
        WAIT UNTIL ELEMENT IS VISIBLE       ${productText}
        PAGE SHOULD CONTAIN ELEMENT         ${SortList}

Open Menu and click logout
        Click Element                       ${MenuButton}
        log to console                      menu opened
        WAIT UNTIL ELEMENT IS VISIBLE       ${LogoutLink}
        Click Element                       ${LogoutLink}
        Verify Login page is loaded
        log to console                      user successfully logged out

select the product and add to cart
        ${ActualProductLink}      Replace String  ${ProdcuctLink}     PLACEHOLDER_CHANGE_ME    ${PRODUCT_NAME}
        log to console              product to be purchased is ${PRODUCT_NAME}
        Get item price
        SCROLL ELEMENT INTO VIEW    ${ActualProductLink}
        Click Element               ${ActualProductLink}
        log to console              product added to cart

Sort items by price in accending order
        Select From List By Value   ${SortList}     hilo
        log to console              products are sorted in accending order by price

Open Cart
        SCROLL ELEMENT INTO VIEW    ${CartLink}
        Click Element               ${CartLink}
        log to console              opening cart
        verify Cart is loaded

Get item price
        ${ActualProdcuctPriceText}   Replace String  ${ProdcuctPriceText}     PLACEHOLDER_CHANGE_ME    ${PRODUCT_NAME}
        ${PRICE}                     Get Text        ${ActualProdcuctPriceText}
        SET GLOBAL VARIABLE          ${PRICE}
        log to console               price of ${PRODUCT_NAME} is ${PRICE}

add all products to cart
        ${count}                     Get Element Count         ${AllAddToCartButtons}
        @{AllProducts}               Get WebElements           ${AllAddToCartButtons}
        FOR    ${element}    IN    @{AllProducts}
             Run Keywords
             click Element          ${element}
        END
        log to console              ${count} products added to the cart

