require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
  end
end
