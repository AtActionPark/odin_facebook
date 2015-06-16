require 'rails_helper'

describe "Static Pages" do
  subject { page }
  before  { visit root_path }

  it { should have_link("Home") }
  it { should have_link("Help") }
  it { should have_link("Log in") }
  it { should have_link("About") }
  it { should have_link("Contact") }

end
