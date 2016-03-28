assert = require "assert"
{async} = require "fairmont"
{join} = require "path"

{read} = require "../src"

module.exports = (context) ->
  # Classification data for Pandas.
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

  context.test "JSON", async ->
    data = yield read join(__dirname, "data", "panda.json")
    assert.deepEqual data, expected

  context.test "YAML", async ->
    data = yield read join(__dirname, "data", "panda.yaml")
    assert.deepEqual data, expected

  context.test "YAML as .yml", async ->
    data = yield read join(__dirname, "data", "panda.yml")
    assert.deepEqual data, expected
