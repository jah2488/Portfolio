require 'spec_helper'

describe "projects/edit.html.haml" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "MyString",
      :description => "MyText",
      :language => "MyString",
      :deployed => false,
      :platform => "MyString",
      :db => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_language", :name => "project[language]"
      assert_select "input#project_deployed", :name => "project[deployed]"
      assert_select "input#project_platform", :name => "project[platform]"
      assert_select "input#project_db", :name => "project[db]"
      assert_select "input#project_notes", :name => "project[notes]"
    end
  end
end
