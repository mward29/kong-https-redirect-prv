local url = require "socket.url"
local pl_stringx = require "pl.stringx"

local helpers = require "kong.plugins.rewrite.helpers"
local log = helpers.log.error

local _M = {}

function _M.execute(conf)
  local scheme = (ngx.var.scheme or ""):lower()
  if scheme == 'http' then
    local redirect_url = "https://" .. ngx.var.host
    if conf.port ~= "443" then
      redirect_url = redirect_url .. ":" .. conf.port
    end
    redirect_url = redirect_url .. ngx.var.request_uri
    ngx.redirect(redirect_url)
    return
  end
end

return _M
