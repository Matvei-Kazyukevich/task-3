module Main (main) where

import Prelude hiding (product)
import Services.Products (getProducts, getProduct)
import Services.Shops (getShops, getShop)
import Services.Orders (getOrders, getOrder)

main :: IO ()
main = do
    putStrLn "======= Products ======="
    let products = getProducts
    print products

    putStrLn "====== Product ======"
    let product = getProduct 2
    print product

    putStrLn "======= Shops ======="
    let shops = getShops
    print shops

    putStrLn "======= Shop ======="
    let shop = getShop 1
    print shop

    putStrLn "======= Orders ======="
    let orders = getOrders
    print orders

    putStrLn "======= Order ======="
    let order = getOrder 2
    print order
