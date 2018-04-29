module FlashesHelper
  FLASH_CLASSES = { dark: "dark", light: "light", info: "info", success: "success", primary: "primary", secondary: "secondary", danger: "danger", alert: "danger", notice: "success", warning: "warning"}.freeze
  
  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "dark", "light", "info", "success", "primary", "secondary", "danger", "alert", "notice","warning" 
  end

end
