local rest = require "rest-nvim"

rest.setup {
  result_split_horizontal = false,
  skip_ssl_verification = false,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    show_url = true,
    show_http_info = true,
    show_headers = true,
  },
  jump_to_request = false,
  env_file = ".env",
}
