require 'rails_helper'

#User Story 5, Parent Children Index

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
RSpec.describe 'Team players index' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

    describe 'as a user' do
      describe 'when I visit/teams' do
        it 'shows all the players on that team and their attributes' do
          visit "/teams/#{@team_1.id}/players"
        
          expect(page).to have_content(@player_1.name)
          expect(page).to have_content(@player_2.name)
          expect(page).to have_content("Salary: #{@player_1.salary}")
          expect(page).to have_content("Salary: #{@player_2.salary}")
          expect(page).to have_content("Free Agent Next Season: #{@player_1.free_agent}")
          expect(page).to have_content("Free Agent Next Season: #{@player_2.free_agent}")
      end
    end
  end
end