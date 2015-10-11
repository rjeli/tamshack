module ApplicationHelper
  ALERT_TYPES = { :alert => :error, :info => :info, :notice => :success, :warning => :warning } unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash
      flash.map do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      # This will leave a nil value in the resulting array
      next if message.blank?

      # Skip if it's not a valid alert type
      # This will leave a nil value in the resulting array
      type = type.to_sym
      next unless ALERT_TYPES.keys.include?(type)

      # return the markup for the alert
      content_tag(:div, class: "alert alert-#{ALERT_TYPES[type]} fade in") do
        # use safe_concat() to avoid using html_safe()
        content_tag(:button, raw("&times;"), class: "close", data: { dismiss: "alert" }).safe_concat(message)
      end
    end.join('') # no need to join with \n --> this way nil values will be ignored as well
  end
end
