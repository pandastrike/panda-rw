# panda-rw
Effortlessly Read and Write Data Files
<hr>
Ease the tedium of reading and writing data to files.  `panda-rw` provides the same API for all data types it supports.  It dynamically selects the format to use by examining the file extension.

```coffee
{call} = require "fairmont"
{read, write} = require "panda-rw"

data =
  id: "123456"
  key: "abcdef"

call ->
  # Write to a file as JSON
  yield write "/app/data.json", data

  # *OR* write to a file as YAML
  yield write "/app/data.yaml", data

  # Reading is just as easy.
  configJSON = yield read "/app/config.json"
  configYAML = yield read "/app/config.yaml"
```

## Supported Formats
- JSON
- YAML

## API
### Read
```
read <path>
```
Accepts a file path.  Returns a promise that either resolves with a JavaScript object of the file's data or rejects with an error.

### Write
```
read <path>, <content>
```
Accepts a file path and an object containing the data you wish to store.  Returns a promise that either resolves with the file writing successfully or rejects with an error. 
