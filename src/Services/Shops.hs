module Services.Shops (getShops, getShop) where

import Data.Models (ShopModel(..))
import Services.Base (fromShopToShopModel)
import Data.Entities (productShopID)
import qualified Repositories.Shops as SR
import qualified Repositories.Products as PR

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


