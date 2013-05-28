# encoding: utf-8

module BooksHelper
  def rating_select_tag(name, options = {})
    select_tag name, options_for_select([
      ['No rating', 0.0],
      ['★☆☆☆☆', 1.0],
      ['★★☆☆☆', 2.0],
      ['★★★☆☆', 3.0],
      ['★★★★☆', 4.0],
      ['★★★★★', 5.0],
    ], options.delete(:value)), options
  end
end
