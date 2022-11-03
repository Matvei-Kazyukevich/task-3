module Services.Products (getProducts, getProduct, fromProductToProductModel) where

import Data.Entities (Product(..), Shop(..), productID, productName, productPrice, productColor)
import Data.Models (ProductModel(..), ShopModel(..))
import qualified Repositories.Products as PR
import qualified Repositories.Shops as SR
import Prelude hiding (product)


fromProductToProductModel :: Product -> Maybe Shop -> ProductModel
fromProductToProductModel product maybeShop =
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
fromShopToShopModel shop maybeProduct =
    ShopModel {
        shopModelID = shopID shop,
        shopModelName = shopName shop,
        shopModelAddress = shopAddress shop,
        shopProductModel = shopProduct
    } where
        shopProduct :: Maybe [ProductModel]
        shopProduct = 
            case maybeProduct of
                Nothing -> Nothing
                Just products -> Just $ map (`fromProductToProductModel` Nothing) products


getProducts :: [ProductModel]
getProducts = map (`fromProductToProductModel` Nothing) PR.getProducts 

getProduct :: Int -> Maybe ProductModel
getProduct pid =
    let maybeProduct = PR.getProduct pid
    in case maybeProduct of
        Nothing -> Nothing
        Just product -> Just $ fromProductToProductModel product shop
            where
                shop = Just $ head $ filter(\x -> shopProductID x == pid) SR.getShops