# coding: utf-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Voters", %q{
  In order to make a transparent application
  As a user
  I want to see my vote and all others
} do

  background do
    @user  = create_user(:name => "Andreu Buenafuente")
    @proposal = create_proposal(:title => "Ley Sinde")
    
    login_as @user
    
    visit proposal_path(@proposal)
    
    click_button "Sí"
    click_button "Estoy seguro"
  end

  context "Home page" do
    scenario "See my name as one of the voters" do
      visit root_path
      
      within(:css, "#voters") do
        page.should have_content("Andreu Buenafuente")
      end
    end
  end
  
  context "Proposal page" do
    scenario "See my name as one of the voters" do
      visit proposal_path(@proposal)
      
      within(:css, "#voters") do
        page.should have_content("Andreu Buenafuente")
      end
    end
  end
  
  context "Users page" do
    scenario "See my name as one of the voters" do
      visit users_path
      
      within(:css, "#voters") do
        page.should have_content("Andreu Buenafuente")
      end
    end
  end
  
  context "User page" do
    scenario "See my name as one of the voters" do
      visit user_path(@proposal)
      
      within(:css, "#voters") do
        page.should have_content("Andreu Buenafuente")
      end
    end
  end
  
  scenario "link name to user profile" do
    visit root_path
    
    within(:css, "#voters") do
      click_link "Andreu Buenafuente"
      page.current_path.should == user_path(@user)
    end
  end
  
  scenario "See all users that have voted" do
    user2  = create_user(:name => "Ignacio Escolar")
    login_as user2
    
    visit proposal_path(@proposal)
    
    click_button "Sí"
    click_button "Estoy seguro"
    visit root_path
    
    within(:css, "#voters") do
      page.should have_content("Andreu Buenafuente")
      page.should have_content("Ignacio Escolar")
    end
  end
  
end