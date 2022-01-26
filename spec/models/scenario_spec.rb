require 'rails_helper'

RSpec.describe Scenario, type: :model do
  before do
    @scenario = FactoryBot.build(:scenario)
  end

  describe 'シナリオ投稿機能' do
    context 'シナリオ投稿できる時' do
      it 'title,scenario,imageがありかつuserに紐づいていれば登録できる' do
        expect(@scenario).to be_valid
      end
    end

    context 'シナリオ投稿ができない時' do
      it 'titleが空白では登録できない' do
        @scenario.title = ''
        @scenario.valid?
        expect(@scenario.errors.full_messages).to include("Titleを入力してください") 
      end

      it 'titleが50文字以上では登録できない' do
          @scenario.title = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
          @scenario.valid?
          expect(@scenario.errors.full_messages).to include("Titleは50文字以内で入力してください")
      end

      it 'scenarioが空白では登録できない' do
        @scenario.scenario = ''
        @scenario.valid?
        expect(@scenario.errors.full_messages).to include("Scenarioを入力してください")
      end

      it 'imageが空白では登録できない' do
        @scenario.image = nil
        @scenario.valid?
        expect(@scenario.errors.full_messages).to include("Imageを入力してください")
      end

      
      it 'userと紐づいていなければ登録できない' do
        @scenario.user= nil
        @scenario.valid?
        expect(@scenario.errors.full_messages).to include("Userを入力してください")
      end
    
    end
  end
end
