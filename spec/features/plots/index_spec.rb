require 'rails_helper'

RSpec.describe 'plot index page' do
  turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
  library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
  other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

  turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
  turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
  library_garden.plots.create!(number: 2, size: "Small", direction: "South")
  other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

  plant1 = Plant.create!(name: "Example 1", description: "artificial plant", days_to_harvest: 12)
  plant2 = Plant.create!(name: "another plant", description: "wow trees", days_to_harvest: 47)
  plant3 = Plant.create!(name: "third option", description: "grass", days_to_harvest: 6)

  PlantPlot.create!(plot_id: 1, plant_id: 1)
  PlantPlot.create!(plot_id: 2, plant_id: 2)
  PlantPlot.create!(plot_id: 3, plant_id: 3)


  it "shows a list of all plot numbers" do
    visit "/plots"
    expect(page).to have_content("25")
    expect(page).to have_content("26")
    expect(page).to have_content("2")
    expect(page).to have_content("738")
    expect(page).not_to have_content("111")
  end

  it "shows a list of plants under each plot" do
    visit "/plots"
    expect(page).to have_content("Example 1")
    expect(page).to have_content("another plant")
    expect(page).to have_content("third option")
    expect(page).not_to have_content("Does Not Exist")
  end
end
