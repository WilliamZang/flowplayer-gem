module Flowplayer::Generator
  class InstallGenerator < ::Rails::Generators::Base
    namespace 'flowplayer'
    source_root File.expand_path("../../../../../app/assets/", __FILE__)
    class_option :without_asset_pipeline, :type => :boolean, :default => false, :desc => "Place assets in public folder"
    argument :install_type, :type => :string, :banner => "commercial", :required => false, :default => ''

    def install_flowplayer
      if options[:without_asset_pipeline]
        copy_file 'javascripts/flowplayer-3.2.11.min.js', Rails.root.join("public", 'javascripts', 'flowplayer.min.js')
      end
    end

    def install_swfs
      if install_type == 'commercial'
        copy_file 'flash/flowplayer.commercial-3.2.15.swf', Rails.root.join('public', 'flowplayer.swf')
      else
        copy_file 'flash/flowplayer-3.2.15.swf', Rails.root.join('public', 'flowplayer.swf')
        copy_file '../../FLOWPLAYER_LICENSE.txt', Rails.root.join('FLOWPLAYER_LICENSE.txt')
      end
      copy_file 'flash/flowplayer.controls-3.2.14.swf', Rails.root.join('public', 'flowplayer.controls.swf')
    end
  end
end
