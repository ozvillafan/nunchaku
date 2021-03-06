module Nunchaku::ResourcesInputHelper
  def simple_form_for(object, options={}, &block)
    options.reverse_merge!  :builder => builder,
                            :url => create_or_update_resource_path(object, options[:without_nesting])

    super(object, options, &block)
  end

  def builder
    builder_class_for(resource_class.name)
  end

  def builder_class_for(name)
    "#{name}FormBuilder".constantize

    rescue NameError => e
      default_builder
  end

  def builder_for(name)
    builder_class_for(name).new(name.demodulize.underscore.to_sym, name.safe_constantize.new, self, {})
  end

  def form_element_names
  	decorator_class.form_element_names
  end

  def form_options
    decorator_class.try(:form_options)
  end

  def form_heading(action)
    t("form.#{resource_class.name.underscore}.heading.#{action.to_s}",
    :default => "#{I18n.t(action)} #{resource_class.model_name.human.titleize}"
    )
  end

  def default_builder
    action_name.in?(%w(show)) ? Nunchaku::DisabledFormBuilder : Nunchaku::ResourceFormBuilder
  end
end
