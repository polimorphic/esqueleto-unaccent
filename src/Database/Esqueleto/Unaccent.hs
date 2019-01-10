{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Unaccent (unaccent) where

import Database.Esqueleto (Esqueleto, SqlBackend, SqlExpr, SqlQuery, SqlString, Value)
import Database.Esqueleto.Internal.Sql (unsafeSqlFunction)

class Esqueleto query expr backend => EsqueletoUnaccent query expr backend where
    unaccent :: SqlString a => expr (Value a) -> expr (Value a)

instance EsqueletoPgtrgm SqlQuery SqlExpr SqlBackend where
    unaccent a = unsafeSqlFunction "unaccent" a