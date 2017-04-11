local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.https-redirect.access"

local HttpsRedirectHandler = BasePlugin:extend()

HttpsRedirectHandler.PRIORITY = 2000

function HttpsRedirectHandler:new()
  HttpsRedirectHandler.super.new(self, "https-redirect")
end

function HttpsRedirectHandler:access(conf)
  HttpsRedirectHandler.super.access(self)
  access.execute(conf)
end

return HttpsRedirectHandler
