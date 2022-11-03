module Services.Orders (getOrders, getOrder) where

import Data.Models (OrderModel(..), ProductModel(..))
import Data.Entities (Order(..), Product(..), productID)
import Services.Products (fromProductToProductModel) 
import qualified Repositories.Orders as OR
import qualified Repositories.Products as PR
import Prelude hiding (product)

fromOrderToOrderModel :: Order -> Maybe [Product] -> OrderModel
fromOrderToOrderModel order maybeProduct = 
    OrderModel {
        orderModelID = orderID order,
        orderModelNumber = orderNumber order,
        orderProductModel = orderProducts
    } where
        orderProducts :: Maybe [ProductModel]
        orderProducts = 
            case maybeProduct of 
                Nothing -> Nothing
                Just products -> Just $ map (`fromProductToProductModel` Nothing) products

getOrders :: [OrderModel] 
getOrders = map (`fromOrderToOrderModel` Nothing) OR.getOrders

getOrder :: Int -> Maybe OrderModel
getOrder oid = 
    let maybeOrder = OR.getOrder oid
    in case maybeOrder of
        Nothing -> Nothing
        Just order -> Just $ fromOrderToOrderModel order products
            where 
                products = Just $ filter (\x -> productID x == oid) PR.getProducts
