-- | This module encapsulates the logic for reading or modifying the environment.
module Dotenv.Internal.Environment
  ( ENVIRONMENT
  , EnvironmentF(..)
  , handleEnvironment
  , lookupEnv
  , setEnv
  ) where

import Prelude

import Data.Maybe (Maybe)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Node.Process (lookupEnv, setEnv) as P
import Run (Run, lift)

-- | A data type representing the supported operations.
data EnvironmentF a
  = LookupEnv String (Maybe String -> a)
  | SetEnv String String a

derive instance functorEnvironmentF :: Functor EnvironmentF

-- | The effect type used for reading or modifying the environment
type ENVIRONMENT r = (environment :: EnvironmentF | r)

-- | The default interpreter used for reading or modifying the environment
handleEnvironment :: EnvironmentF ~> Aff
handleEnvironment op = liftEffect $
  case op of
    LookupEnv name callback -> do
      value <- P.lookupEnv name
      pure $ callback value
    SetEnv name value next -> do
      P.setEnv name value
      pure next

-- | Constructs the value used to look up an environment variable.
lookupEnv :: forall r. String -> Run (ENVIRONMENT r) (Maybe String)
lookupEnv name = lift @"environment" (LookupEnv name identity)

-- | Constructs the value used to set an environment variable.
setEnv :: forall r. String -> String -> Run (ENVIRONMENT r) Unit
setEnv name value = lift @"environment" (SetEnv name value unit)
