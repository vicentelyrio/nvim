-- Biome runs alongside tsgo purely for lint diagnostics / code actions.
-- Explicitly drop its formatting capability so it never becomes a
-- formatter (that's handled outside nvim, via `biome check` / CLI / git hooks).
return {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
