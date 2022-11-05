module Repositories.Products (getProducts, getProduct) where

import Data.Entities (Product(..), productID)
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
