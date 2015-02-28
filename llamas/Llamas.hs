{-# LANGUAGE RebindableSyntax, OverloadedStrings #-}

import Fay.Text (append, fromString)
import FFI
import JQuery
import Prelude

officialName n = Fay.Text.append n " the Magnificent"

handleClick :: Event -> Fay Bool
handleClick e = do
  nameText <- select "#name-text"
  officialText <- select "#official-name"
  name <- getVal nameText
  (flip setHtml) officialText $ officialName name
  return True

-- `ready` is the same as jQuery(document).ready(%1);
-- You generally need to wait for this event to fire before modifying the DOM.
main :: Fay ()
main = ready $ do
  submitBtn <- select "#name-submit"
  onClick handleClick submitBtn

  return ()
