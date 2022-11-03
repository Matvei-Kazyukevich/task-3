module Data.Models (ProductModel(..), ShopModel(..), CustomerModel(..), OrderModel(..), productModelID, productShopModel, productModelName, productModelPrice, productModelColor) where

import Data.Base (Color)

type ProductModelID = Int
type ProductModelName = String
type ProductModelPrice = Double
type ProductModelColor = Color

data ProductModel = ProductModel ProductModelID ProductModelName ProductModelPrice ProductModelColor (Maybe ShopModel)
    deriving (Show)

productModelID :: ProductModel -> ProductModelID
productModelID (ProductModel pid _ _ _ _) = pid

productModelName :: ProductModel -> ProductModelName
productModelName (ProductModel _ name _ _ _) = name

productModelPrice :: ProductModel -> ProductModelPrice
productModelPrice (ProductModel _ _ price _ _) = price

productModelColor :: ProductModel -> ProductModelColor 
productModelColor (ProductModel _ _ _ color _) = color

productShopModel :: ProductModel -> Maybe ShopModel
productShopModel (ProductModel _ _ _ _ productShop) = productShop

data ShopModel = ShopModel {
      shopModelID :: Int
    , shopModelName :: String
    , shopModelAddress :: String
    , shopProductModel :: Maybe [ProductModel]
} deriving (Show)

data CustomerModel = CustomerModel {
      customerModelID :: Int
    , customerModelName :: String
    , customerModelAddress :: String
    , customerOrderModel :: Maybe [OrderModel]
} deriving (Show)

data OrderModel = OrderModel {
      orderModelID :: Int
    , orderModelNumber :: String
    -- , orderCustomerModel :: Maybe CustomerModel
    , orderProductModel :: Maybe [ProductModel]
} deriving (Show)
