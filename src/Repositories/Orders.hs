module Repositories.Orders (getOrders, getOrder) where

import Data.Entities (Order(..))
import Lib (safeHead)

getOrders :: [Order]
getOrders = [
    Order {
        orderID = 1,
        orderCustomerID = 1,
        orderNumber = "WE49JK0"
    },
    Order {
        orderID = 2,
        orderCustomerID = 2,
        orderNumber = "GH87HQ1"
    },
    Order {
        orderID = 3,
        orderCustomerID = 2,
        orderNumber = "FC37AC0"
    }, 
    Order {
        orderID = 4,
        orderCustomerID = 3,
        orderNumber = "JP03VS7"
    },
    Order {
        orderID = 5,
        orderCustomerID = 4,
        orderNumber = "LX81HB3"
    }] 

getOrder :: Int -> Maybe Order
getOrder oid = safeHead $ filter (\x -> orderID x == oid) getOrders