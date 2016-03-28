Amen = require "amen"

Amen.describe "Read Functions", (context) ->
  require("./read")(context)
  Amen.describe "Write Functions", (context) ->
    require("./write")(context)
