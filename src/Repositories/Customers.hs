module Repositories.Customers (getCustomers, getCustomer) where

import Data.Entities (Customer(..))
import Lib (safeHead)

getCustomers :: [Customer]
getCustomers = [
    Customer {
        customerID = 1,
        customerName = "James Smith",
        customerAddress = "2600 S Hoover St, Los Angeles"
    },
    Customer {
        customerID = 2,
        customerName = "Jone Brown",
        customerAddress = "246 E Colden Ave, Los Angeles"
    },
    Customer {
        customerID = 3,
        customerName = "Emily Jones",
        customerAddress = "11643 Ruthelen St, Los Angeles"
    },
    Customer {
        customerID = 4,
        customerName = "Abigail Davis",
        customerAddress = "149 W 70th St, Los Angeles"
    }]

getCustomer :: Int -> Maybe Customer
getCustomer cid = safeHead $ filter (\x -> customerID x == cid) getCustomers