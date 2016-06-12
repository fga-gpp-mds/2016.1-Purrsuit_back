require 'spec_helper'

describe QuestsController do

	#Missing #edit #all #show
	
	describe 'GET #new' do
		it "assigns a new Quest to @Quest" do
			get :new
			expect(assigns(:quest)).to be_a_new(Quest)
		end
	end

	describe 'POST #create' do
		context "with valids attributes" do
			it "saves the new quest in the database" do
				expect{
					post 'create', quest: attributes_for(:quest)	
				}.to change(Quest, :count).by(1)
			end
		end
		context "with invalids attibutes" do
			it "does not save the quest in the database" do
				expect{
					post 'create', quest: attributes_for(:quest, name: nil)
				}.to_not change(Quest, :count)
			end
		end
	end
	
	describe 'DELETE #delete' do
		it "delete a quest with a given id" do
			quest_example = create(:quest)
			expect{
				delete 'delete', :id => quest_example.id
			}.to change(Quest, :count).by(-1)
		end
	end

	describe 'PATCH #update' do
		it "changes a quest attribute" do
			quest = create(:quest)
			old_name = quest.name
			patch 'update', id: quest, quest: attributes_for(:quest, name: "A different name")
			new_name = quest.name
			expect(new_name!=old_name)
		end
	end
end
