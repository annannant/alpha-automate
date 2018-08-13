*** Settings ***
Test Setup          Open eCom Web
Library           Selenium2Library
Library           String
Resource          ../KeyWords/promotion.robot

*** Variable ***
${BROWSER}                   chrome
${EXPECT_LOADTIME}           12s

*** Keyword ***

*** Test Cases ***
# TC_PROMO_04
#     [Tags]   minimun_purchase
#     [Documentation]    BUYNOW_SUCCESS - minimum purchase, no maximum              Buy 1000 Get 100 บาท, เมื่อซื้อตั้งแต่ xxx ขึ้นไป
#     ${PRODUCT_UID}=         Convert To String        P1000125
#     ${PROMOCODE}=           Convert To String        BROWN
#     ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Tesco Lotus Gift Voucher จำนวน 100 บาท

#     Go to product and add to cart        ${PRODUCT_UID}
#     Go to product and add to cart        ${PRODUCT_UID}
#     Accept and Next
#     Fill Shipping Form
#     Fill promotion code and apply        ${PROMOCODE}
#     Display reward text on checkout page corectly         ${EXPECT_REWARD}
#     Checkout
#     Display reward text on checkout payment corectly       ${PROMOCODE}      ( ${EXPECT_REWARD} )
