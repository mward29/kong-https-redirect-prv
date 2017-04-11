local url = require "socket.url"
local pl_stringx = require "pl.stringx"

local function log(...)
  ngx.log(ngx.ERR, ...)
end

local _M = {}

function _M.execute(conf)
  local scheme = (ngx.var.scheme or ""):lower()
  local logging_enabled = conf.logging_enabled
  local debug_logging_enabled = conf.debug_logging_enabled

  if debug_logging_enabled then
    log("Request for " .. scheme .. "://"..ngx.var.host .. ngx.var.request_uri)
  end
  if scheme == 'http' then
    local redirect_url = "https://" .. ngx.var.host
    if conf.port ~= "443" then
      redirect_url = redirect_url .. ":" .. conf.port
    end
    redirect_url = redirect_url .. ngx.var.request_uri
    if logging_enabled then
      log("Request for http://"..ngx.var.host .. ngx.var.request_uri .. " redirected to "..redirect_url)
    end
    ngx.redirect(redirect_url)
  end
end

return _M
