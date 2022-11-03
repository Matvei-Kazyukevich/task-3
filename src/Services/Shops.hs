module Services.Shops (getShops, getShop) where

import Data.Entities (Shop(..), Product(..), productShopID)
import Data.Models (ShopModel(..), ProductModel(..))
import qualified Repositories.Shops as SR
import qualified Repositories.Products as PR
import Services.Products ( fromProductToProductModel )

fromShopToShopModel :: Shop -> Maybe [Product] -> ShopModel
fromShopToShopModel shop maybeProduct = 
    ShopModel {
        shopModelID = shopID shop,
        shopModelName = shopName shop,
        shopModelAddress = shopAddress shop,
        shopProductModel = shopProduct
    } 
    where
        shopProduct :: Maybe [ProductModel]
        shopProduct = 
            case maybeProduct of
                Nothing -> Nothing
                Just products -> Just $ map (`fromProductToProductModel` Nothing) products

getShops :: [ShopModel]
getShops = map (`fromShopToShopModel` Nothing) SR.getShops

getShop :: Int -> Maybe ShopModel
getShop sid =
    let maybeShop = SR.getShop sid
    in case maybeShop of
        Nothing -> Nothing
        Just shop -> Just $ fromShopToShopModel shop products
            where 
                products = Just $ filter(\x -> productShopID x == sid) PR.getProducts


