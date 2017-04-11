local url = require "socket.url"
local pl_stringx = require "pl.stringx"

local function log(...)
  ngx.log(ngx.ERR, ...)
end

local _M = {}

function _M.execute(conf)
  local scheme = (ngx.var.scheme or ""):lower()
  if scheme == 'http' then
    local redirect_url = "https://" .. ngx.var.host
    if conf.port ~= "443" then
      redirect_url = redirect_url .. ":" .. conf.port
    end
    redirect_url = redirect_url .. ngx.var.request_uri
    log("Request for http://"..ngx.var.host .. ngx.var.request_uri .. " redirected to "..redirect_url)
    ngx.redirect(redirect_url)
  end
end

return _M
