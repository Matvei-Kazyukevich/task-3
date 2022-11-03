module Repositories.Products (getProducts, getProduct, getOrderProducts) where

import Data.Entities (Product(..), OrderProduct(..), productID)
import Data.Base (Color(..))
import Lib (safeHead)

getProducts :: [Product]
getProducts = [
        Product 1 1 "Phone" 700.00 Black,
        Product 2 1 "Headphones" 150.00 White,
        Product 3 2 "TV" 1000.00 Black,
        Product 4 3 "Laptop" 1200.00 Other,
        Product 5 3 "Console" 500.00 Black]

getProduct :: Int -> Maybe Product
getProduct pid = safeHead $ filter (\x -> productID x == pid) getProducts

getOrderProducts :: [OrderProduct]
getOrderProducts = [
        OrderProduct {
                orderProductID = 1,
                ordProdOrderID = 1,
                ordProdProductID = 1
        },
        OrderProduct {
                orderProductID = 2,
                ordProdOrderID = 1,
                ordProdProductID = 2
        },
        OrderProduct {
                orderProductID = 3,
                ordProdOrderID = 2,
                ordProdProductID = 3
        },
        OrderProduct {
                orderProductID = 4,
                ordProdOrderID = 3,
                ordProdProductID = 5
        },
        OrderProduct {
                orderProductID = 5,
                ordProdOrderID = 4,
                ordProdProductID = 1
        },
        OrderProduct {
                orderProductID = 6,
                ordProdOrderID = 4,
                ordProdProductID = 4
        }, 
        OrderProduct {
                orderProductID = 7,
                ordProdOrderID = 5,
                ordProdProductID = 5
        },
        OrderProduct {
                orderProductID = 8,
                ordProdOrderID = 5,
                ordProdProductID = 3
        }]
