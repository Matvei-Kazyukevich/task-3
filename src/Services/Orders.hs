module Services.Orders (getOrders, getOrder) where

import Data.Models (OrderModel(..))
import Services.Base (fromOrderToOrderModel)
import Data.Entities (productOrderID)
import qualified Repositories.Orders as OR
import qualified Repositories.Products as PR

getOrders :: [OrderModel] 
getOrders = map (`fromOrderToOrderModel` Nothing) OR.getOrders

getOrder :: Int -> Maybe OrderModel
getOrder oid = 
    let maybeOrder = OR.getOrder oid
    in case maybeOrder of
        Nothing -> Nothing
        Just order -> Just $ fromOrderToOrderModel order products
            where 
                products = Just $ filter (\x -> productOrderID x == oid) PR.getProducts
