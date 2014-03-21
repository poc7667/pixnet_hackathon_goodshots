require 'spec_helper'

describe "spatials/show" do
  before(:each) do
    @spatial = assign(:spatial, stub_model(Spatial,
      :shap1 => "MyText",
      :shp2 => "MyText",
      :path => "Path",
      :lonlat => "MyText",
      :lon => 1.5,
      :lat => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Path/)
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
