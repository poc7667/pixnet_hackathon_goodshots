require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :month => 1,
        :hour => 2,
        :small_square => "MyText",
        :square => "MyText",
        :weather => "",
        :image_id => "MyText",
        :size => "MyText",
        :category => "MyText",
        :thumb => "MyText",
        :exif => "",
        :title => "MyText",
        :tags => "MyText",
        :location => "",
        :type => "MyText",
        :medium => "MyText",
        :description => "MyText",
        :normal => "MyText",
        :link => "MyText",
        :user => "",
        :bigger => "MyText",
        :hits => "",
        :uploaded_at => "MyText",
        :url => "MyText",
        :original => "MyText",
        :large => "MyText",
        :taken_at => "MyText",
        :dimension => "",
        :focal_length => "MyText",
        :date_taken => "MyText",
        :aperture => "MyText",
        :camera => "MyText",
        :metering_mode => "MyText",
        :iso_speed_ratings => "MyText",
        :city => 3
      ),
      stub_model(Image,
        :month => 1,
        :hour => 2,
        :small_square => "MyText",
        :square => "MyText",
        :weather => "",
        :image_id => "MyText",
        :size => "MyText",
        :category => "MyText",
        :thumb => "MyText",
        :exif => "",
        :title => "MyText",
        :tags => "MyText",
        :location => "",
        :type => "MyText",
        :medium => "MyText",
        :description => "MyText",
        :normal => "MyText",
        :link => "MyText",
        :user => "",
        :bigger => "MyText",
        :hits => "",
        :uploaded_at => "MyText",
        :url => "MyText",
        :original => "MyText",
        :large => "MyText",
        :taken_at => "MyText",
        :dimension => "",
        :focal_length => "MyText",
        :date_taken => "MyText",
        :aperture => "MyText",
        :camera => "MyText",
        :metering_mode => "MyText",
        :iso_speed_ratings => "MyText",
        :city => 3
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
