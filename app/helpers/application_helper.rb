module ApplicationHelper
  def link_away(name, options = {}, html_options = nil)
    link_to(name, { :return_uri => url_for(:only_path => true) }.update(options.symbolize_keys), html_options)
  end
=begin
  def link_to(*args, &block)
    if block_given?
      args = [(args.first || {}), (args.second || {}).merge(:target => '_blank')]
    else
      args = [(args.first || {}), (args.second || {}), (args.third || {}).merge(:target => '_blank')]
    end
    super(args, block)
  end
=end
end
