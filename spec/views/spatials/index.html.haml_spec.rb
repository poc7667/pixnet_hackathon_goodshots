require 'spec_helper'

describe "spatials/index" do
  before(:each) do
    assign(:spatials, [
      stub_model(Spatial,
        :shap1 => "MyText",
        :shp2 => "MyText",
        :path => "Path",
        :lonlat => "MyText",
        :lon => 1.5,
        :lat => 1.5
      ),
      stub_model(Spatial,
        :shap1 => "MyText",
        :shp2 => "MyText",
        :path => "Path",
        :lonlat => "MyText",
        :lon => 1.5,
        :lat => 1.5
      )
    ])
  end

  it "renders a list of spatials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
