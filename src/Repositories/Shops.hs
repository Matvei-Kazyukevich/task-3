module Repositories.Shops (getShops, getShop) where

import Data.Entities (Shop(..))
import Lib (safeHead)

getShops :: [Shop]
getShops = [
    Shop {
        shopID = 1,
        shopName = "Apple",
        shopAddress = "8500 Beverly Boulevard, Los Angeles",
        shopProductID = 1
    },
    Shop {
        shopID = 1,
        shopName = "Apple",
        shopAddress = "8500 Beverly Boulevard, Los Angeles",
        shopProductID = 2
    },
    Shop {
        shopID = 2,
        shopName = "Samsung",
        shopAddress = "720 South Vail Avenue Suite A Montebello, Los Angeles",
        shopProductID = 3
    },
    Shop {
        shopID = 3,
        shopName = "Microsoft",
        shopAddress = "10250 Santa Monica Blvd, Los Angeles",
        shopProductID = 4
    },
    Shop {
        shopID = 3,
        shopName = "Microsoft",
        shopAddress = "10250 Santa Monica Blvd, Los Angeles",
        shopProductID = 5
    }]

getShop :: Int -> Maybe Shop
getShop sid = safeHead $ filter (\x -> shopID x == sid) getShops

