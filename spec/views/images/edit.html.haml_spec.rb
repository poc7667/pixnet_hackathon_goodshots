require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :month => 1,
      :hour => 1,
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
      :city => 1
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_path(@image), "post" do
      assert_select "input#image_month[name=?]", "image[month]"
      assert_select "input#image_hour[name=?]", "image[hour]"
      assert_select "textarea#image_small_square[name=?]", "image[small_square]"
      assert_select "textarea#image_square[name=?]", "image[square]"
      assert_select "input#image_weather[name=?]", "image[weather]"
      assert_select "textarea#image_image_id[name=?]", "image[image_id]"
      assert_select "textarea#image_size[name=?]", "image[size]"
      assert_select "textarea#image_category[name=?]", "image[category]"
      assert_select "textarea#image_thumb[name=?]", "image[thumb]"
      assert_select "input#image_exif[name=?]", "image[exif]"
      assert_select "textarea#image_title[name=?]", "image[title]"
      assert_select "textarea#image_tags[name=?]", "image[tags]"
      assert_select "input#image_location[name=?]", "image[location]"
      assert_select "textarea#image_type[name=?]", "image[type]"
      assert_select "textarea#image_medium[name=?]", "image[medium]"
      assert_select "textarea#image_description[name=?]", "image[description]"
      assert_select "textarea#image_normal[name=?]", "image[normal]"
      assert_select "textarea#image_link[name=?]", "image[link]"
      assert_select "input#image_user[name=?]", "image[user]"
      assert_select "textarea#image_bigger[name=?]", "image[bigger]"
      assert_select "input#image_hits[name=?]", "image[hits]"
      assert_select "textarea#image_uploaded_at[name=?]", "image[uploaded_at]"
      assert_select "textarea#image_url[name=?]", "image[url]"
      assert_select "textarea#image_original[name=?]", "image[original]"
      assert_select "textarea#image_large[name=?]", "image[large]"
      assert_select "textarea#image_taken_at[name=?]", "image[taken_at]"
      assert_select "input#image_dimension[name=?]", "image[dimension]"
      assert_select "textarea#image_focal_length[name=?]", "image[focal_length]"
      assert_select "textarea#image_date_taken[name=?]", "image[date_taken]"
      assert_select "textarea#image_aperture[name=?]", "image[aperture]"
      assert_select "textarea#image_camera[name=?]", "image[camera]"
      assert_select "textarea#image_metering_mode[name=?]", "image[metering_mode]"
      assert_select "textarea#image_iso_speed_ratings[name=?]", "image[iso_speed_ratings]"
      assert_select "input#image_city[name=?]", "image[city]"
    end
  end
end
