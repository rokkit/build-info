module BuildObjectsHelper
  def sell_status status
    status.nil? ? "Продаётся" : status
  end
end
