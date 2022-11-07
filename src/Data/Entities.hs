module Data.Entities (Product(..), Shop(..), Order(..), Customer(..), productID, productShopID, productOrderID, productName, productPrice, productColor) where

import Data.Base (Color(..))

type ProductID = Int
type ProductShopID = Int
type ProductOrderID = Int
type ProductName = String
type ProductPrice = Double
type ProductColor = Color

data Product = Product ProductID ProductShopID ProductOrderID ProductName ProductPrice ProductColor
    deriving (Show)

productID :: Product -> ProductID
productID (Product pid _ _ _ _ _) = pid

productShopID :: Product -> ProductShopID
productShopID (Product _ psid _ _ _ _) = psid

productOrderID :: Product -> ProductOrderID
productOrderID (Product _ _ poid _ _ _) = poid

productName :: Product -> ProductName
productName (Product _ _ _ name _ _) = name

productPrice :: Product -> ProductPrice
productPrice (Product _ _ _ _ price _) = price

productColor :: Product -> ProductColor
productColor (Product _ _ _ _ _ color) = color

data Shop = Shop {
      shopID :: Int
    , shopName :: String
    , shopAddress :: String
    , shopProductID :: Int
} deriving (Show)

data Customer = Customer {
      customerID :: Int
    , customerName :: String
    , customerAddress :: String  
} deriving (Show)

data Order = Order {
      orderID :: Int
    , orderCustomerID :: Int
    , orderNumber :: String 
} deriving (Show)

-- data OrderProduct = OrderProduct {
--     orderProductID :: Int
--   , ordProdOrderID :: Int
--   , ordProdProductID :: Int
-- } deriving (Show)
