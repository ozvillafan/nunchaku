require 'core_ext/string'
require 'core_ext/hash'
require 'responders'
require 'super_resources'
require 'closure_tree'
require 'has_scope'
require 'kaminari'
require 'ransack'
require 'draper'
require 'cancan'
require 'acts_as_list'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'font-awesome-sass'
require 'bootstrap-datepicker-rails'
require 'bootstrap-x-editable-rails'
require 'select2-rails'
require 'gritter'
require 'wicked_pdf'
require 'sorted'
require 'csv'
require 'kramdown'

module Nunchaku
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :fixture => false, :view_specs => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    config.to_prepare do
      Nunchaku::ActiveRecord.alias_macros(
      #  has_many:

        integrates: %i(has_components divides_into),
        has_materials: %i(is_made_of is_partly),
        has_portions_of: %i(has_slices_of),
      #  places:
        bunches: %i(groups collects),
      #  partners:

      #  owns:
      #  classifies:
      #  has_attachments:
      #  ascribes:
        encompasses: %i(surrounds encloses contains houses),

        belongs_to: %i(associates links),

        is_component_of: %i(is_part_of is_piece_of),
      #  makes:
      #  is_portion_of:
        is_in_the_area_of: %i(is_placed_in),
        is_bunched_in: %i(is_surrounded_by is_grouped_by is_collected_by is_housed_by),
        is_partner_in: %i(connects),

      #  is_owned_by:
      #  is_classified_by:
        is_in: %i(visits is_located_in),
      #  has_property:
      )
    end
  end
end
