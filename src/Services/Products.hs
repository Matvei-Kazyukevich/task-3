module Services.Products (getProducts, getProduct) where

import Data.Models (ProductModel(..))
import Services.Base (fromProductToProductModel) 
import Data.Entities (shopProductID)
import Prelude hiding (product)
import qualified Repositories.Products as PR
import qualified Repositories.Shops as SR

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