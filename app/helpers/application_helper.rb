module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join( " - ") unless parts.empty?
      end
    end
  end

  def header_title(*parts)
    unless parts.empty?
      content_for :header_title do
        parts.join(" - ") unless parts.empty?
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) || current_user.try(:admin?)
    nil
  end
end
