local status_ok, mdeval = pcall(require, "mdeval")
if not status_ok then
  return
end

mdeval.setup({
  -- Don't ask before executing code blocks
  require_confirmation=false,
  -- Change code blocks evaluation options.
  eval_options = {
  },
})
