#!/usr/bin/ruby -w

require "rubygems"
require "minitest/autorun"

require "zenweb/site"

class TestZenwebPageHaml < MiniTest::Unit::TestCase
  attr_accessor :site, :page

  def setup
    super

    self.site = Zenweb::Site.new
    self.page = Zenweb::Page.new site, File.join(File.dirname(__FILE__), "assets/foo.html.haml")
  end

  def test_render_haml
    act = page.render_haml page, nil
    exp = "<div>Not really much here to see.</div>\n"

    assert_equal exp, act
  end

  def test_haml
    act = page.haml "%div foo fah\n"
    exp = "<div>foo fah</div>\n"

    assert_equal exp, act
  end
end
