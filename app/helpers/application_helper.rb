module ApplicationHelper
  def present(object, klass = nil)
    klass ||="#{object.class}Presenter".contantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
