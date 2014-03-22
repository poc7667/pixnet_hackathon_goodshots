require 'spec_helper'

describe "spatials/new" do
  before(:each) do
    assign(:spatial, stub_model(Spatial,
      :shap1 => "MyText",
      :shp2 => "MyText",
      :path => "MyString",
      :lonlat => "MyText",
      :lon => 1.5,
      :lat => 1.5
    ).as_new_record)
  end

  it "renders new spatial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spatials_path, "post" do
      assert_select "textarea#spatial_shap1[name=?]", "spatial[shap1]"
      assert_select "textarea#spatial_shp2[name=?]", "spatial[shp2]"
      assert_select "input#spatial_path[name=?]", "spatial[path]"
      assert_select "textarea#spatial_lonlat[name=?]", "spatial[lonlat]"
      assert_select "input#spatial_lon[name=?]", "spatial[lon]"
      assert_select "input#spatial_lat[name=?]", "spatial[lat]"
    end
  end
end
