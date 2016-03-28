assert = require "assert"
{join} = require "path"
{async} = require "fairmont"

{read, write} = require "../src"


expected =
  Kingdom: "Animalia"
  Phylum: "Chordata"
  Clade: "Synapsida"
  Class: "Mammalia"
  Order: "Carnivora"
  Suborder:	"Caniformia"
  Family: "Ursidae"
  Genus: "Ailuropoda"
  Species: "A. melanoleuca"


module.exports = (context) ->

  context.test "JSON", async ->
    path = join(__dirname, "data", "scratch", "panda.json")
    yield write path, expected
    data = yield read path
    assert.deepEqual data, expected

  context.test "YAML", async ->
    path = join(__dirname, "data", "scratch", "panda.yaml")
    yield write path, expected
    data = yield read path
    assert.deepEqual data, expected
