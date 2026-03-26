swayimg.text.hide()

swayimg.on_window_resize(function()
  swayimg.viewer.set_fix_scale("optimal")
end)

swayimg.viewer.on_key("Right", function()
  swayimg.viewer.switch_image("next")
end)

swayimg.viewer.on_key("Left", function()
  swayimg.viewer.switch_image("prev")
end)

swayimg.text.set_font("Roboto Mono")
swayimg.text.set_size(16)
swayimg.text.set_foreground(0xffffffff)
swayimg.text.set_background(0xaa000000)
swayimg.text.set_shadow(0x00000000)
