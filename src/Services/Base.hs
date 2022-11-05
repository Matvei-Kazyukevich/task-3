module Services.Base (fromProductToProductModel, fromShopToShopModel, fromOrderToOrderModel) where

import Data.Entities (Product(..), Shop(..), Order(..), productID, productName, productPrice, productColor)
import Data.Models (ProductModel(..), ShopModel (..), OrderModel(..))
import Prelude hiding (product)

fromProductToProductModel :: Product -> Maybe Shop -> ProductModel
fromProductToProductModel product maybeShop=
    let 
        pid = productID product
        name = productName product
        price = productPrice product
        color = productColor product
    in ProductModel pid name price color productShop
    where 
        productShop :: Maybe ShopModel 
        productShop = 
            case maybeShop of
                Nothing -> Nothing
                Just shop -> Just $ fromShopToShopModel shop Nothing

fromShopToShopModel :: Shop -> Maybe [Product] -> ShopModel
fromShopToShopModel shop maybeProduct=
    ShopModel {
        shopModelID = shopID shop,
        shopModelName = shopName shop,
        shopModelAddress = shopAddress shop,
        shopProductsModel = shopProducts
    } where
        shopProducts :: Maybe [ProductModel]
        shopProducts =
            case maybeProduct of
                Nothing -> Nothing
                Just products -> Just $ map (`fromProductToProductModel` Nothing) products

fromOrderToOrderModel :: Order -> Maybe [Product] -> OrderModel
fromOrderToOrderModel order maybeProduct =
    OrderModel {
        orderModelID = orderID order,
        orderModelNumber = orderNumber order,
        orderProductsModel = orderProducts 
    } where 
        orderProducts :: Maybe [ProductModel]
        orderProducts = 
            case maybeProduct of
                Nothing -> Nothing
                Just products -> Just $ map (`fromProductToProductModel` Nothing) products