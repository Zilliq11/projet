require 'test_helper'
 class ApplicationHelperTest < ActionView::TestCase
   attr_reader :request
   
   def current_path?(path)
     assert_dom_equal %{<li class=""><a href="path">toto</a></li>},
        nav_link('toto', 'path')
   end
   
   test 'inactive link' do
      assert_dom_equal %{<li class=""><a href="/cities">toto</a></li>},
        nav_link('toto', '/cities')
   end
 end