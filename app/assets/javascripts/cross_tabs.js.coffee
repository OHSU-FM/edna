##
# Cross Tab communication:
#
#   Usage:
#       (Send)
#       CrossTabs.trigger('Hello', {some: 55, data: 22})
#
#       (Receive)
#       $(document).on 'cross-tabs:Hello', (e, data) ->
#           console.log(data) # data = {some: 55, data: 22}
#
event_prefix = 'cross-tabs:'

window.CrossTabs = {
  trigger: (ename, msg) ->
    data = JSON.stringify(msg, null, 2)
    localStorage.setItem(event_prefix + ename, data)
}

cross_tabs_handler = (e) ->
  if e.key.startsWith(event_prefix)
    msg = JSON.parse(e.newValue);
    $(document).trigger(e.key, msg)

if window.addEventListener
  # Normal browsers
  window.addEventListener("storage", cross_tabs_handler, false);
else
  # for IE (why make your life more difficult)
  window.attachEvent("onstorage", cross_tabs_handler);

return
