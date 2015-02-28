{-# LANGUAGE RebindableSyntax, OverloadedStrings #-}

import Fay.Text (fromString)
import FFI
import JQuery
import Prelude

handleClick :: Event -> Fay Bool
handleClick e = do
  nameText <- select "#name-text"
  officialName <- select "#official-name"
  name <- getVal nameText
  setHtml name officialName
  return True

-- `ready` is the same as jQuery(document).ready(%1);
-- You generally need to wait for this event to fire before modifying the DOM.
main :: Fay ()
main = ready $ do
  submitBtn <- select "#name-submit"
  onClick handleClick submitBtn

  return ()
