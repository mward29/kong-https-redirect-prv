return {
  -- no_consumer = true,
  fields = {
    port = { type = "string", default = 443 },
    logging_enabled = { type = "boolean", default = true },
    debug_logging_enabled = { type = "boolean", default = false },
  }
}
