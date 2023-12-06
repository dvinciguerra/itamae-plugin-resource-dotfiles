# frozen_string_literal: true

require 'itamae/resource/base'

require_relative 'dotfiles/version'

module Itamae
  module Plugin
    module Resource
      class Dotfiles < Itamae::Resource::Base
        define_attribute :action, default: :install
        define_attribute :source, type: String, default_name: true
        define_attribute :target, type: String

        def pre_action
          case @current_action
          when :install
            attributes.installed = true
          when :uninstall
            attributes.installed = false
          end
        end

        def action_install(_options)
          return if current.installed

          source_path = "#{File.expand_path(__dir__)}/config/#{attributes.source}"
          target_path = File.join(Dir.home, attibutes.target)

          directory File.dirname(target_path)

          link target_path do
            to source_path
            force true
          end
        end
      end
    end
  end
end
