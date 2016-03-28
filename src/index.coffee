{async, read, write, Method, isString, isObject} = require "fairmont"
{safeLoad, safeDump} = require "js-yaml"
mime = require "mime"

isYAML = (path) ->
  return false if !isString path
  if mime.lookup(path) == "text/yaml" then true else false

isJSON = (path) ->
  return false if !isString path
  if mime.lookup(path) == "application/json" then true else false

_read = Method.create default: ->
  Promise.reject new TypeError "Unrecognized filetype."
Method.define _read, isJSON, async (path) -> JSON.parse yield read path
Method.define _read, isYAML, async (path) -> safeLoad yield read path

_write = Method.create default: ->
  Promise.reject new TypeError "Unrecognized filetype or object syntax."
Method.define _write, isJSON, isObject, async (path, content) ->
  yield write path, JSON.stringify(content, null, 2)
Method.define _write, isYAML, isObject, async (path, content) ->
  yield write path, safeDump(content)

module.exports = {read: _read, write: _write}
